<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class UserTest extends TestCase
{
    public function testRegisterSuccess(): void
    {
        $this->post('/api/users', [
            'email' => 'boyysitorus@gmail.com',
            'password' => '11s21025',
            'password_confirmation' => '11s21025',
            'name' => "Boy Martahan Sitorus",
        ])
            ->assertStatus(201)
            ->assertJson([
                "data" => [
                    "email" => "boyysitorus@gmail.com",
                    "name" => "Boy Martahan Sitorus"
                ]
            ]);

    }

    public function testRegisterFailed(): void
    {
        $this->post('/api/users', [
            'email' => '',
            'password' => '',
            'password_confirmation' => '',
            'name' => "",
        ])
            ->assertStatus(400)
            ->assertJson([
                "errors" => [
                    "email" => [],
                    "name" => [],
                    "password" => []
                ]
            ]);
    }
}
