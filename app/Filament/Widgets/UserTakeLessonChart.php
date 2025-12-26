<?php
namespace App\Filament\Widgets;

use App\Models\TakeLesson;
use Carbon\Carbon;
use Filament\Widgets\ChartWidget;

class UserTakeLessonChart extends ChartWidget
{
    protected static ?int $sort = 4;

    protected static ?string $heading = 'Users Take Lesson';

    protected function getData(): array
    {
        // Ambil data dari 7 hari terakhir
        $lessons = TakeLesson::selectRaw('DATE(created_at) as date, COUNT(DISTINCT user_id) as total')
            ->where('created_at', '>=', Carbon::now()->subDays(14))
            ->groupBy('date')
            ->orderBy('date', 'asc')
            ->get();

        return [
            'labels' => $lessons->pluck('date')->toArray(),
            'datasets' => [
                [
                    'label' => 'Users Take Lesson',
                    'data' => $lessons->pluck('total')->toArray(),
                    'backgroundColor' => 'rgba(54, 162, 235, 0.6)',
                    'borderColor' => 'rgba(54, 162, 235, 1)',
                    'borderWidth' => 1,
                    'fill' => true,
                    'tension' => 0.4, 
                ],
            ],
        ];
    }

    protected function getType(): string
    {
        return 'line'; // Diagram garis
    }
}
