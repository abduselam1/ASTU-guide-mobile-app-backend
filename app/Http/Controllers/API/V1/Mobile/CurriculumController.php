<?php

namespace App\Http\Controllers\API\V1\Mobile;

use App\Http\Controllers\Controller;
use App\Models\Curriculum;
use Illuminate\Http\JsonResponse;

class CurriculumController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new JsonResponse(Curriculum::with(['Courses_curriculums'=>function($query){
            $query->with(['course' => function($course){
                $course->with('course_materials')->get();
            }])->get();
        },'semester_Course'])->where('active',1)->get(['id', 'program_name', 'active']), 200);
    }

    public function show($id){
        return new JsonResponse(Curriculum::with(['Courses_curriculums'=>function($query){
            $query->with('course')->get();
        },'semester_Course'])->where('active',1)->get(['id', 'program_name', 'active']), 200);

    }
}