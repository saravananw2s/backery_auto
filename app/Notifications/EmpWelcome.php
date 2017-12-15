<?php

namespace App\Notifications;

use App\Channels\PushChannel;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Queue\SerializesModels;
use App\Http\Controllers\Base;

use Illuminate\Support\Facades\Mail;

class EmpWelcome extends Notification implements ShouldQueue
{
    use Queueable,SerializesModels;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail', 'database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {

        // Mail::to($notifiable)->send(new FleetRegisterMail($notifiable));

        //       $pwd = decrypt($notifiable->user_pwd);

        $notifiable->user_pwd = decrypt($notifiable->user_pwd);

        $data = (new MailMessage)
            ->subject('Welcome to ManageTeamz Delivery!')
            ->bcc('bd@manageteamz.com')
            ->markdown('delivery',['user'=>$notifiable]);


        //     ->greeting('Hello '. $notifiable->first_name . ' ' .$notifiable->last_name.'!')
        //     ->line('You have Joined in ManageTeamz!')
        //     ->line('Your password is : '.$pwd)
        //     ->line('Once you logged in goto to my settings and change the password')
        //     ->action('Login', Base::get_domin().Base::urls['login'])
        //     ->line('Thank you for using our application!');

        //  $data->bcc('bd@manageteamz.com');

         return $data;
    }


    public function toPush($notifiable)
    {
         // return (new MailMessage)
         //    ->greeting('Hello!')
         //    ->line('You have Joined in ManageTeam!')
         //    ->action('View', '')
         //    ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'data' => '',
            //  'workout_id' => $this->workout->id
        ];

    }
}