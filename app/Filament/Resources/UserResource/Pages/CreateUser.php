<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use App\Models\HaveAvatar;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Hash;

class CreateUser extends CreateRecord
{
    protected static string $resource = UserResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->previousUrl ?? $this->getResource()::getUrl('index');
    }

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data["created_by"] = auth()->id();
        $data["updated_by"] = auth()->id();
        $data["password"] = Hash::make($data["password"]);
        $data["level_id"] = auth()->id();
        $data["avatar_id"] = 1;

        HaveAvatar::create([
            "user_id" => $data["id"],
            "avatar_id" => 1,
        ]);
        return $data;
    }
}
