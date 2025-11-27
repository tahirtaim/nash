<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Promocode extends Model
{

    protected $table = 'promo_codes';
    protected $fillable = [
        'code', 'type', 'value', 'min_order_amount',
        'max_uses', 'uses', 'max_users', 'used_by_users',
        'expires_at', 'status'
    ];

    protected $casts = [
        'expires_at' => 'datetime',
    ];


    
}
