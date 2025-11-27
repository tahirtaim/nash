<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    protected $fillable = ['banner_title', 'banner_subtitle', 'url', 'language_id'];

    // A banner has many images
    public function images()
    {
        return $this->hasMany(BannerImage::class, 'banner_id');
    }

    public function language()
    {
        return $this->belongsTo(Language::class);
    }
}
