<?php
namespace App\Notifications;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\Channels\PushChannel;
class TaskAllocated extends Notification
{
    private $trip;
    private $user;
    public $push_title;
    public $push_body;
    public $push_payload;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($trip,$user)
    {
        $this->trip = $trip;
        $this->user = $user;
        $this->push_title = 'New Trip Allocated';
        $this->push_body = 'Check Schedule its for : '.$trip->schedule_date_time;
        $this->push_payload = $trip->toArray();
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database',PushChannel::class];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->line('The introduction to the notification.')
            ->action('Login', Base::get_domin() . Base::urls['login'])
            ->line('Thank you for using our application!');
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
            'data' => $this->trip,
        ];
    }


}
