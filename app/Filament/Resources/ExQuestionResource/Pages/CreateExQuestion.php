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

    protected function handleRecordCreation(array $data): ExQuestion
    {
        return DB::transaction(function () use ($data) {
            $question = ExQuestion::create([
                'exercise_id' => $data['exercise_id'],
                'type' => $data['type'],
                'content' => $data['content'],
                'point' => $data['point'],
                'exp' => $data['exp'],
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
            }

            return $question;
        });
    }
}
