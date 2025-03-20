<?php

namespace Database\Seeders;

use App\Models\Badge;
use Illuminate\Database\Seeder;

class BadgeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $badges = [
            [
                'title' => 'Beginner Badge',
                'picture' => 'assets\badges\badge_1.png',
                'description' => 'This is a desc for Badge 1'
            ],
            [
                'title' => 'Medium Badge',
                'picture' => 'assets\badges\badge_2.png',
                'description' => 'This is a desc for Badge 2'
            ],
            [
                'title' => 'Expert Badge',
                'picture' => 'assets\badges\badge_3.png',
                'description' => 'This is a desc for Badge 3'
            ],
        ];

        foreach ($badges as $badge) {
            Badge::create($badge);
        }
    }
}