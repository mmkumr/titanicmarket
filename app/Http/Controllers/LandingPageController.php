<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use Illuminate\Http\Request;

class LandingPageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::where('featured', true)->take(8)->inRandomOrder()->get();
        $categories = Category::orderby('name', 'asc')->get();
        return view('welcome')->with([
            'products' => $products,
            'categories' => $categories,
        ]);

    }
}
