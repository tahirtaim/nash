<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{

    protected $fillable = [
        'offer_name',
        'offer_start_date',
        'offer_end_date',
        'discount_type',
        'discount_value',
        'total_price',
        'discount_price',
        'final_price',
        'image',
        'description',
        'language_id'
    ];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'offer_products', 'offer_id', 'product_id');
    }

     public function language()
    {
        return $this->belongsTo(Language::class);
    }

    protected $casts = [
        'id' => 'integer',
        'total_price' => 'decimal:2',
        'discount_price' => 'decimal:2',
        'offer_name' => 'string',
        'offer_start_date' => 'date',
        'offer_end_date' => 'date',
        'image' => 'string',
        'language_id' => 'integer',
    ];
}
