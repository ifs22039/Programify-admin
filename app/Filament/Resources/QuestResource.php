<?php

namespace App\Filament\Resources;

use App\Filament\Resources\QuestResource\Pages;
use App\Filament\Resources\QuestResource\RelationManagers;
use App\Models\Quest;
use App\Utils\MyHelper;
use Filament\Forms;
use Filament\Forms\Components\Fieldset;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Radio;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class QuestResource extends Resource
{
    protected static ?string $model = Quest::class;

    protected static ?string $navigationIcon = 'heroicon-o-rocket-launch';

    protected static ?string $navigationGroup = 'E-Learning';

    protected static ?int $navigationSort = 5;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('title')
                    ->label('Title')
                    ->required()
                    ->columnSpanFull(),

                Select::make('type')
                    ->label('Quest Type')
                    ->options([
                        'multiple_choice' => 'Multiple Choice',
                        'true_false' => 'True or False',
                        'essay' => 'Essay',
                        'multiple_answer' => 'Multiple Answer of Multiple Choice',
                        'short_answer' => 'Short Answer',
                        'matching' => 'Matching',
                    ])
                    ->required()
                    ->reactive()
                    ->columnSpanFull(),

                TextInput::make('point')
                    ->label('Reward Poin')
                    ->required()
                    ->integer()
                    ->default(0),

                TextInput::make('exp')
                    ->label('Reward Experience')
                    ->required()
                    ->integer()
                    ->default(0),

                TextInput::make('timer')
                    ->label('Durasi (Menit)')
                    ->numeric()
                    ->minValue(1) // Minimal 1 menit
                    ->maxValue(1440) // Maksimal 24 jam (opsional)
                    ->default(1)
                    ->required(),

                Select::make('difficulty')
                    ->label('Quest Difficulty')
                    ->options([
                        'Easy' => 'Easy',
                        'Medium' => 'Medium',
                        'Hard' => 'Hard',
                    ])
                    ->required()
                    ->reactive()
                    ->columnSpanFull(),

                RichEditor::make('content')
                    ->required()
                    ->label("Question")
                    ->columnSpanFull()
                    ->fileAttachmentsDirectory('quest/images')
                    ->fileAttachmentsVisibility('public')
                    ->columnSpanFull()
                    ->extraAttributes(['class' => 'h-96']),

                Repeater::make('options')
                    ->label('Answer Options')
                    ->schema([
                        Forms\Components\RichEditor::make('option')
                            ->label('Option')
                            ->required()
                            ->columnSpanFull()
                            ->extraInputAttributes(['style' => 'min-height: 5rem !important;']),
                        Forms\Components\Radio::make('is_correct')
                            ->label('Is Correct?')
                            ->default(false)
                            ->boolean()
                            ->columnSpanFull(),
                    ])
                    ->minItems(2)
                    ->grid(2)
                    ->maxItems(4)
                    ->defaultItems(2)
                    ->columns(2)
                    ->required()
                    ->columnSpanFull()
                    ->visible(fn(Forms\Get $get) => $get('type') === 'multiple_choice'),

                Repeater::make('multiple_options')
                    ->label('Answer Options')
                    ->schema([
                        Forms\Components\RichEditor::make('option')
                            ->label('Option')
                            ->required()
                            ->columnSpanFull()
                            ->extraInputAttributes(['style' => 'min-height: 5rem !important;']),
                        Forms\Components\Radio::make('is_correct')
                            ->label('Is Correct?')
                            ->default(false)
                            ->boolean()
                            ->columnSpanFull(),
                    ])
                    ->minItems(2)
                    ->grid(2)
                    ->maxItems(6)
                    ->columns(2)
                    ->defaultItems(2)
                    ->required()
                    ->columnSpanFull()
                    ->visible(fn(Forms\Get $get) => $get('type') === 'multiple_answer'),

                Radio::make('true_false_answer')
                    ->label('Correct Answer')
                    ->options([
                        'true' => 'True',
                        'false' => 'False',
                    ])
                    ->required()
                    ->visible(fn(Forms\Get $get) => $get('type') === 'true_false'),

                RichEditor::make('essay_answer')
                    ->required()
                    ->columnSpanFull()
                    ->required()
                    ->visible(fn(Forms\Get $get) => $get('type') === 'essay'),

                TextInput::make('short_answer')
                    ->label('Correct Answer')
                    ->required()
                    ->columnSpanFull()
                    ->required()
                    ->placeholder('Input correct answer here...')
                    ->visible(fn(Forms\Get $get) => $get('type') === 'short_answer'),

                Repeater::make('matching_pairs')
                    ->label('Matching Pairs')
                    ->schema([
                        TextInput::make('keyword')
                            ->label('Keyword')
                            ->required()
                            ->placeholder('Enter keyword'),
                        RichEditor::make('explanation')
                            ->label('Explanation')
                            ->required()
                            ->placeholder('Enter explanation')
                            ->extraInputAttributes(['style' => 'min-height: 5rem !important;']),
                    ])
                    ->minItems(2)
                    ->columns(2)
                    ->defaultItems(2)
                    ->required()
                    ->columnSpanFull()
                    ->visible(fn(Forms\Get $get) => $get('type') === 'matching'),

                RichEditor::make('feedback')
                    ->label("Feedback or Explanation")
                    ->placeholder("Input feedback or explanation of the right answer here...")
                    ->columnSpanFull()
                    ->fileAttachmentsDirectory('quest/images')
                    ->fileAttachmentsVisibility('public')
                    ->columnSpanFull()
                    ->extraAttributes(['class' => 'h-96']),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('title')
                    ->label("Title"),
                // Tables\Columns\TextColumn::make('content')
                //     ->label('Question')
                //     ->html()
                //     ->wrap()
                //     ->formatStateUsing(
                //         function ($record) {
                //             if ($record->type === 'matching') {
                //                 $pairs = json_decode($record->content, true);
                //                 if (is_array($pairs) && count($pairs) > 0) {
                //                     $explanations = [];
                //                     foreach ($pairs as $pair) {
                //                         if (isset($pair['explanation'])) {
                //                             // Remove HTML tags from explanation
                //                             $text = strip_tags($pair['explanation']);
                //                             $explanations[] = $text;
                //                         }
                //                     }
                //                     return !empty($explanations) ? implode('<br>', $explanations) : 'No explanations';
                //                 }
                //                 return 'No explanations';
                //             }
                //             return $record->content;
                //         }
                //     ),
                Tables\Columns\TextColumn::make('type')
                    ->label('Type')
                    ->badge()
                    ->formatStateUsing(fn($state) => MyHelper::questionType($state)),
                Tables\Columns\TextColumn::make('difficulty')
                    ->label('Difficulty')
                    ->badge(),
                Tables\Columns\TextColumn::make('point')
                    ->label('Reward')
                    ->badge()
                    ->formatStateUsing(fn($record) => $record->point . " Point <br/> <hr/>" . $record->exp . " Exp")
                    ->html(),
                Tables\Columns\TextColumn::make('creator.name')
                    ->label("Created By")
                    ->formatStateUsing(fn($record) => $record->creator->name . "<br/> <hr/>" . $record->created_at)
                    ->html(),
                Tables\Columns\TextColumn::make('updater.name')
                    ->label("Updated By")
                    ->formatStateUsing(fn($record) => $record->updater->name . "<br/> <hr/>" . $record->updated_at)
                    ->html(),
            ])
            ->filters([
                //
            ])
            ->headerActions([
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
                                        'Easy' => 'Easy',
                                        'Medium' => 'Medium',
                                        'Hard' => 'Hard',
                                    ])
                                    ->default('Medium')
                                    ->required(),

                                Forms\Components\TextInput::make('timer')
                                    ->label('Durasi (Menit)')
                                    ->numeric()
                                    ->minValue(1)
                                    ->default(1)
                                    ->required(),
                            ])
                            ->columns(2)
                            ->collapsed(),
                    ])
                    ->action(function (array $data) {
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
                            $count = 0;

                            foreach ($questionsData as $qData) {
                                // DETECT TYPE
                                // Prioritize explicit type from API, fallback to heuristic
                                $type = $qData['type'] ?? (isset($qData['options']) ? 'multiple_choice' : 'essay');

                                $quest = \App\Models\Quest::create([
                                    'title' => $qData['question'],
                                    'content' => $qData['question'],
                                    'type' => $type,
                                    'point' => $data['default_point'],
                                    'exp' => $data['default_exp'],
                                    'difficulty' => $data['difficulty'],
                                    'timer' => $data['timer'],
                                    'feedback' => $qData['explanation'] ?? null,
                                ]);

                                // MATCHING
                                if ($type === 'matching' && isset($qData['pairs']) && is_array($qData['pairs'])) {
                                    $quest->update(['content' => json_encode($qData['pairs'])]);
                                }
                                // MULTIPLE CHOICE
                                elseif ($type === 'multiple_choice' && isset($qData['options']) && is_array($qData['options'])) {
                                    foreach ($qData['options'] as $index => $option) {
                                        $letter = chr(65 + $index); // A, B, C...
                                        // Check if answer matches letter (A, B) or full content
                                        $answerRaw = $qData['answer'] ?? '';
                                        $isCorrect = (strtoupper($answerRaw) === $letter) || ($answerRaw == $option);

                                        \App\Models\QuestAnswer::create([
                                            'content' => $option,
                                            'is_correct' => $isCorrect,
                                            'quest_id' => $quest->id,
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

                                        \App\Models\QuestAnswer::create([
                                            'content' => $answerContent,
                                            'is_correct' => true,
                                            'quest_id' => $quest->id,
                                        ]);
                                    }
                                }

                                $count++;
                            }

                            \Filament\Notifications\Notification::make()
                                ->title("Successfully generated {$count} quests")
                                ->success()
                                ->send();

                        } catch (\Exception $e) {
                            \Filament\Notifications\Notification::make()
                                ->title('Generate Failed')
                                ->body($e->getMessage())
                                ->danger()
                                ->send();
                        }
                    }),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListQuests::route('/'),
            'create' => Pages\CreateQuest::route('/create'),
            'edit' => Pages\EditQuest::route('/{record}/edit'),
        ];
    }
}
