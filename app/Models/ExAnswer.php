<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ExAnswer extends Model
{
    use HasFactory;

    protected $fillable = [
        "content",
        "is_correct",
        "ex_question_id",
        "created_by",
        "updated_by"
    ];

    public function lesson(): BelongsTo
    {
        return $this->belongsTo(ExQuestion::class);
    }

    protected static function booted()
    {
        static::creating(function ($model) {
            $model->created_by = auth()->id();
            $model->updated_by = auth()->id();
        });
    }
}
