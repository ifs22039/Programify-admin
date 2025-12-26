<?php

namespace App\Filament\Widgets;

use App\Models\User;
use Filament\Widgets\ChartWidget;

class UserTotalDistributionLevelChart extends ChartWidget
{
    protected static ?int $sort = 7;

    protected static ?string $heading = 'User Level Distribution';

    protected function getData(): array
    {
        // Definisikan rentang level (1-10, 11-20, dst.)
        $levelRanges = range(1, 91, 10);
        $labels = [];
        $data = [];

        foreach ($levelRanges as $start) {
            $end = $start + 9;
            $labels[] = "$start-$end";
            $data[] = User::whereBetween('level_id', [$start, $end])->count();
        }

        return [
            'datasets' => [
                [
                    'label' => 'Users per Level Group',
                    'data' => $data,
                    'backgroundColor' => [
                        '#FF6384',
                        '#36A2EB',
                        '#FFCE56',
                        '#4BC0C0',
                        '#9966FF',
                        '#FF9F40',
                        '#C9CBCF',
                        '#E7E9ED',
                        '#B4A7D6',
                        '#76D7C4'
                    ],
                    'borderWidth' => 1,
                    'hoverOffset' => 10,
                ],
            ],
            'labels' => $labels,
        ];
    }

    protected function getType(): string
    {
        return 'pie';
    }

    protected function getOptions(): array
    {
        return [
            'responsive' => true,
            'maintainAspectRatio' => false,
            'aspectRatio' => 1, // Angka lebih besar mengecilkan chart (default 2)
            'plugins' => [
                'legend' => ['position' => 'bottom'],
                'tooltip' => ['enabled' => true],
            ],
        ];
    }

}
