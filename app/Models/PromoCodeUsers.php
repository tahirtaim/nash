<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PromoCodeUsers extends Model
{
    protected $table = 'promo_code_users';
    protected $fillable = ['user_id', 'promo_code_id', 'used_at'];

}
