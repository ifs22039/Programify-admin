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
                    // ->limit(100)
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
//                        ->map(fn($content) => '- ' . $content)
                        ->implode('<br>'))
                    ->wrap()
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make()
                    ->label("New Question")
                    ->modalHeading("New Question")
                    ->modal(false)
                    ->url(fn() => route('filament.admin.resources.ex-questions.create', ['exercise_id' => $this->ownerRecord->id])),
            ])
            ->actions([
                // Tables\Actions\ViewAction::make(),
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
