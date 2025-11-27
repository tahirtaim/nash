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
        Schema::create('get_in_touches', function (Blueprint $table) {
            $table->id();                            // id
            $table->string('full_name');            // full_email (probably "Full Name + Email"? Consider renaming to `full_name`)
            $table->string('subject');                // suject (correct spelling should be "subject")
            $table->string('email_address');         // email_address
            $table->text('comment');                 // commnet (correct spelling should be "comment")
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('get_in_touches');
    }
};
