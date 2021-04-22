<?php

use App\Http\Controllers\API\V1\Mobile;



Route::group(['prefix' => 'auth', 'namespace' => 'Auth'], __DIR__ . '/auth.php');

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return auth()->user();
});

Route::get('rules-and-regulations', [Mobile\RuleAndRegulationController::class, 'index']);

Route::get('academic-calendars', [Mobile\AcademicCalendarController::class, 'index']);

Route::group(
    ['prefix' => 'essential-informations', 'namespace' => 'EssentialInformation'],
    __DIR__ . '/essential_information.php'
);

Route::get('buildings', [Mobile\BuildingController::class, 'index']);

Route::get('curricula', [Mobile\CurriculumController::class, 'index']);

Route::get('course-curriculum/{id}',[Mobile\CurriculumController::class, 'show']);

Route::get('courses', [Mobile\CourseController::class, 'index']);

Route::get('course/{id}',[Mobile\CourseController::class,'show']);

Route::get('course-materials', [Mobile\CourseMaterialController::class, 'index']);

Route::get('course-material/{id}', [Mobile\CourseMaterialController::class, 'show']);

Route::get('lostid', [Mobile\LostIdController::class, 'index']);

Route::post('lostid',[Mobile\LostIdController::class, 'store']);