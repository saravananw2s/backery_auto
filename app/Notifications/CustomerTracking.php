<?php
namespace App\Notifications;
use App\Channels\SmsChannel;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\Http\Controllers\Base;
class CustomerTracking extends Notification
{

    private $trip;
    private $user;
    private $email_text;
    public $link;
    public $text;
    public $short_link;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($trip,$domain,$update = false)
    {
        $this->trip = $trip;
        $this->link = $domain.'/api/track-order/'.encrypt($this->trip->id);
        if($update)
        {
         $this->text = 'Your order updated. Thanks for using ManageTeamz. Track your delivery at:';
        $this->email_text = 'Track Your Package Update. You can live monitor the delivery status of your order in the below link.';

        }
        else
        {
        $this->text = 'Your order is scheduled for delivery. Thanks for using ManageTeamz. Track your delivery at:';
        $this->email_text = 'Track Your Package. You can live monitor the delivery status of your order in the below link.';

        }

        $this->short_link = Base::GoogleShortner($this->link);

    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail', 'database',SmsChannel::class];
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
            ->greeting('Hello!')
            ->line($this->email_text)
            ->action('View',$this->link)
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
