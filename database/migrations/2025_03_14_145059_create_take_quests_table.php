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
        Schema::create('take_quests', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("quest_id");
            $table->unsignedBigInteger("user_id");
            $table->longText("answer");
            $table->boolean("is_correct");
            $table->double("score");
            $table->integer("reward_exp");
            $table->integer("reward_point");
            $table->timestamp("deleted_at")->nullable();
            $table->timestamps();

            $table->foreign('quest_id')->references('id')->on('quests')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('take_quests');
    }
};
