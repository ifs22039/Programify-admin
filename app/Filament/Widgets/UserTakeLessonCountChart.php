<?php
namespace App\Filament\Widgets;

use App\Models\TakeLesson;
use Carbon\Carbon;
use Filament\Widgets\ChartWidget;

class UserTakeLessonCountChart extends ChartWidget
{
    protected static ?string $heading = 'Lessons Take';

    protected function getData(): array
    {
        // Ambil data dari 7 hari terakhir
        $lessons = TakeLesson::selectRaw('DATE(created_at) as date, COUNT(*) as total')
            ->where('created_at', '>=', Carbon::now()->subDays(14))
            ->groupBy('date')
            ->orderBy('date', 'asc')
            ->get();

        return [
            'labels' => $lessons->pluck('date')->toArray(),
            'datasets' => [
                [
                    'label' => 'Lessons Take',
                    'data' => $lessons->pluck('total')->toArray(),
                    'backgroundColor' => 'rgba(54, 162, 235, 0.6)',
                    'borderColor' => 'rgba(54, 162, 235, 1)',
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
