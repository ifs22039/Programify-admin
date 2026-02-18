<?php

namespace App\Filament\Resources\ExQuestionResource\Pages;

use App\Filament\Resources\ExQuestionResource;
use App\Models\ExAnswer;
use App\Models\ExQuestion;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class EditExQuestion extends EditRecord
{
    protected static string $resource = ExQuestionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function handleRecordUpdate(Model $record, array $data): ExQuestion
    {
        return DB::transaction(function () use ($data) {
            $question = $this->record;

            $question->exercise_id = $data['exercise_id'];
            $question->type = $data['type'];
            $question->content = $data['type'] === 'matching' ? json_encode($data['matching_pairs']) : $data['content'];
            $question->point = $data['point'];
            $question->exp = $data['exp'];
            $question->difficulty = $data['difficulty'];
            $question->feedback = $data['feedback'] ?? null;

            $question->save();

            ExAnswer::where("ex_question_id", $question->id)->delete();

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

    protected function mutateFormDataBeforeFill(array $data): array
    {
        $record = $this->record;

        if ($record->type == "multiple_choice") {
            $formattedOptions = $record->exanswers->map(function ($exAnswer) {
                return [
                    'option' => $exAnswer->content,
                    'is_correct' => $exAnswer->is_correct,
                ];
            })->toArray();

            $data["options"] = $formattedOptions;
        } else if ($record->type == "multiple_answer") {
            $formattedOptions = $record->exanswers->map(function ($exAnswer) {
                return [
                    'option' => $exAnswer->content,
                    'is_correct' => $exAnswer->is_correct,
                ];
            })->toArray();

            $data["multiple_options"] = $formattedOptions;
        } else if ($record->type == "true_false") {
            $answer = $record->exanswers[0]->content;

            $data["true_false_answer"] = $answer;
        } else if ($record->type == "essay") {
            $answer = $record->exanswers[0]->content;

            $data["essay_answer"] = $answer;
        } else if ($record->type == "short_answer") {
            $answer = $record->exanswers[0]->content;

            $data["short_answer"] = $answer;
        } else if ($record->type == "matching") {
            $pairs = json_decode($record->content, true);
            $data["matching_pairs"] = $pairs;
        }

        return $data;
    }
}
