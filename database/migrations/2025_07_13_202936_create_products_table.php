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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('category_id');
            $table->string('product_name');
            $table->string('slug');
            $table->string('product_code')->nullable();
            $table->string('brand')->nullable();
            $table->string('product_type', 200)->nullable();
            $table->enum('product_version_type', ['arabic', 'english'])->default('arabic');
            $table->text('short_description');
            $table->longText('description')->nullable();
            $table->longText('additional_description')->nullable();
            $table->float('regular_price')->default(0);
            $table->float('discount_price')->nullable();
            $table->float('weight')->nullable();
            $table->enum('weight_unit', ['kg', 'g', 'lb'])->default('kg');
            $table->enum('status', ['1', '2', '0'])->default('1')->comment('1 = published, 2 = draft, 0 = unpublished');
            $table->string('product_image');
            $table->timestamps();

            // Foreign key constraint
            $table->foreign('category_id')
                ->references('id')
                ->on('categories')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
