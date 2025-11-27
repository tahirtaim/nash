<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class AboutUs extends Model
{
    use HasFactory;

    protected $fillable = [
        'language_id',
        'welcome_title',
        'welcome_description',
        'story_title',
        'story_description',
        'philosophy_title',
        'philosophy_description',
        'product_title',
        'product_description',
        'community_title',
        'community_description',
        'touch_title',
        'touch_description',
        'status',
    ];


    public function language()
    {
        return $this->belongsTo(Language::class);
    }
}
