<?php

namespace Database\Seeders;

use App\Models\Avatar;
use App\Models\HaveAvatar;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AvatarSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Avatar::create([
            "title" => "Male Default",
            "picture" => "",
            "price" => 0,
            "created_by" => 1,
            "updated_by" => 1
        ]);
        $users = User::all();

        foreach ($users as $user) {
            HaveAvatar::create([
                "user_id" => $user->id,
                "avatar_id" => 1,
            ]);
        }
    }
}
