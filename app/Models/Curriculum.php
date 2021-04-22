<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Curriculum extends Model
{
    use HasFactory;


    public function Courses_curriculums()
    {
        return $this->hasMany(CoursesCurriculum::class);
    }

    
    public function semester_Course()
    {
        return $this->hasMany(SemesterCourse::class);
    }
}
