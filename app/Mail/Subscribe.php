<?php

namespace App\Mail;
use App\Subscriber;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
class Subscribe extends Mailable
{
    use Queueable, SerializesModels;

    public $subscriber; 

    public function __construct(Subscriber $subscriber)
    {
       $this->subscriber = $subscriber; 
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->to($this->subscriber->email, $this->subscriber->name)
                    ->from("vegifruitcare@gmail.com", "Vegifruit Newsletter")
                    ->subject('Subscription to Vegifruit')
                    ->markdown('emails.subscribe');
    }
}
