<?php

namespace App\Filament\Widgets;

use App\Models\Admin;
use App\Models\Topic;
use App\Models\User;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class ProgamifyStats extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('Users', User::count()),
            Stat::make('Admins', Admin::count()),
            Stat::make('Topics', Topic::count()),
        ];
    }
}
