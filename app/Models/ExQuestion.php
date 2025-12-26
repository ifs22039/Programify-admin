<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ExQuestion extends Model
{
    use HasFactory;

    protected $fillable = [
    "content",
    "type",
    "exercise_id",
    "point",
    "exp",
    "difficulty",
    "created_by",
    "updated_by"
];


    public function exercise(): BelongsTo
    {
        return $this->belongsTo(Exercise::class);
    }

    public function exanswers(): HasMany
    {
        return $this->hasMany(ExAnswer::class);
    }

    protected static function booted()
    {
        static::creating(function ($model) {
            $model->created_by = auth()->id();
            $model->updated_by = auth()->id();
        });
    }
}
