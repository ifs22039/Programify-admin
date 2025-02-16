<?php

namespace App\Http\Controllers;

use App\Http\Resources\TopicResource;
use App\Models\Topic;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TopicController extends Controller
{
    public function get(int $id): TopicResource
    {
        $topic = Topic::where('id', $id)->first();

        if(!$topic) {
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
}
