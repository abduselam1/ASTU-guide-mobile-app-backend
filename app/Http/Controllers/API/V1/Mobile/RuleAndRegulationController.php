<?php

namespace App\Http\Controllers\API\V1\Mobile;

use App\Http\Controllers\Controller;
use App\Models\RuleAndRegulation;
use Illuminate\Http\JsonResponse;

class RuleAndRegulationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new JsonResponse(RuleAndRegulation::get(['id', 'article_number', 'title', 'body']), 200);
    }
}
