<?php

use App\Http\Controllers\API\V1\Mobile\EssentialInformation\AmbulanceController;
use App\Http\Controllers\API\V1\Mobile\EssentialInformation\OfficeController;

Route::get('ambulances', [AmbulanceController::class, 'index']);

Route::get('offices', [OfficeController::class, 'index']);