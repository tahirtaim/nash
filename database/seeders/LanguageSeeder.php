<?php

namespace Database\Seeders;

use App\Models\Language;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class LanguageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $languages = [
            [
                'name'  => 'English',
                'code'  => 'en',
                'image' => 'uploads/languages-images/flag-united-kingdom.png'
            ],
            [
                'name'  => 'Arabic',
                'code'  => 'ar',
                'image' => 'uploads/languages-images/united-arab-emirates.png'
            ]

        ];

        foreach ($languages as $language) {
            Language::firstOrCreate(
                ['name' => $language['name']], // lookup by name
                [
                    'code'  => $language['code'],
                    'image' => $language['image'],
                ]
            );
        }
    }
}
