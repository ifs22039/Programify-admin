<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use App\Models\User;
use Carbon\Carbon;

class UserDailyLoginChart extends ChartWidget
{
    protected static ?int $sort = 2;

    protected static ?string $heading = 'Daily User Logins';

    protected function getData(): array
    {
        // Ambil 30 hari terakhir
        $dates = collect(range(0, 29))
            ->map(fn($day) => Carbon::today()->subDays($day)->format('Y-m-d'))
            ->reverse()
            ->values(); // Pastikan index dimulai dari 0

        // Ambil jumlah user yang login per hari
        $logins = User::whereNotNull('last_login')
            ->where('last_login', '>=', Carbon::today()->subDays(29))
            ->selectRaw('DATE(last_login) as date, COUNT(id) as count')
            ->groupBy('date')
            ->orderBy('date')
            ->get()
            ->pluck('count', 'date');

        // Pastikan semua tanggal memiliki nilai default 0 jika tidak ada data
        $chartData = $dates->map(fn($date) => $logins->get($date, 0));

        return [
            'datasets' => [
                [
                    'label' => 'User Logins',
                    'data' => $chartData->toArray(),
                    'borderColor' => '#3b82f6', // Warna biru
                    'backgroundColor' => 'rgba(59, 130, 246, 0.2)',
                    'fill' => true,
                ],
            ],
            'labels' => $dates->toArray(),
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
