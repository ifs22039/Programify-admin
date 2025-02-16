<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserLoginRequest;
use App\Http\Requests\UserRegisterRequest;
use App\Http\Requests\UserUpdateRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserController extends Controller
{
    public function register(UserRegisterRequest $request): JsonResponse
    {
        $data = $request->validated();

        if (User::where('email', $data['email'])->exists()) {
            throw new HttpResponseException(response([
                'errors' => [
                    "email" => [
                        "Email already exists"
                    ],
                ],
            ], 400));
        }

        $user = new User($data);
        $user->nim = strtoupper($data['nim']);
        $user->password = Hash::make($data['password']);
        $user->level_id = 1;
        $user->created_by = null;
        $user->updated_by = null;
        $user->save();

        return (new UserResource($user))->response()->setStatusCode(201);
    }

    public function login(UserLoginRequest $request): JsonResponse
    {
        $data = $request->validated();

        $user = User::where('email', $data['email'])->first();

        if (!$user || !Hash::check($data['password'], $user->password)) {
            throw new HttpResponseException(response([
                'errors' => [
                    "message" => [
                        "email or password is incorrect"
                    ],
                ],
            ], 401));
        }

        $user->token = Str::uuid()->toString();
        $user->save();

        return (new UserResource($user))->response()->setStatusCode(200);
    }

    public function get(): UserResource
    {
        $user = Auth::user();
        return new UserResource($user);
    }

    public function update(UserUpdateRequest $request): UserResource
    {
        $data = $request->validated();

        $user = Auth::user();

        if (isset($data['name'])) {
            $user->name = $data['name'];
        }

        if (isset($data['nim'])) {
            $user->nim = $data['nim'];
        }

        if (isset($data['angkatan'])) {
            $user->angkatan = $data['angkatan'];
        }

        if (isset($data['password']) && isset($data['password_confirmation'])) {
            $user->name = Hash::make($data['password']);
        }

        $user->save();

        return new UserResource($user);
    }

    public function logout(): JsonResponse
    {
        $user = Auth::user();
        $user->token = null;
        $user->save();

        return response()->json([
            "data" => "true"
        ])->setStatusCode(200);
    }
}
