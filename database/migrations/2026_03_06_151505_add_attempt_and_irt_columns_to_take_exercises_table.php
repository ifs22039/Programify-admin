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
        Schema::table('take_exercises', function (Blueprint $table) {
            $table->integer('attempt_number')->default(1)->after('topic_id');
            $table->double('theta_before')->default(0)->after('reward_point');
            $table->double('theta_after')->default(0)->after('theta_before');
            $table->double('beta_before')->default(0)->after('theta_after');
            $table->double('beta_after')->default(0)->after('beta_before');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('take_exercises', function (Blueprint $table) {
            $table->dropColumn([
                'attempt_number',
                'theta_before',
                'theta_after',
                'beta_before',
                'beta_after'
            ]);
        });
    }
};