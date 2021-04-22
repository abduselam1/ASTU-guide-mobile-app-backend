<?php

namespace App\Http\Controllers\API\V1\Mobile;
use App\Http\Controllers\Controller;
use App\Models\Course;
use Illuminate\Http\JsonResponse;

class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new JsonResponse(Course::with('course_materials')->get(['id', 'code', 'title', 'credit_hour', 'prerequisites']), 200);
    }

    public function show(Course $id){
        return new JsonResponse($id,200);
    }
}
