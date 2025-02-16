<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'last_login',
        'total_point',
        'total_exp',
        'level_id',
        'token'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function creator(): BelongsTo
    {
        return $this->belongsTo(Admin::class, "created_by");
    }

    public function updater(): BelongsTo
    {
        return $this->belongsTo(Admin::class, "updated_by");
    }

    public function accountLevel(): BelongsTo
    {
        return $this->belongsTo(Level::class, "level_id");
    }

//    protected static function booted()
//    {
//        static::creating(function ($model) {
//            $model->level_id = 1;
//            $model->created_by = auth()->id() ?? 1;
//            $model->updated_by = auth()->id() ?? 1;
//            if (!empty($model->password)) {
//                $model->password = Hash::make($model->password);
//            }
//        });
//
//        static::updating(function ($model) {
//            $model->updated_by = auth()->id() ?? 1;
//        });
//    }
}
