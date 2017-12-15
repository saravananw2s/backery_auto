<?php

namespace App\Events;
use App\Http\Controllers\Base;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class NotificationEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    private $user;
    private $data;
    private $userChannels = [];

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($user)
    {
        $this->user = $user;

        $this->data = $user->unreadNotifications->first()->toArray();

        // $this->data['data']  =  $temp;

     if ($this->user->belongs_manager) {
            $this->userChannels[] = new PrivateChannel(Base::get_sub_domain() . '-user-' . $this->user->belongs_manager);
        }
        $this->userChannels[] = new PrivateChannel(Base::get_sub_domain() . '-admin');
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return Channel|array
     */
    public function broadcastOn()
    {
      return $this->userChannels;
    }

    public function broadcastWith()
{
    return ['data' => $this->data];
}
}
