<?php

namespace App\Http\Controllers\API\V1\Mobile\EssentialInformation;

use App\Http\Controllers\Controller;
use App\Models\EssentialInformation\Ambulance;
use Illuminate\Http\JsonResponse;

class AmbulanceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new JsonResponse(Ambulance::get(['id', 'driver_name', 'phone_number']), 200);
    }
}
