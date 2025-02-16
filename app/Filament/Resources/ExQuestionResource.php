<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ExQuestionResource\Pages;
use App\Filament\Resources\ExQuestionResource\RelationManagers;
use App\Models\ExQuestion;
use Filament\Actions\Action;
use Filament\Forms;
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

class ExQuestionResource extends Resource
{
    protected static ?string $model = ExQuestion::class;

    protected static ?string $label = "Exercise Questions";

    protected static ?string $navigationIcon = 'heroicon-o-document-duplicate';

    protected static ?string $navigationGroup = 'E-Learning';

    protected static ?int $navigationSort = 5;

    public static function shouldRegisterNavigation(): bool
    {
        return false;
    }

    public static function form(Form $form): Form
    {
        $exercise_id = request()->query('exercise_id');
        return $form
            ->schema([
                Hidden::make('exercise_id')
                    ->default($exercise_id)
                    ->required(),
                Select::make('type')
                    ->label('Question Type')
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
                    // ->columnSpanFull()
                    ->integer()
                    ->default(0),

                TextInput::make('exp')
                    ->label('Reward Experience')
                    ->required()
                    // ->columnSpanFull()
                    ->integer()
                    ->default(0),

                RichEditor::make('content')
                    ->required()
                    ->label("Question")
                    ->columnSpanFull()
                    ->fileAttachmentsDirectory('exercise/images')
                    ->fileAttachmentsVisibility('public')
                    ->columnSpanFull()
                    ->placeholder('Input content of the question here...')
                    ->extraAttributes(['class' => 'h-96']),

                Repeater::make('options')
                    ->label('Answer Options')
                    ->schema([
                        Forms\Components\RichEditor::make('option')
                            ->label('Option')
                            ->required()
                            ->columnSpanFull(),
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
                    ->required()
                    ->columnSpanFull()
                    ->visible(fn(Forms\Get $get) => $get('type') === 'multiple_choice'),

                Repeater::make('options')
                    ->label('Answer Options')
                    ->schema([
                        Forms\Components\RichEditor::make('option')
                            ->label('Option')
                            ->required()
                            ->columnSpanFull(),
                        Forms\Components\Radio::make('is_correct')
                            ->label('Is Correct?')
                            ->default(false)
                            ->boolean()
                            ->columnSpanFull(),
                    ])
                    ->minItems(2)
                    ->grid(2)
                    ->maxItems(4)
                    ->columns(2)
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
                    ->fileAttachmentsDirectory('exercise/images')
                    ->fileAttachmentsVisibility('public')
                    ->columnSpanFull()
                    ->extraAttributes(['class' => 'h-40']),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([])
            ->filters([])
            ->actions([])
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
            'index' => Pages\ListExQuestions::route('/'),
            'create' => Pages\CreateExQuestion::route('/create'),
            'edit' => Pages\EditExQuestion::route('/{record}/edit'),
        ];
    }
}
