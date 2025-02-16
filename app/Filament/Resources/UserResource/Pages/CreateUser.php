<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Hash;

class CreateUser extends CreateRecord
{
    protected static string $resource = UserResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data["created_by"] = auth()->id();
        $data["updated_by"] = auth()->id();
        $data["password"] = Hash::make($data["password"]);
        $data["level_id"] = auth()->id();
        return $data;
    }
}
