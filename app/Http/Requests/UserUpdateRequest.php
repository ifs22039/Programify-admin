<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return $this->user() != null;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => ['nullable', 'string', 'max:100'],
            'nim' => ['nullable', 'string', 'max:12', 'min:8'],
            'angkatan' => ['nullable', 'integer'],
            'password' => ['nullable', 'string', 'max:100', 'min:8', 'confirmed'],
            'password_confirmation' => ['nullable', 'string', 'max:100']
        ];
    }
}
