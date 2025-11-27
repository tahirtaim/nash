<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    protected $tables = [
        'categories',
        'products',
        'banners',
        'blogs',
        'videos',
        'offers',
        'reviews',
        'sliders',
        'dynamic_pages'
    ];

    public function up(): void
    {
        foreach ($this->tables as $tableName) {
            Schema::table($tableName, function (Blueprint $table) use ($tableName) {
                $table->unsignedBigInteger('language_id')->default(1)->after('id');
                $table->foreign('language_id')->references('id')->on('languages')->onUpdate('cascade');
            });
        }
    }

    public function down(): void
    {
        foreach ($this->tables as $tableName) {
            Schema::table($tableName, function (Blueprint $table) use ($tableName) {
                $table->dropForeign([$tableName . '_language_id_foreign']); // Laravel generates FK name like table_column_foreign
                $table->dropColumn('language_id');
            });
        }
    }
};
