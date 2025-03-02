<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Topic extends Model
{
    use HasFactory;

    protected $fillable = [
        "name",
        "created_by",
        "updated_by"
    ];

    public function lessons(): HasMany
    {
        return $this->hasMany(Lesson::class);
    }

    public function takeLessons(): HasMany
    {
        return $this->hasMany(TakeLesson::class);
    }
}
