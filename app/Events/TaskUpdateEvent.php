<?php
namespace App\Events;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use App\Http\Controllers\Base;
use App\Models\EmpCustSchedule;
use App\Models\User;
class TaskUpdateEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $data;
    private $user_id;
    private $userChannels = [];
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(EmpCustSchedule $data,$user_id)
    {
        $this->data = $data->toArray();
        $this->user_id = User::find($user_id);
        $this->data['user'] =  $this->user_id;
        if($this->user_id->belongs_manager)
        {
            $this->userChannels[] =  new PrivateChannel(Base::get_sub_domain().'-user-'.$this->user_id->belongs_manager);
            // $this->userChannels[] =  new PrivateChannel(Base::get_sub_domain().'-tracking-customers-'.$this->user_id->user_id);
        }


        // $this->userChannels[] =  new PrivateChannel(Base::get_sub_domain().'-current_location');
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
}
