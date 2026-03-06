<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Quest extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'content',
        'type',
        'point',
        'exp',
        'timer',
        'difficulty',
        'feedback',
        'created_by',
        'updated_by',
    ];

    public function creator(): BelongsTo
    {
        return $this->belongsTo(Admin::class, "created_by");
    }

    public function updater(): BelongsTo
    {
        return $this->belongsTo(Admin::class, "updated_by");
    }

    public function questAnswers(): HasMany
    {
        return $this->hasMany(QuestAnswer::class);
    }

    protected static function booted()
    {
        static::creating(function ($model) {
            $model->created_by = auth()->id();
            $model->updated_by = auth()->id();
        });

        static::updating(function ($model) {
            $model->updated_by = auth()->id();
        });
    }
}
