<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('admin_settings')->insert([
            'title'          => 'My Admin Panel',
            'email'          => 'admin@example.com',
            'logo'           => 'uploads/admin-logo.png',
            'favicon'        => 'uploads/admin-favicon.ico',
            'copyright'      => '© 2025 My Admin Panel. All rights reserved.',
            'hotline'        => '+880123456789',
            'delivery_charge' => 50, // Default delivery charge
            'invoice_number' => rand(1000, 9999),
            'address'        => '123 Admin Street, City, Country',
            'created_at'     => now(),
            'updated_at'     => now(),
        ]);
    }
}
