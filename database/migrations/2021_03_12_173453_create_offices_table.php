<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOfficesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('offices', function (Blueprint $table) {
            $table->id();
            $table->integer('building_id')->unsigned()->nullable()->default(null);
            $table->foreign('building_id')->references('id')->on('buildings')->onUpdate('cascade')->onDelete('set null');
            $table->string('offiec_title');
            $table->string('office_holder_person_name');
            $table->string('phone_number'); 
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
        Schema::dropIfExists('offices');
    }
}
