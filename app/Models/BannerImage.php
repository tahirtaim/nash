<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BannerImage extends Model
{
    protected $fillable = ['banner_id', 'image_path'];

    // Optional: each image belongs to a banner
    public function banner()
    {
        return $this->belongsTo(Banner::class, 'banner_id');
    }
}
