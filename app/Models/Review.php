<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $fillable = [
        'name',
        'profession',
        'photo',
        'review_content',
        'rating_point',
        'language_id',
    ];


    protected $casts = [
        'review_content' => 'string',
        'rating_point' => 'float',
        'language_id' => 'integer',
    ];

    public function language()
    {
        return $this->belongsTo(Language::class);
    }
}
