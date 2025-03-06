<?php

namespace App\Filament\Resources\ExerciseResource\Pages;

use App\Filament\Resources\ExerciseResource;
use App\Models\Lesson;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateExercise extends CreateRecord
{
    protected static string $resource = ExerciseResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->previousUrl ?? $this->getResource()::getUrl('index');
    }

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $lesson = Lesson::find($data["lesson_id"]);
        $data["topic_id"] = $lesson->topic_id;

        $data["created_by"] = auth()->id();
        $data["updated_by"] = auth()->id();

        return $data;
    }
}
