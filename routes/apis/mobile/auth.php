<?php

use App\Http\Controllers\API\V1\Mobile\Auth\ForgotPasswordController;
use App\Http\Controllers\API\V1\Mobile\Auth\LoginController;
use App\Http\Controllers\API\V1\Mobile\Auth\RegisterController;
use App\Http\Controllers\API\V1\Mobile\Auth\ResetPasswordController;

Route::post('login', [LoginController::class, 'login']);

Route::post('register', [RegisterController::class, 'register']);

Route::post('forgot-password', [ForgotPasswordController::class, 'sendResetCodeEmail']);

Route::post('reset-password', [ResetPasswordController::class, 'reset']);
