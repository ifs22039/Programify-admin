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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->timestamp("last_login")->default(now());
            $table->integer("total_point")->default(0);
            $table->integer("total_exp")->default(0);
            $table->unsignedBigInteger("level_id");
            $table->unsignedBigInteger("created_by");
            $table->unsignedBigInteger("updated_by");
            $table->rememberToken();
            $table->timestamps();

            // $table->foreign('created_by')->references('id')->on('admins')->onDelete('cascade');
            // $table->foreign('updated_by')->references('id')->on('admins')->onDelete('cascade');
            // $table->foreign('level_id')->references('id')->on('levels')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
