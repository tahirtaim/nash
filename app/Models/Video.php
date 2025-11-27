<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    protected $fillable = [
        'title',
        'thumbnail',
        'video_type',
        'youtube_link',
        'status',
        'language_id',
    ];

    public function language()
    {
        return $this->belongsTo(Language::class);
    }
}
