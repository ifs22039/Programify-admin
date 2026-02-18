<?php

namespace App\Filament\Resources\ExQuestionResource\Pages;

use App\Filament\Resources\ExQuestionResource;
use App\Models\ExAnswer;
use App\Models\ExQuestion;
use Filament\Actions;
use Filament\Actions\Action;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\DB;

class CreateExQuestion extends CreateRecord
{
    protected static string $resource = ExQuestionResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->previousUrl ?? $this->getResource()::getUrl('index');
    }

    protected function handleRecordCreation(array $data): ExQuestion
    {
        return DB::transaction(function () use ($data) {
            $content = $data['type'] === 'matching' ? json_encode($data['matching_pairs']) : $data['content'];

            $question = ExQuestion::create([
                'exercise_id' => $data['exercise_id'],
                'type' => $data['type'],
                'content' => $content,
                'point' => $data['point'],
                'exp' => $data['exp'],
                'difficulty' => $data['difficulty'],
                'feedback' => $data['feedback'] ?? null,
            ]);

            if ($data['type'] === 'multiple_choice' && isset($data['options'])) {
                foreach ($data['options'] as $option) {
                    ExAnswer::create([
                        'ex_question_id' => $question->id,
                        'content' => $option['option'],
                        'is_correct' => $option['is_correct'] ?? false,
                    ]);
                }
            } elseif ($data['type'] === 'true_false') {
                ExAnswer::create([
                    'ex_question_id' => $question->id,
                    'content' => $data['true_false_answer'],
                    'is_correct' => true,
                ]);
            } elseif ($data['type'] === 'essay') {
                ExAnswer::create([
                    'ex_question_id' => $question->id,
                    'content' => $data['essay_answer'],
                    'is_correct' => false,
                ]);
            } elseif ($data['type'] === 'short_answer') {
                ExAnswer::create([
                    'ex_question_id' => $question->id,
                    'content' => $data['short_answer'],
                    'is_correct' => true,
                ]);
            } elseif ($data['type'] === 'multiple_answer' && isset($data['multiple_options'])) {
                foreach ($data['multiple_options'] as $option) {
                    ExAnswer::create([
                        'ex_question_id' => $question->id,
                        'content' => $option['option'],
                        'is_correct' => $option['is_correct'] ?? false,
                    ]);
                }
            } elseif ($data['type'] === 'matching' && isset($data['matching_pairs'])) {
                foreach ($data['matching_pairs'] as $pair) {
                    ExAnswer::create([
                        'ex_question_id' => $question->id,
                        'content' => json_encode($pair),
                        'is_correct' => true,
                    ]);
                }
            }

            return $question;
        });
    }

    protected function getFormActions(): array
    {
        return [
            $this->getCreateFormAction(),
            // ...(static::canCreateAnother() ? [$this->getCreateAnotherFormAction()] : []),
            $this->getCancelFormAction(),
        ];
    }
}
