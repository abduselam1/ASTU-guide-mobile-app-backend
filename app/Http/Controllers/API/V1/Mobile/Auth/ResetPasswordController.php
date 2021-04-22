<?php

namespace App\Http\Controllers\API\V1\Mobile\Auth;

use App\Http\Controllers\Controller;
use App\Models\Auth\MobilePasswordReset;
use App\Models\User;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ResetPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
     */

    use ResetsPasswords;

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

    public function getEmailAndCode($email, $code)
    {
        return MobilePasswordReset::where(['email' => $email, 'code' => $code])->first();
    }

    /**
     * Reset the given user's password.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function reset(Request $request)
    {
        $data = $request->validate($this->rules());

        $emailAndCode = $this->getEmailAndCode($data['email'], $data['code']);

        if (is_null($emailAndCode)) {
            return $this->sendResetFailedResponse($request, 'Code not found');
        }

        //Todo:check expire time

        $user = $this->getUser($data['email']);

        $this->resetPassword($user, $data['password']);

        $this->deletePreviousPasswordRequest($data['email']);

        return $this->sendResetResponse($request, $user);
    }

    protected function deletePreviousPasswordRequest($email)
    {
        MobilePasswordReset::where(['email' => $email])->delete();
    }

    /**
     * Reset the given user's password.
     *
     * @param  \Illuminate\Contracts\Auth\CanResetPassword  $user
     * @param  string  $password
     * @return void
     */
    protected function resetPassword($user, $password)
    {
        $this->setUserPassword($user, $password);

        $user->save();

        event(new PasswordReset($user));

        $this->guard()->login($user);
    }

    /**
     * Set the user's password.
     *
     * @param  \Illuminate\Contracts\Auth\CanResetPassword  $user
     * @param  string  $password
     * @return void
     */
    protected function setUserPassword($user, $password)
    {
        $user->password = Hash::make($password);
    }

    /**
     * Get the password reset validation rules.
     *
     * @return array
     */
    protected function rules()
    {
        return [
            'code' => ['required', 'integer', 'min:1001', 'max:9999'],
            'email' => ['required', 'email'],
            'password' => ['required', 'min:8'],
            'device_name' => ['required', 'string', 'max:255'],
        ];
    }

    /**
     * Get the password reset credentials from the request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    protected function credentials(Request $request)
    {
        return $request->only(
            'email', 'password', 'code'
        );
    }

    /**
     * Get the response for a successful password reset.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $response
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    protected function sendResetResponse(Request $request, $user)
    {
        $token = $user->createToken($request->device_name)->plainTextToken;

        return new JsonResponse([
            'user' => $user,
            'token' => $token,
        ], 200);

        return new JsonResponse(['message' => trans($response)], 200);
    }
}
