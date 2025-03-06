<?php

namespace App\Filament\Resources\ExerciseResource\Pages;

use App\Filament\Resources\ExerciseResource;
use App\Models\Lesson;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditExercise extends EditRecord
{
    protected static string $resource = ExerciseResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        $lesson = Lesson::find($data["lesson_id"]);
        $data["topic_id"] = $lesson->topic_id;
        
        $data["updated_by"] = auth()->id();

        return $data;
    }
}
