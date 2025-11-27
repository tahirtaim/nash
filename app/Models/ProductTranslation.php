<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductTranslation extends Model
{
    protected $fillable = [
        'product_id', 'locale', 'product_name', 'description', 'short_description', 'additional_description', 'slug'
    ];
}
