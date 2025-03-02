<?php

namespace App\Http\Controllers;

use App\Http\Resources\TopicResource;
use App\Models\TakeLesson;
use App\Models\Topic;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TopicController extends Controller
{
    public function get(int $id): TopicResource
    {
        $topic = Topic::where('id', $id)->first();

        if (!$topic) {
            throw new HttpResponseException(response()->json([
                'errors' => [
                    'message' => [
                        'Topic not found'
                    ]
                ]
            ]));
        }

        return new TopicResource($topic);
    }

    public function all(): JsonResponse
    {
        $topics = Topic::with([
            'lessons:id,topic_id,name',
            'takeLessons' => function ($query) {
                $user = Auth::user();
                $query->where('user_id', $user->id)->select('id', 'topic_id', 'lesson_id', 'user_id');
            }])->get();

        return response()->json([
            "data" => $topics
        ])->setStatusCode(200);
    }
}
