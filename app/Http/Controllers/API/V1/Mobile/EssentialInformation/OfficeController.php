<?php

namespace App\Http\Controllers\API\V1\Mobile\EssentialInformation;

use App\Http\Controllers\Controller;
use App\Models\EssentialInformation\Office;
use Illuminate\Http\JsonResponse;

class OfficeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new JsonResponse(Office::with('building')->get([
            'id', 'building_id' ,'office_title', 'office_holder_person_name', 'phone_number',
        ]), 200);
    }   
}
