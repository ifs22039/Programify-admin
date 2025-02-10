<?php

namespace App\Filament\Resources\LevelResource\Pages;

use App\Filament\Resources\LevelResource;
use App\Models\Level;
use Filament\Actions;
use Filament\Actions\Action;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Pages\ListRecords;

class ListLevels extends ListRecords
{
    protected static string $resource = LevelResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Action::make('create')
                ->label('New Level')
                ->color('primary')
                ->modalContent()
                ->form(function (Form $form) {
                    return $form->schema([
                        TextInput::make('level')
                            ->integer()
                            ->label("Level")
                            ->unique()
                            ->minValue(0)
                            ->required(),
                        TextInput::make('exp_needed')
                            ->integer()
                            ->label("Exp Required")
                            ->unique()
                            ->minValue(0)
                            ->required(),
                    ]);
                })
                ->modalHeading('Add New Level')
                ->action(function ($data) {
                    $data["created_by"] = auth()->id();
                    $data["updated_by"] = auth()->id();
                    Level::create($data);
                }),
        ];
    }
}
