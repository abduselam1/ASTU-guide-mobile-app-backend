<?php

namespace App\Http\Controllers\API\V1\Mobile;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use App\Models\LostId;
use Illuminate\Http\Request;

class LostIdController extends Controller
{
    public function index()
    {
        return new JsonResponse(LostId::get(['id', 'identifier','name' ,'item', 'contact_number', 'id']), 200);
    }

    public function store(Request $request){

        try {
            LostId::create([
                "name" => $request->name,
                "item" => $request->item,
                "contact_number" => $request->contact_number,
                "identifier" =>$request->identifier
            ]);
            return new JsonResponse(true,200);
        } catch (\Throwable $th) {
            return new JsonResponse(false,200);
            //throw $th;
        }

    }
    
}
