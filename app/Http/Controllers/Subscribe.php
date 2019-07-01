<?php

namespace App\Http\Controllers;
    
use App\Subscriber;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\Subscribe as submail;

class Subscribe extends Controller
{
    public function store(Request $request)
    {
        $this->validate($request, [
        'name' => 'required|string|max:255',
        'EMAIL' => 'required|string|email|max:255|unique:subscribe',        
        ]);

        $subscriber = Subscriber::create([
            'name' => $request->name,
            'email' => $request->EMAIL,
        ]);

        Mail::send(new submail($subscriber));
        return redirect()->back()->with('success_message', 'Thank you! We have sent you the mail.');
    }
}
