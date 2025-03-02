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
        Schema::create('quest_answers', function (Blueprint $table) {
            $table->id();
            $table->longText("content");
            $table->boolean("is_correct")->default(0);
            $table->unsignedBigInteger("quest_id");
            $table->unsignedBigInteger("created_by");
            $table->unsignedBigInteger("updated_by");
            $table->timestamp("deleted_at")->nullable();
            $table->timestamps();

            $table->foreign('quest_id')->references('id')->on('quests')->onDelete('cascade');
            $table->foreign('created_by')->references('id')->on('admins')->onDelete('cascade');
            $table->foreign('updated_by')->references('id')->on('admins')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('quest_answers');
    }
};
