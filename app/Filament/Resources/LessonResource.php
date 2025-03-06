<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LessonResource\Pages;
use App\Filament\Resources\LessonResource\RelationManagers;
use App\Filament\Resources\LessonResource\RelationManagers\ExercisesRelationManager;
use App\Models\Lesson;
use Filament\Forms;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class LessonResource extends Resource
{
    protected static ?string $model = Lesson::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationGroup = 'E-Learning';

    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        $topic_id = request()->query('topic_id');
        return $form
            ->schema([
                Forms\Components\Select::make('topic_id')
                    ->relationship('topic', 'name')
                    ->searchable()
                    ->preload()
                    ->required()
                    ->placeholder("Select a topic")
                    ->columnSpanFull()
                    ->disabled(fn() => $topic_id ?? $topic_id)
                    ->default(fn() => $topic_id ?? $topic_id),

                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255)
                    ->columnSpanFull(),

                Forms\Components\TextInput::make('exp')
                    ->label('Reward Exp')
                    ->required()
                    ->columnSpanFull()
                    ->integer()
                    ->default(10),

                RichEditor::make('content')
                    ->required()
                    ->fileAttachmentsDirectory('lessons/images')
                    ->fileAttachmentsVisibility('public')
                    ->placeholder('Input content of the lesson here...')
                    ->columnSpanFull()
                    ->extraAttributes([
                        'class' => 'h-96',
                        'data-tinymce' => json_encode([
                            'plugins' => 'alignleft aligncenter alignright | link',
                            'toolbar' => 'alignleft aligncenter alignright | undo redo | bold italic | link',
                            'toolbar_mode' => 'wrap',
                        ])
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name'),
                Tables\Columns\TextColumn::make('topic.name')->label("Topic"),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
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
            ExercisesRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListLessons::route('/'),
            'create' => Pages\CreateLesson::route('/create'),
            'edit' => Pages\EditLesson::route('/{record}/edit'),
        ];
    }
}
