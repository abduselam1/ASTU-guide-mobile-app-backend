<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1', 'namespace' => 'API\V1'], function () {
    Route::group(['prefix' => 'mobile', 'namespace' => 'Mobile'], __DIR__ . '/apis/mobile/index.php');

});
