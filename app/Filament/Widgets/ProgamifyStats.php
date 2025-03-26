<?php

namespace App\Filament\Widgets;

use App\Models\Admin;
use App\Models\Topic;
use App\Models\User;
use Carbon\Carbon;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class ProgamifyStats extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            $this->getStatWithTrend(User::class, 'Users'),
            $this->getStatWithTrend(Admin::class, 'Admins'),
            $this->getStatWithTrend(Topic::class, 'Topics'),
        ];
    }

    private function getStatWithTrend($model, $label)
    {
        $totalCount = $model::count();

        $trends = $model::selectRaw('DATE(created_at) as date, COUNT(*) as total')
            ->where('created_at', '>=', Carbon::now()->subDays(7))
            ->groupBy('date')
            ->orderBy('date', 'asc')
            ->pluck('total')
            ->toArray();

        $trends = array_pad($trends, -7, 0);

        $lastWeekTotal = array_sum($trends);
        $percentageChange = $lastWeekTotal > 0
            ? round(($lastWeekTotal / max($totalCount - $lastWeekTotal, 1)) * 100, 2)
            : 0;

        return Stat::make($label, $totalCount)
            ->description(($percentageChange >= 0 ? '+' : '') . "{$percentageChange}% last 7 days")
            ->color($percentageChange >= 0 ? 'success' : 'danger')
            ->chart($trends); 
    }
}
