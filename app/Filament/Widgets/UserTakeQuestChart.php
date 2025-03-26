<?php
namespace App\Filament\Widgets;

use App\Models\TakeQuest;
use Carbon\Carbon;
use Filament\Widgets\ChartWidget;

class UserTakeQuestChart extends ChartWidget
{
    protected static ?string $heading = 'Users Take Quest';

    protected function getData(): array
    {
        // Ambil data dari 7 hari terakhir
        $quests = TakeQuest::selectRaw('DATE(created_at) as date, COUNT(DISTINCT user_id) as total')
            ->where('created_at', '>=', Carbon::now()->subDays(14))
            ->groupBy('date')
            ->orderBy('date', 'asc')
            ->get();

        return [
            'labels' => $quests->pluck('date')->toArray(),
            'datasets' => [
                [
                    'label' => 'Users Take Quest',
                    'data' => $quests->pluck('total')->toArray(),
                    'backgroundColor' => 'rgba(204, 119, 34, 0.6)',
                    'borderColor' => 'rgba(204, 119, 34, 1)',
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
