<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function home()
    {
        return filament()->getBrandName();
    }

    public function autoGraderEssay()
    {
        $studentAnswer = "OOP adalah sebuah konteks pemrograman yang mana adalah paradigma pemrograman";
        $expectedAnswer = "adalah paradigma pemrograman yang berbasis pada objek, di mana setiap objek dapat memiliki atribut (properti) dan perilaku (metode). OOP mempermudah pengorganisasian kode dengan meningkatkan modularitas dan reusability.";

        $client = new \GuzzleHttp\Client();
        $apiKey = env('HUGGINGFACE_API_KEY');

        $response = $client->post('https://api-inference.huggingface.co/models/sentence-transformers/all-MiniLM-L6-v2', [
            'headers' => [
                'Authorization' => "Bearer $apiKey"
            ],
            'json' => ['inputs' =>
                [
                    "source_sentence" => $expectedAnswer,
                    "sentences" => [$studentAnswer]
                ]
            ]
        ]);

        $data = json_decode($response->getBody(), true);
        $similarityScore = isset($data[0]) ? $data[0] * 100 : 0;

        $print = response()->json([
            'similarity' => $similarityScore . '%',
        ]);
    }
}
