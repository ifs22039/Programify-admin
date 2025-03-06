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
        Schema::create('quests', function (Blueprint $table) {
            $table->id();
            $table->string("title");
            $table->longText("content");
            $table->string("type");
            $table->integer("point");
            $table->integer("exp");
            $table->enum('difficulty', ['Easy', 'Medium', 'Hard']);
            $table->longText("feedback")->nullable();
            $table->unsignedBigInteger("created_by");
            $table->unsignedBigInteger("updated_by");
            $table->timestamp("deleted_at")->nullable();
            $table->timestamps();

            $table->foreign('created_by')->references('id')->on('admins')->onDelete('cascade');
            $table->foreign('updated_by')->references('id')->on('admins')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('quests');
    }
};
