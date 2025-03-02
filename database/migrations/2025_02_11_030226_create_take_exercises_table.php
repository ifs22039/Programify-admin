<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('take_exercises', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("exercise_id");
            $table->unsignedBigInteger("topic_id");
            $table->unsignedBigInteger("lesson_id");
            $table->unsignedBigInteger("user_id");
            $table->unsignedBigInteger("take_exercise_answer_id");
            $table->integer("score");
            $table->timestamp("deleted_at")->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('take_exercises');
    }
};
