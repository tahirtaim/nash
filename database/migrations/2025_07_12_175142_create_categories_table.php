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
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('name', 50); // category name
            $table->string('category_image', 255)->nullable(); // category image
            $table->string('slug', 50)->unique(); // optional for SEO URLs
            $table->text('description')->nullable(); // optional
            $table->enum('status', [1, 0])->default(1)->comment('1 = active, 0 = inactive'); // active/inactive
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('categories');
    }
};
