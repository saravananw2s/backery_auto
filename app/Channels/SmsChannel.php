<?php

namespace App\Channels;

use Illuminate\Notifications\Notification;
use App\Http\Controllers\Base;

class SmsChannel extends Notification
{

    public function send($notifiable, Notification $notification)
    {

        Base::SendSms($notifiable->contact_no,$notification->text.' '.$notification->short_link);

    }



}
