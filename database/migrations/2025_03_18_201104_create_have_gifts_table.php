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
        Schema::create('have_gifts', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("gift_id");
            $table->unsignedBigInteger("user_id");
            $table->boolean("is_active");
            $table->timestamp("deleted_at")->nullable();
            $table->timestamps();

            $table->foreign('gift_id')->references('id')->on('gifts')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('have_gifts');
    }
};
