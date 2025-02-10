<?php

namespace App\Filament\Resources\ExQuestionResource\Pages;

use App\Filament\Resources\ExQuestionResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditExQuestion extends EditRecord
{
    protected static string $resource = ExQuestionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
