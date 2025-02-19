<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonResource;
use App\Models\Lesson;
use App\Models\TakeLesson;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LessonController extends Controller
{
    public function get(int $id): LessonResource
    {
        $user = Auth::user();

        $lesson = Lesson::where('id', $id)->first();

        if (!$lesson) {
            throw new HttpResponseException(response()->json([
                'errors' => [
                    'message' => [
                        'Topic not found'
                    ]
                ]
            ]));
        }

        $is_taken = TakeLesson::where("user_id", $user->id)->where("lesson_id", $lesson->id)->first();

        if (!$is_taken) {
            TakeLesson::create([
                "lesson_id" => $lesson->id,
                "user_id" => $user->id,
                "topic_id" => $lesson->topic_id,
            ]);
        }

        return new LessonResource($lesson);
    }
}
