<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'category_id',
        'product_name',
        'slug',
        'brand',
        'product_type',
        'product_version_type',
        'weight',
        'weight_unit',
        'color',
        'size',
        'description',
        'additional_description',
        'discount_price',
        'short_description',
        'regular_price',
        'quantity',
        'product_image',
        'language_id'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }


    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function inventory()
    {
        return $this->hasOne(Inventory::class);
    }


    public function galleries()
    {
        return $this->hasMany(ImageGallery::class);
    }

    public function offers()
    {
        return $this->belongsToMany(Offer::class, 'offer_product', 'product_id', 'offer_id');
    }


    protected $casts = [
        'category_id'              => 'integer',
        'product_name'             => 'string',
        'slug'                     => 'string',
        'product_code'             => 'string',
        'brand'                    => 'string',
        'product_type'             => 'string',  // enum handled as string
        'product_version_type'     => 'string',  // enum handled as string
        'short_description'        => 'string',  // or 'text'
        'description'              => 'string',  // longtext still string
        'additional_description'   => 'string',
        'regular_price'            => 'float',
        'discount_price'           => 'float',
        'weight'                   => 'float',
        'weight_unit'              => 'string',  // enum
        'status'                   => 'integer', // enum with numeric values (1, 2, 0)
        'product_image'            => 'string',
        'language_id'              => 'integer',

    ];

    protected $hidden = [
        'created_at',
        'updated_at',
        'status',
    ];

    public function translations()
    {
        return $this->hasMany(ProductTranslation::class);
    }

    public function translate($locale = null)
    {
        $locale = $locale ?? app()->getLocale();
        return $this->translations()->where('locale', $locale)->first();
    }

    public function language()
    {
        return $this->belongsTo(Language::class);
    }
}
