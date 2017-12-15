<?php
namespace App\Notifications;
use App\Channels\PushChannel;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\Http\Controllers\Base;
class EmpPasswordReset extends Notification
{

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

        $pwd = decrypt($notifiable->user_pwd);

        return (new MailMessage)
            ->subject('New Password')
            ->greeting('Hello '. $notifiable->first_name . ' ' .$notifiable->last_name.'!')
            ->line('Your new password is : '.$pwd)
            ->line('once you logged in goto to my settings and change the password')
            ->action('Login', Base::get_domin().Base::urls['login'])
            ->line('Thank you for using our application!');
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
