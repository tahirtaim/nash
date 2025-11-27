<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\Language;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SetLanguage
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $langCode = $request->query('lang', 'en');
        $language = Language::where('code', $langCode)->first();

        if (!$language) {
            $language = Language::where('code', 'en')->first();
        }

        $request->merge([
            'language_id'    => $language->id,
            'language_code'  => $language->code,
            'language_name'  => $language->name,
            'language_image' => $language->image,
        ]);
        return $next($request);
    }
}
