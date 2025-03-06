<?php

namespace App\Filament\Resources\QuestResource\Pages;

use App\Filament\Resources\QuestResource;
use App\Models\Quest;
use App\Models\QuestAnswer;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class EditQuest extends EditRecord
{
    protected static string $resource = QuestResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function handleRecordUpdate(Model $record, array $data): Quest
    {
        return DB::transaction(function () use ($data) {
            $quest = $this->record;

            $quest->title = $data['title'];
            $quest->type = $data['type'];
            $quest->content = $data['content'];
            $quest->point = $data['point'];
            $quest->exp = $data['exp'];
            $quest->difficulty = $data['difficulty'];
            $quest->feedback = $data['feedback'] ?? null;

            $quest->save();

            QuestAnswer::where("quest_id", $quest->id)->delete();

            if ($data['type'] === 'multiple_choice' && isset($data['options'])) {
                foreach ($data['options'] as $option) {
                    QuestAnswer::create([
                        'quest_id' => $quest->id,
                        'content' => $option['option'],
                        'is_correct' => $option['is_correct'] ?? false,
                    ]);
                }
            } elseif ($data['type'] === 'true_false') {
                QuestAnswer::create([
                    'quest_id' => $quest->id,
                    'content' => $data['true_false_answer'],
                    'is_correct' => true,
                ]);
            } elseif ($data['type'] === 'essay') {
                QuestAnswer::create([
                    'quest_id' => $quest->id,
                    'content' => $data['essay_answer'],
                    'is_correct' => false,
                ]);
            } elseif ($data['type'] === 'short_answer') {
                QuestAnswer::create([
                    'quest_id' => $quest->id,
                    'content' => $data['short_answer'],
                    'is_correct' => true,
                ]);
            } elseif ($data['type'] === 'multiple_answer' && isset($data['multiple_options'])) {
                foreach ($data['multiple_options'] as $option) {
                    QuestAnswer::create([
                        'quest_id' => $quest->id,
                        'content' => $option['option'],
                        'is_correct' => $option['is_correct'] ?? false,
                    ]);
                }
            }

            return $quest;
        });
    }

    protected function mutateFormDataBeforeFill(array $data): array
    {
        $record = $this->record;

        if ($record->type == "multiple_choice") {
            $formattedOptions = $record->questAnswers->map(function ($answer) {
                return [
                    'option' => $answer->content,
                    'is_correct' => $answer->is_correct,
                ];
            })->toArray();

            $data["options"] = $formattedOptions;
        } else if ($record->type == "multiple_answer") {
            $formattedOptions = $record->questAnswers->map(function ($answer) {
                return [
                    'option' => $answer->content,
                    'is_correct' => $answer->is_correct,
                ];
            })->toArray();

            $data["multiple_options"] = $formattedOptions;
        } else if ($record->type == "true_false") {
            $answer = $record->questAnswers[0]->content;

            $data["true_false_answer"] = $answer;
        } else if ($record->type == "essay") {
            $answer = $record->questAnswers[0]->content;

            $data["essay_answer"] = $answer;
        } else if ($record->type == "short_answer") {
            $answer = $record->questAnswers[0]->content;

            $data["short_answer"] = $answer;
        }

        return $data;
    }
}
