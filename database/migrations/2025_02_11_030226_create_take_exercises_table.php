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
            $table->json("answers");
            $table->integer("total_correct");
            $table->integer("total_question");
            $table->float("score");
            $table->integer("total_exp");
            $table->integer("total_point");
            $table->timestamp("deleted_at")->nullable();
            $table->timestamps();

            $table->foreign('exercise_id')->references('id')->on('exercises')->onDelete('cascade');
            $table->foreign('topic_id')->references('id')->on('topics')->onDelete('cascade');
            $table->foreign('lesson_id')->references('id')->on('lessons')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
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
