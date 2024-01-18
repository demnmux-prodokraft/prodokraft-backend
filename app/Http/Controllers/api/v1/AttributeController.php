<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\Model\Attribute;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AttributeController extends Controller
{
    public function get_attributes()
    {
        $attributes = Attribute::all();
        return response()->json($attributes,200);
    }
    
    public function get_coupons()
    {
        $coupons = DB::table('coupons')->get();
        return response()->json($coupons,200);
    }
}
