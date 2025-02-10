<?php

namespace App\Filament\Resources\TopicResource\Pages;

use App\Filament\Resources\TopicResource;
use App\Models\Topic;
use Filament\Actions;
use Filament\Actions\Action;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Pages\ListRecords;

class ListTopics extends ListRecords
{
    protected static string $resource = TopicResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Action::make('create')
                ->label('New Topic')
                ->color('primary')
                ->modalContent()
                ->form(function (Form $form) {
                    return $form->schema([
                        TextInput::make('name')
                            ->label("Topic Name")
                            ->required()
                            ->maxLength(255),
                    ]);
                })
                ->modalHeading('New Topic')
                ->action(function ($data) {
                    $data["created_by"] = auth()->id();
                    $data["updated_by"] = auth()->id();
                    Topic::create($data);
                }),
        ];
    }
}
