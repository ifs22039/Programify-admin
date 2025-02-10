<?php

namespace App\Filament\Resources\ExQuestionResource\Pages;

use App\Filament\Resources\ExQuestionResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListExQuestions extends ListRecords
{
    protected static string $resource = ExQuestionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
