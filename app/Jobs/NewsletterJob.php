<?php

namespace App\Jobs;


use App\Models\Offer;
use App\Mail\SendMailForNewProduct;
use Illuminate\Support\Facades\Mail;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;

class NewsletterJob implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    protected $newsletters;
    protected $offerId;

    public function __construct(array $newsletters, int $offerId)
    {
        $this->newsletters = $newsletters;
        $this->offerId = $offerId;
    }

    public function handle()
    {
        $offer = Offer::find($this->offerId);

        if (!$offer) {
            return;
        }

        foreach ($this->newsletters as $email) {
            dd($email);
            Mail::to($email)->send(new SendMailForNewProduct($offer));
        }
    }
}
