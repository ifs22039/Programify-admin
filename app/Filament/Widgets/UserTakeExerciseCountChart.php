<?php
namespace App\Filament\Widgets;

use App\Models\TakeExercise;
use Carbon\Carbon;
use Filament\Widgets\ChartWidget;

class UserTakeExerciseCountChart extends ChartWidget
{
    protected static ?string $heading = 'Exercises Take';

    protected function getData(): array
    {
        // Ambil data dari 7 hari terakhir
        $exercises = TakeExercise::selectRaw('DATE(created_at) as date, COUNT(*) as total')
            ->where('created_at', '>=', Carbon::now()->subDays(14))
            ->groupBy('date')
            ->orderBy('date', 'asc')
            ->get();

        return [
            'labels' => $exercises->pluck('date')->toArray(),
            'datasets' => [
                [
                    'label' => 'Exercises Take',
                    'data' => $exercises->pluck('total')->toArray(),
                    'backgroundColor' => 'rgba(255, 159, 64, 0.6)',
                    'borderColor' => 'rgba(255, 159, 64, 1)',
                    'borderWidth' => 1,
                ],
            ],
        ];
    }

    protected function getType(): string
    {
        return 'bar'; // Diagram batang
    }
}