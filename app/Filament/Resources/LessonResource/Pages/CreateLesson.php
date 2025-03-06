<?php

namespace App\Filament\Resources\LessonResource\Pages;

use App\Filament\Resources\LessonResource;
use Filament\Actions\Action;
use Filament\Resources\Pages\CreateRecord;

class CreateLesson extends CreateRecord
{
    protected static string $resource = LessonResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->previousUrl ?? $this->getResource()::getUrl('index');
    }

    protected function getFormActions(): array
    {
        return [
            $this->getCreateFormAction(),
            // ...(static::canCreateAnother() ? [$this->getCreateAnotherFormAction()] : []),
            $this->getCancelFormAction(),
        ];
    }

    // protected function getCreateAnotherFormAction(): Action
    // {
    //     return Action::make('createAnother')
    //         ->label(__('filament-panels::resources/pages/create-record.form.actions.create_another.label'))
    //         ->action('createAnother')
    //         ->keyBindings(['mod+shift+s'])
    //         ->color('gray')
    //         // ->url(function () {
    //         //     $topic_id = request()->query('topic_id');
    //         //     if ($topic_id) {
    //         //         return route('filament.admin.resources.lessons.create', ['topic_id' => $topic_id]);
    //         //     } else {
    //         //         return route('filament.admin.resources.lessons.create');
    //         //     }
    //         // });
    //         ->successRedirectUrl(function () {
    //             $topic_id = request()->query('topic_id');
    //             if ($topic_id) {
    //                 return $this->previousUrl ?? $this->getResource()::getUrl('index');
    //             } else {
    //                 // return route('filament.admin.resources.lessons.create');
    //             }
    //         });
    // }

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data["created_by"] = auth()->id();
        $data["updated_by"] = auth()->id();
        return $data;
    }
}
