<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use Exception;

class QuestionGeneratorService
{
    protected string $baseUrl = 'http://127.0.0.1:8000/api';

    /**
     * Upload a PDF file to the Python API and extract text.
     *
     * @param string $filePath Relative path in public disk or absolute path
     * @return array Contains 'text' and 'source_id'
     * @throws Exception
     */
    public function uploadPdf(string $filePath): array
    {
        // Determine if it's a full path or relative to public disk
        if (file_exists($filePath)) {
            $absolutePath = $filePath;
        } else {
            $absolutePath = Storage::disk('public')->path($filePath);
        }

        if (!file_exists($absolutePath)) {
            throw new Exception("File not found: " . $absolutePath);
        }

        $response = Http::attach(
            'file', file_get_contents($absolutePath), 'document.pdf'
        )->post("{$this->baseUrl}/upload_pdf/");

        if (!$response->successful()) {
            throw new Exception("Error uploading PDF: " . $response->body());
        }

        $data = $response->json();
        $text = $data['preview'] ?? null;
        $sourceId = $data['source_id'] ?? null;

        if (!$text) {
            throw new Exception("Error: No text extracted from PDF");
        }

        return [
            'text' => $text,
            'source_id' => $sourceId,
        ];
    }

    /**
     * Generate questions from text using the Python API.
     *
     * @param string $text
     * @param int|null $sourceId
     * @param int $numQuestions
     * @param string|null $prompt
     * @return array List of questions
     * @throws Exception
     */
    public function generateQuestions(
    string $text,
    ?int $sourceId,
    string $instructions,
    int $jumlahSoal
): array {
    $response = Http::post("{$this->baseUrl}/generate/", [
        'source_id'    => $sourceId,
        'text'         => $text,
        'instructions' => $instructions,
        'jumlah_soal'  => $jumlahSoal,
    ]);

    if (!$response->successful()) {
        throw new Exception("Error generating questions: " . $response->body());
    }

    return $response->json()['preview'] ?? [];
}

}
