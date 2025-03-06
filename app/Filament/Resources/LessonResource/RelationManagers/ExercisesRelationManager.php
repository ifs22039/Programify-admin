<?php

namespace App\Filament\Resources\LessonResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ExercisesRelationManager extends RelationManager
{
    protected static string $relationship = 'exercises';

    public function form(Form $form): Form
    {
        $lesson = $this->getOwnerRecord();

        return $form
            ->schema([
                Forms\Components\Hidden::make('topic_id')
                    ->required()
                    ->default($lesson->topic_id),
                Forms\Components\TextInput::make('title')
                    ->required()
                    ->columnSpanFull()
                    ->maxLength(255),
                Hidden::make('created_by')
                    ->required()
                    ->default(auth()->id()),
                Hidden::make('updated_by')
                    ->required()
                    ->default(auth()->id()),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('title')
            ->columns([
                Tables\Columns\TextColumn::make('title'),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make()
                    ->label("New Exercise")
                    ->modalHeading("New Exercise")
            ])
            ->actions([
                Tables\Actions\EditAction::make()
                    ->label('Edit')
                    ->modal(false)
                    ->url(fn($record) =>  route('filament.admin.resources.exercises.edit', $record)),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
