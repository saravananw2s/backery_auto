<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Http\Controllers\Base;
class ExceptionOccured extends Mailable
{
    /**
     * The body of the message.
     *
     * @var string
     */
    public $content;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($content)
    {
        $this->content = $content;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {


        $user_role = 'Guest';
        // $server_header = $_SERVER;

        try {

        $user_role =  json_encode(Base::getRole(),true);

        } catch (Exception $e) {

        }



        return $this->subject('Food Delivery Error Log')
        ->view('emailerror')
                    ->with('content', $this->content)
                    ->with('user_role', $user_role);
                    // ->with('server_header', $server_header);
    }
}
