<?php

namespace App\Http\Controllers;

use App\Http\Resources\LessonResource;
use App\Models\Lesson;
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

        return new LessonResource($lesson);
    }
}
