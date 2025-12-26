<?php
namespace App\Filament\Widgets;

use App\Models\TakeExercise;
use Carbon\Carbon;
use Filament\Widgets\ChartWidget;

class UserTakeExerciseChart extends ChartWidget
{
    protected static ?int $sort = 6;

    protected static ?string $heading = 'Users Take Exercise';

    protected function getData(): array
    {
        // Ambil semua take_exercise, lalu kelompokkan per hari
        $exercises = TakeExercise::selectRaw('DATE(created_at) as date, COUNT(DISTINCT user_id) as total')
            ->where('created_at', '>=', Carbon::now()->subDays(14))
            ->groupBy('date')
            ->orderBy('date', 'asc')
            ->get();

        return [
            'labels' => $exercises->pluck('date')->toArray(),
            'datasets' => [
                [
                    'label' => 'Users Take Exercise',
                    'data' => $exercises->pluck('total')->toArray(),
                    'backgroundColor' => 'rgba(255, 140, 0, 0.2)', // Warna oranye lembut
                    'borderColor' => 'rgba(255, 140, 0, 1)', // Warna oranye terang
                    'borderWidth' => 2,
                    'fill' => true,
                    'tension' => 0.4, 
                ],
            ],
        ];
    }

    protected function getType(): string
    {
        return 'line'; // Ubah menjadi Line Chart
    }
}
