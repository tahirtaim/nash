<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FeatureSectionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $settings = [
            [
                'key' => 'free_shipping',
                'title' => 'Free Shipping',
                'description' => 'Get free shipping on orders over $50',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'key' => 'support_24_7',
                'title' => 'Support 24/7',
                'description' => 'We are here to help you anytime',
                'created_at' => now(),
                'updated_at' => now(),
            ],

        ];

        DB::table('feature_sections')->insert($settings);
    }
}
