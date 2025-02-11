<?php

namespace Database\Seeders;

use App\Models\Level;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use function PHPSTORM_META\map;

class LevelsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $exp = 0;
        for ($i = 1; $i <= 10; $i++) {
            Level::create(
                [
                    "level" => $i,
                    "exp_needed" => $exp,
                    "created_by" => 1,
                    "updated_by" => 1,
                ]
            );
            $exp += 200;
        }
    }
}
