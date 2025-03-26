<?php
namespace App\Filament\Widgets;

use App\Models\TakeQuest;
use Carbon\Carbon;
use Filament\Widgets\ChartWidget;

class UserTakeQuestCountChart extends ChartWidget
{
    protected static ?string $heading = 'Quests Take';

    protected function getData(): array
    {
        // Ambil data dari 7 hari terakhir
        $quests = TakeQuest::selectRaw('DATE(created_at) as date, COUNT(*) as total')
            ->where('created_at', '>=', Carbon::now()->subDays(14))
            ->groupBy('date')
            ->orderBy('date', 'asc')
            ->get();

        return [
            'labels' => $quests->pluck('date')->toArray(),
            'datasets' => [
                [
                    'label' => 'Quests Take',
                    'data' => $quests->pluck('total')->toArray(),
                    'backgroundColor' => 'rgba(204, 119, 34, 0.6)',
                    'borderColor' => 'rgba(204, 119, 34, 1)',
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
