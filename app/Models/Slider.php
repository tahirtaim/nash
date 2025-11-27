<?php

namespace App\Models;

use App\Models\Language;
use App\Models\SliderImage;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    protected $fillable = [
        "title",
        "description",
        "button_text",
        "button_link",
        "page_name",
        "status",
        "language_id",
    ];


    public function images()
    {
        return $this->hasMany(SliderImage::class, 'slider_id', 'id');
    }

    public function language()
    {
        return $this->belongsTo(Language::class);
    }
}
