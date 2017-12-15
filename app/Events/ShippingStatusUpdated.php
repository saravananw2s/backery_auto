<?php

namespace App\Events;

use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class ShippingStatusUpdated implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $data;

    public function __construct()
    {
        $this->data = array(
            'power' => '10',
        );
    }

    public function broadcastOn()
    {
        return new PrivateChannel('Order');
    }

    public function broadcastWith()
    {
        return [
            'user' => [
                'name'      => 'Klark Cent',
                'age'       => 30,
                'planet'    => 'Crypton',
                'abilities' => 'Bashing',
            ],
        ];
    }

}
