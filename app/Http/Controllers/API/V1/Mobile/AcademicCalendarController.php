<?php

namespace App\Http\Controllers\API\V1\Mobile;

use App\Http\Controllers\Controller;
use App\Models\AcademicCalendar;
use Illuminate\Http\JsonResponse;

class AcademicCalendarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return new JsonResponse(AcademicCalendar::get(['id', 'title', 'description', 'date']), 200);
    }
}
