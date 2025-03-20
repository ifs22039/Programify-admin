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
        Schema::create('have_achievements', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("achievement_id");
            $table->unsignedBigInteger("user_id");
            $table->timestamp("deleted_at")->nullable();
            $table->timestamps();

            $table->foreign('achievement_id')->references('id')->on('achievements')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('have_achievements');
    }
};
