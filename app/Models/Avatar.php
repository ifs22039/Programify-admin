<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Avatar extends Model
{
    use HasFactory;

    public function creator(): BelongsTo
    {
        return $this->belongsTo(Admin::class, "created_by");
    }

    public function updater(): BelongsTo
    {
        return $this->belongsTo(Admin::class, "updated_by");
    }
}
