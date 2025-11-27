<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DynamicPage extends Model
{
    protected $fillable = ['slug', 'title', 'content', 'status', 'language_id'];

    public function language()
    {
        return $this->belongsTo(Language::class);
    }
}
