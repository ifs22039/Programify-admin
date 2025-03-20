<?php

namespace App\Filament\Resources\QuestResource\Pages;

use App\Filament\Resources\QuestResource;
use App\Models\Quest;
use App\Models\QuestAnswer;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\DB;

class CreateQuest extends CreateRecord
{
    protected static string $resource = QuestResource::class;

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

    protected function handleRecordCreation(array $data): Quest
    {
        return DB::transaction(function () use ($data) {
            $quest = Quest::create([
                'title' => $data['title'],
                'type' => $data['type'],
                'content' => $data['content'],
                'point' => $data['point'],
                'exp' => $data['exp'],
                'difficulty' => $data['difficulty'],
                'feedback' => $data['feedback'] ?? null,
                'timer' => $data['timer']
            ]);

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
}
