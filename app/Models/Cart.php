<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $fillable = ['user_id', 'product_id', 'offer_id', 'p_type'];

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    public function offer(){
        return $this->belongsTo(Offer::class, 'offer_id');
    }
    
}
