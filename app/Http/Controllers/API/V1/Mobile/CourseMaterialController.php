<?php

namespace App\Http\Controllers\API\V1\Mobile;

use App\Http\Controllers\Controller;
use App\Models\CourseMaterial;
use Illuminate\Http\JsonResponse;

class CourseMaterialController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new JsonResponse(CourseMaterial::get(['id', 'course_id', 'title', 'description', 'file_name', 'file_type', 'file_size', 'file_storage_location']), 200);
    }

    public function show($id){

        return new JsonResponse(CourseMaterial::with('course')->where('course_id',$id)->get(['course_id','title', 'description', 'file_name', 'file_type', 'file_size', 'file_storage_location']),200);
    }
}
