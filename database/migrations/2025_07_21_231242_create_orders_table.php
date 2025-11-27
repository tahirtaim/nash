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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();

            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('order_number')->unique();

            $table->enum('payment_status', ['pending', 'completed', 'failed'])->default('pending');
            $table->enum('status', ['pending', 'received', 'completed', 'shipped', 'delivered'])->default('pending');
            $table->string('payment_method')->nullable();

            $table->float('sub_total', 15, 2)->default(0);
            $table->float('discount_amount', 15, 2)->default(0);
            $table->float('total_amount', 15, 2)->default(0);
            $table->float('shipping_cost', 15, 2)->default(0);

            $table->string('coupon_code')->nullable();
            $table->boolean('is_paid')->default(false);

            $table->string('cancel_reason')->nullable();
            $table->timestamp('placed_at')->nullable();
            $table->timestamp('delivered_at')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
