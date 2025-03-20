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
