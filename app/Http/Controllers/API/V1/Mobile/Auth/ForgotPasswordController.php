<?php

namespace App\Http\Controllers\API\V1\Mobile\Auth;

use App\Http\Controllers\Controller;
use App\Models\Auth\MobilePasswordReset;
use App\Models\User;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
     */

    use SendsPasswordResetEmails;

    /**
     * Get the user for the given credentials.
     *
     * @param  array  $credentials
     * @return \Illuminate\Contracts\Auth\CanResetPassword|null
     *
     * @throws \UnexpectedValueException
     */
    public function getUser($email)
    {
        return User::where(['email' => $email])->first();
    }

    /**
     * Send a password reset code to a user.
     *
     * @param  String  $email
     * @return string
     */
    public function sendResetCode(String $email)
    {

        $user = $this->getUser($email);

        if (is_null($user)) {
            return false;
        }

        $mobilePasswordReset = MobilePasswordReset::create([
            'email' => $user->email,
            'code' => random_int(1001, 9999),
            'created_at' => now(),
        ]);

        $user->sendPasswordResetNotification($mobilePasswordReset->code);

        return true;
    }

    /**
     * Send a reset link to the given user.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function sendResetCodeEmail(Request $request)
    {
        $this->validateEmail($request);

        $sent = $this->sendResetCode($request->input('email'));

        return $sent ? $this->sendResetCodeResponse($request, $sent)
        : $this->sendResetCodeFailedResponse($request, $sent);
    }

    /**
     * Get the response for a successful password reset link.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $response
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    protected function sendResetCodeResponse(Request $request, $response)
    {
        return new JsonResponse(['message' => ['Reset code successfully sent']], 200);
    }

    /**
     * Get the response for a failed password reset link.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $response
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    protected function sendResetCodeFailedResponse(Request $request, $response)
    {
        throw ValidationException::withMessages([
            'email' => [trans($response)],
        ]);
    }
}
