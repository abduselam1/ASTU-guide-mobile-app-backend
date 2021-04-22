<?php

namespace App\Http\Controllers\API\V1\Mobile\Auth;

use App\Http\Controllers\Controller;
use App\Models\Student;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
     */

    use RegistersUsers;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a rules for an incoming registration request.
     *
     * @param  array  $data
     * @return array $rules
     */
    protected function rules(array $data)
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'phone_number' => ['required', 'string'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8'],
            'astu_id' => ['required', 'string', 'max:255'],
            'department' => ['required', 'string', 'max:255'],
            'school' => ['required', 'string', 'max:255'],
            'year' => ['required', 'integer', 'min:1', 'max:6'],
            'section' => ['required', 'integer', 'min:1', 'max:100'],
            'device_name' => ['required', 'string', 'max:255'],
        ];
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        $user = User::create([
            'role_id' => 3, //student
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);

        $student = Student::create([
            'user_id' => $user->id,
            'astu_id' => $data['astu_id'],
            'school' => $data['school'],
            'department' => $data['department'],
            'year' => $data['year'],
            'section' => $data['section'],
        ]);

        return [$user, $student];
    }

    /**
     * Handle a registration request for the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function register(Request $request)
    {
        $data = $request->validate($this->rules($request->all()));

        list($user, $student) = $this->create($data);

        event(new Registered($user));

        $this->guard()->login($user->load('student'));

        $token = $user->createToken($request->device_name)->plainTextToken;

        return new JsonResponse([
            'user' => $user,
            'token' => $token,
        ], 201);
    }
}
