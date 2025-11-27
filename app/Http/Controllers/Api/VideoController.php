<?php

namespace App\Http\Controllers\Api;

use App\Models\Video;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class VideoController extends Controller
{
    use ApiResponse;

    public function getFeaturedVideos(Request $request)
    {
        $languageId = $request->language_id; 

        $videos = Video::where('video_type', 'featured')->where('status', 1)->where('language_id', $languageId)->select('id', 'title', 'youtube_link', 'thumbnail')->get();
        foreach ($videos as $video) {
            $video->thumbnail = asset($video->thumbnail);
        }
        if ($videos->count() > 0) {
            return $this->success($videos, 'Featured Videos retrieved successfully', 200);
        }
        return $this->success([], 'Featured Videos not available', 200);
    }


    public function getPopularVideos(Request $request)
    {
        $languageId = $request->language_id; 

        $videos = Video::where('video_type', 'popular')->where('status', 1)->where('language_id', $languageId)->select('id', 'title', 'youtube_link', 'thumbnail')->get();
        foreach ($videos as $video) {
            $video->thumbnail = asset($video->thumbnail);
        }
        if ($videos->count() > 0) {
            return $this->success($videos, 'Popular Videos retrieved successfully', 200);
        }
        return $this->success([], 'Popular Videos not available', 200);
    }
}
