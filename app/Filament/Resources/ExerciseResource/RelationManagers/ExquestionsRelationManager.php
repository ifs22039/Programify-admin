<?php

namespace App\Filament\Resources\ExerciseResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Components\Radio;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Utils\MyHelper;

class ExquestionsRelationManager extends RelationManager
{
    protected static string $relationship = 'exquestions';

    protected static ?string $title = 'Questions';

    public function form(Form $form): Form
    {
        return $form
            ->schema([]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('content')
            ->columns([
                Tables\Columns\TextColumn::make('content')
                    ->label("Question")
                    ->html()
                    ->wrap()
                    ->grow(false)
                    ->tooltip(fn($record) => strip_tags($record->content)),
                Tables\Columns\TextColumn::make('type')
                    ->label('Type')
                    ->badge()
                    ->formatStateUsing(fn($state) => MyHelper::questionType($state)),
                Tables\Columns\TextColumn::make('point')
                    ->label('Reward')
                    ->badge()
                    ->formatStateUsing(fn($record) => $record->point . " Point <br/> <hr/>" . $record->exp . " Exp")
                    ->html(),
                Tables\Columns\TextColumn::make('exanswers.content')
                    ->html()
                    ->label('Options')
                    ->formatStateUsing(fn($record) => $record->exanswers->pluck('content')
                        ->implode('<br>'))
                    ->wrap()
            ])
            ->filters([])
            ->headerActions([
                Tables\Actions\CreateAction::make()
                    ->label("New Question")
                    ->modalHeading("New Question")
                    ->modal(false)
                    ->url(fn() => route('filament.admin.resources.ex-questions.create', ['exercise_id' => $this->ownerRecord->id])),
                Tables\Actions\Action::make('generate_from_pdf')
                    ->label('Generate from PDF')
                    ->icon('heroicon-o-document-arrow-up')
                    ->form([
                        Forms\Components\TextInput::make('topic_name')
                            ->label('Name')
                            ->placeholder('Enter topic name')
                            ->required(),
                        Forms\Components\Textarea::make('prompt')
                            ->label('Prompt for Question Generation')
                            ->placeholder('e.g., Generate 10 multiple choice questions about the main concepts in this document')
                            ->helperText('Describe how you want the questions to be generated from the PDF')
                            ->rows(3),
                        Forms\Components\FileUpload::make('pdf_file')
                            ->label('Upload File')
                            ->acceptedFileTypes(['application/pdf'])
                            ->required()
                            ->disk('public')
                            ->helperText('PDF only (max. 10MB). Upload a PDF document to generate questions automatically based on your prompt')
                            ->columnSpanFull(),
                        
                        Forms\Components\Section::make('Configuration')
                            ->schema([
                                Forms\Components\TextInput::make('default_point')
                                    ->label('Default Points')
                                    ->numeric()
                                    ->default(10)
                                    ->required(),
                                Forms\Components\TextInput::make('default_exp')
                                    ->label('Default EXP')
                                    ->numeric()
                                    ->default(10)
                                    ->required(),
                                Forms\Components\Select::make('difficulty')
                                    ->options([
                                        'easy' => 'Easy',
                                        'medium' => 'Medium',
                                        'hard' => 'Hard',
                                    ])
                                    ->default('medium')
                                    ->required(),
                            ])->columns(3)->collapsed(),
                    ])
                    ->action(function (array $data, $livewire) {
                        $service = new \App\Services\QuestionGeneratorService();

                        try {
                            // 1. Upload PDF and get text
                            $uploadResult = $service->uploadPdf($data['pdf_file']);
                            $text = $uploadResult['text'];
                            $sourceId = $uploadResult['source_id'];

                            // 2. Generate Questions
                            $prompt = $data['prompt'] ?? null;
                            $questionsData = $service->generateQuestions($text, $sourceId, 5, $prompt);

                            $exerciseId = $livewire->ownerRecord->id;
                            $count = 0;

                            foreach ($questionsData as $qData) {
                                // Create Question
                                $question = \App\Models\ExQuestion::create([
                                    'content' => $qData['question'] ?? 'Generated Question',
                                    'type' => 'multiple_choice',
                                    'exercise_id' => $exerciseId,
                                    'point' => $data['default_point'],
                                    'exp' => $data['default_exp'],
                                    'difficulty' => $data['difficulty'],
                                ]);

                                // Create Answers
                                if (isset($qData['options']) && is_array($qData['options'])) {
                                    $correctAnswerRaw = $qData['answer'] ?? null;
                                    
                                    foreach ($qData['options'] as $index => $optionText) {
                                        $isCorrect = false;
                                        
                                        // Logic to determine if this option is the correct answer
                                        // 1. Exact match
                                        if ($correctAnswerRaw === $optionText) {
                                            $isCorrect = true;
                                        } 
                                        // 2. Index match (if answer is 0, 1, 2...)
                                        elseif (is_numeric($correctAnswerRaw) && (int)$correctAnswerRaw === $index) {
                                            $isCorrect = true;
                                        }
                                        // 3. Letter match (A, B, C, D)
                                        elseif (is_string($correctAnswerRaw)) {
                                            $letter = strtoupper(trim($correctAnswerRaw));
                                            $optionLetter = chr(65 + $index); // 0->A, 1->B, ...
                                            if ($letter === $optionLetter) {
                                                $isCorrect = true;
                                            }
                                            // Handle case where answer is "Option A" or similar
                                            elseif (str_contains($letter, "OPTION $optionLetter")) {
                                                $isCorrect = true;
                                            }
                                        }

                                        \App\Models\ExAnswer::create([
                                            'content' => $optionText,
                                            'is_correct' => $isCorrect,
                                            'ex_question_id' => $question->id,
                                        ]);
                                    }
                                }
                                $count++;
                            }

                            \Filament\Notifications\Notification::make()
                                ->title("Successfully generated {$count} questions")
                                ->success()
                                ->send();

                        } catch (\Exception $e) {
                            \Filament\Notifications\Notification::make()
                                ->title('An error occurred')
                                ->body($e->getMessage())
                                ->danger()
                                ->send();
                        }
                    }),
            ])
            ->actions([
                Tables\Actions\EditAction::make()
                    ->label('Edit')
                    ->modal(false)
                    ->url(fn($record) => route('filament.admin.resources.ex-questions.edit', $record)),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
