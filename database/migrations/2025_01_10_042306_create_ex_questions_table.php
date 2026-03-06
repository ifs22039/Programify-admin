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
        Schema::create('ex_questions', function (Blueprint $table) {
            $table->id();
            $table->longText("content");
            $table->string("type");
            $table->unsignedBigInteger("exercise_id");
            $table->integer("point");
            $table->integer("exp");
            $table->longText("feedback")->nullable();
            $table->unsignedBigInteger("created_by");
            $table->unsignedBigInteger("updated_by");
            $table->timestamp("deleted_at")->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ex_questions');
    }
};
