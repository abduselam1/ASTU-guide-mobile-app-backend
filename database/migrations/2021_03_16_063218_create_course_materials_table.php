<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCourseMaterialsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('course_materials', function (Blueprint $table) {
            $table->id();
            $table->integer('course_id')->unsigned()->nullable()->default(null);
            $table->foreign('course_id')->references('id')->on('courses')->onUpdate('cascade')->onDelete('set null');
            $table->string('title');
            $table->string('description');
            $table->string('file_name');
            $table->string('file_type');
            $table->string('file_size');
            $table->string('file_storage_location');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('course_materials');
    }
}
