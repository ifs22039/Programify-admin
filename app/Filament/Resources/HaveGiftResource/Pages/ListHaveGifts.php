<?php

namespace App\Filament\Resources\HaveGiftResource\Pages;

use App\Filament\Resources\HaveGiftResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListHaveGifts extends ListRecords
{
    protected static string $resource = HaveGiftResource::class;

    protected function canEdit($record): bool
    {
        return false;
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
