<?php

namespace App\Filament\Resources\AvatarResource\Pages;

use App\Filament\Resources\AvatarResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateAvatar extends CreateRecord
{
    protected static string $resource = AvatarResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->previousUrl ?? $this->getResource()::getUrl('index');
    }

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data["created_by"] = auth()->id();
        $data["updated_by"] = auth()->id();
        return $data;
    }
}
