<?php

namespace App\Filament\Resources\ExerciseResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use App\Utils\MyHelper;

class ExquestionsRelationManager extends RelationManager
{
    protected static string $relationship = 'exquestions';
    protected static ?string $title = 'Questions';

    public function form(Form $form): Form
    {
        return $form->schema([]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('content')
            ->columns([
                Tables\Columns\TextColumn::make('content')
                    ->label('Question')
                    ->html()
                    ->wrap(),

                Tables\Columns\TextColumn::make('type')
                    ->label('Type')
                    ->badge()
                    ->formatStateUsing(fn ($state) => MyHelper::questionType($state)),

                Tables\Columns\TextColumn::make('point')
                    ->label('Reward')
                    ->html()
                    ->badge()
                    ->formatStateUsing(
                        fn ($record) => "{$record->point} Point <br/><hr/>{$record->exp} Exp"
                    ),

                Tables\Columns\TextColumn::make('exanswers.content')
                    ->label('Answer / Options')
                    ->html()
                    ->wrap()
                    ->formatStateUsing(
                        fn ($record) => $record->exanswers->pluck('content')->implode('<br>')
                    ),
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make()
                    ->label('New Question')
                    ->modal(false)
                    ->url(fn () => route(
                        'filament.admin.resources.ex-questions.create',
                        ['exercise_id' => $this->ownerRecord->id]
                    )),

                Tables\Actions\Action::make('generate_from_pdf')
                    ->label('Generate from PDF')
                    ->icon('heroicon-o-document-arrow-up')
                    ->form([
                        Forms\Components\Textarea::make('instructions')
                            ->label('Instruksi')
                            ->placeholder('Contoh: Buatkan soal pilihan ganda tentang pemrograman beserta jawabannya')
                            ->required()
                            ->rows(3),

                        Forms\Components\TextInput::make('jumlah_soal')
                            ->numeric()
                            ->minValue(1)
                            ->default(5)
                            ->required(),

                        Forms\Components\FileUpload::make('pdf_file')
                            ->label('Upload PDF')
                            ->acceptedFileTypes(['application/pdf'])
                            ->disk('public')
                            ->required(),

                        Forms\Components\Section::make('Configuration')
                            ->schema([
                                Forms\Components\TextInput::make('default_point')
                                    ->numeric()
                                    ->default(10)
                                    ->required(),

                                Forms\Components\TextInput::make('default_exp')
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
                            ])
                            ->columns(3)
                            ->collapsed(),
                    ])
                    ->action(function (array $data, $livewire) {
                        $service = new \App\Services\QuestionGeneratorService();

                        try {
                            /** -----------------------------
                             * 1. FIX PATH FILE FILAMENT
                             * ----------------------------- */
                            $pdfPath = is_array($data['pdf_file'])
                                ? $data['pdf_file'][0]
                                : $data['pdf_file'];

                            $absolutePdfPath = storage_path('app/public/' . $pdfPath);

                            /** -----------------------------
                             * 2. UPLOAD PDF & EXTRACT TEXT
                             * ----------------------------- */
                            $uploadResult = $service->uploadPdf($absolutePdfPath);

                            if (empty(trim($uploadResult['text']))) {
                                throw new \Exception('Gagal mengekstrak teks dari PDF.');
                            }

                            /** -----------------------------
                             * 3. GENERATE QUESTIONS
                             * ----------------------------- */
                            $questionsData = $service->generateQuestions(
                                text: $uploadResult['text'],
                                sourceId: $uploadResult['source_id'],
                                instructions: $data['instructions'],
                                jumlahSoal: (int) $data['jumlah_soal']
                            );

                            if (empty($questionsData)) {
                                throw new \Exception('API tidak menghasilkan soal.');
                            }

                            /** -----------------------------
                             * 4. SAVE TO DATABASE
                             * ----------------------------- */
                            $exerciseId = $livewire->ownerRecord->id;
                            $count = 0;

                            foreach ($questionsData as $qData) {

                                // DETECT TYPE
                                // Prioritize explicit type from API, fallback to heuristic
                                $type = $qData['type'] ?? (isset($qData['options']) ? 'multiple_choice' : 'essay');

                                $question = \App\Models\ExQuestion::create([
                                    'content'     => $qData['question'],
                                    'type'        => $type,
                                    'exercise_id' => $exerciseId,
                                    'point'       => $data['default_point'],
                                    'exp'         => $data['default_exp'],
                                    'difficulty'  => $data['difficulty'],
                                ]);

                                // MULTIPLE CHOICE
                                if ($type === 'multiple_choice' && isset($qData['options']) && is_array($qData['options'])) {
                                    foreach ($qData['options'] as $index => $option) {
                                        $letter = chr(65 + $index); // A, B, C...
                                        // Check if answer matches letter (A, B) or full content
                                        $answerRaw = $qData['answer'] ?? '';
                                        $isCorrect = (strtoupper($answerRaw) === $letter) || ($answerRaw == $option);

                                        \App\Models\ExAnswer::create([
                                            'content' => $option,
                                            'is_correct' => $isCorrect,
                                            'ex_question_id' => $question->id,
                                        ]);
                                    }
                                }
                                // NON-MULTIPLE CHOICE (Essay, Short Answer, True False)
                                else {
                                    $answerContent = $qData['answer_key'] ?? $qData['answer'] ?? null;

                                    if ($answerContent !== null) {
                                        // Normalize True/False
                                        if ($type === 'true_false') {
                                            if (is_bool($answerContent)) {
                                                $answerContent = $answerContent ? 'true' : 'false';
                                            } else {
                                                $answerContent = strtolower((string)$answerContent);
                                            }
                                        }

                                        \App\Models\ExAnswer::create([
                                            'content' => $answerContent,
                                            'is_correct' => true,
                                            'ex_question_id' => $question->id,
                                        ]);
                                    }
                                }

                                $count++;
                            }

                            Notification::make()
                                ->title("Successfully generated {$count} questions")
                                ->success()
                                ->send();

                        } catch (\Exception $e) {
                            Notification::make()
                                ->title('Generate Failed')
                                ->body($e->getMessage())
                                ->danger()
                                ->send();
                        }
                    }),
            ])
            ->actions([
                Tables\Actions\EditAction::make()
                    ->modal(false)
                    ->url(fn ($record) => route('filament.admin.resources.ex-questions.edit', ['record' => $record])),
                Tables\Actions\DeleteAction::make(),
            ]);
    }
}
