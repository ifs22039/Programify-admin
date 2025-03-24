<?php

namespace App\Filament\Resources\HaveGiftResource\Pages;

use App\Filament\Resources\HaveGiftResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditHaveGift extends EditRecord
{
    protected static string $resource = HaveGiftResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
