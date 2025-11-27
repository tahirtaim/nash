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
        Schema::create('about_us', function (Blueprint $table) {
            $table->id();
            $table->foreignId('language_id')->default(1);
            $table->string('welcome_title')->nullable();
            $table->text('welcome_description')->nullable();
            $table->string('story_title')->nullable();
            $table->text('story_description')->nullable();
            $table->string('philosophy_title')->nullable();
            $table->text('philosophy_description')->nullable();
            $table->string('product_title')->nullable();
            $table->text('product_description')->nullable();
            $table->string('community_title')->nullable();
            $table->text('community_description')->nullable();
            $table->string('touch_title')->nullable();
            $table->text('touch_description')->nullable();
            $table->tinyInteger('status')->default(1)->comment('1=Published, 0=Unpublished');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('about_us');
    }
};
