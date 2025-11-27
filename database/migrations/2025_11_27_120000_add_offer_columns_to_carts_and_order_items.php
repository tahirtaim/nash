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
        Schema::table('carts', function (Blueprint $table) {
            if (!Schema::hasColumn('carts', 'offer_id')) {
                $table->foreignId('offer_id')->nullable()->constrained('offers')->onDelete('cascade');
            }
            if (!Schema::hasColumn('carts', 'p_type')) {
                $table->string('p_type')->nullable(); // 'product' or 'offer'
            }
            $table->foreignId('product_id')->nullable()->change();
        });

        Schema::table('order_item_details', function (Blueprint $table) {
            if (!Schema::hasColumn('order_item_details', 'offer_id')) {
                $table->foreignId('offer_id')->nullable()->constrained('offers')->onDelete('cascade');
            }
            $table->foreignId('product_id')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('carts', function (Blueprint $table) {
            $table->dropForeign(['offer_id']);
            $table->dropColumn('offer_id');
            $table->dropColumn('p_type');
            $table->foreignId('product_id')->nullable(false)->change();
        });

        Schema::table('order_item_details', function (Blueprint $table) {
            $table->dropForeign(['offer_id']);
            $table->dropColumn('offer_id');
            $table->foreignId('product_id')->nullable(false)->change();
        });
    }
};
