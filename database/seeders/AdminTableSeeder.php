<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Admin::create(
            [
                "name" => "Super Admin",
                "email" => "super@gmail.com",
                "password" => Hash::make("kosong123"),
                "is_super" => 1
            ]
        );
    }
}
