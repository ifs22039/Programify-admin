<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
{
    Schema::table('ex_questions', function (Blueprint $table) {
        $table->enum('difficulty', ['easy', 'medium', 'hard'])->default('easy')->after('exp');
    });
}

public function down(): void
{
    Schema::table('ex_questions', function (Blueprint $table) {
        $table->dropColumn('difficulty');
    });
}

};
