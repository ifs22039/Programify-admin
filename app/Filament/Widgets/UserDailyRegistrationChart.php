<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use App\Models\User;
use Carbon\Carbon;

class UserDailyRegistrationChart extends ChartWidget
{
    protected static ?int $sort = 3;

    protected static ?string $heading = 'Daily Registration';

    protected function getData(): array
    {
        // Ambil 30 hari terakhir
        $dates = collect(range(0, 29))
            ->map(fn($day) => Carbon::today()->subDays($day)->format('Y-m-d'))
            ->reverse()
            ->values(); // Pastikan index dimulai dari 0

        // Ambil jumlah user yang mendaftar per hari
        $registrations = User::where('created_at', '>=', Carbon::today()->subDays(29))
            ->selectRaw('DATE(created_at) as date, COUNT(id) as count')
            ->groupBy('date')
            ->orderBy('date')
            ->get()
            ->pluck('count', 'date');

        // Pastikan semua tanggal memiliki nilai default 0 jika tidak ada data
        $chartData = $dates->map(fn($date) => $registrations->get($date, 0));

        return [
            'datasets' => [
                [
                    'label' => 'New User',
                    'data' => $chartData->toArray(), // Gunakan toArray() langsung
                    'borderColor' => '#22c55e', // Hijau terang
                    'backgroundColor' => 'rgba(34, 197, 94, 0.2)', // Hijau transparan
                    'fill' => true,
                ],
            ],
            'labels' => $dates->toArray(), // Pastikan labels adalah array biasa
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
