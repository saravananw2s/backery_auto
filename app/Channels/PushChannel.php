<?php

namespace App\Channels;

use Illuminate\Notifications\Notification;

use Edujugon\PushNotification\PushNotification;

class PushChannel extends Notification
{
    /**
     * Send the given notification.
     *
     * @param  mixed  $notifiable
     * @param  \Illuminate\Notifications\Notification  $notification
     * @return void
     */
    public function send($notifiable, Notification $notification)
    {



        $userTokenListofAndroid = [];
        $userTokenListofIOS     = [];
        $title                  = isset($notification->push_title) ? $notification->push_title : '';
        $body                   = isset($notification->push_body) ? $notification->push_body : '';
        $payload                = isset($notification->push_payload) ? $notification->push_payload : [];

        if (!empty($title) && !empty($body)) {
            $tokens = \App\Models\ApiAuth::where('auth_user_id', $notifiable->user_id)
                ->where('is_active', '1')
                ->where('auth_model', \App\Models\User::class)
                ->where('device_token', '<>', '')
                ->where('device_type', '<>', '')
                ->get(['device_token', 'device_type'])->unique(['device_token'])->toArray();

            foreach ($tokens as $key => $value) {

                if ($value['device_type'] == 'android') {
                    $userTokenListofAndroid[] = $value['device_token'];
                }
                if ($value['device_type'] == 'iOS') {
                    $userTokenListofIOS[] = $value['device_token'];
                }

            }
        }
        //test Account
        //$userTokenListofAndroid = ['fl1ZQCEtgJQ:APA91bHw9UdMV50_79ZuWCjqNRUn0u-i3iky6fcxJ--gycFMf1mzSC-VgJ0q_J5w9dVSGk-j7aVWpWr2Uq_ZmDSJvDWIO2gQbwLSD9EqJuNUat85q6DKDOLSGxkRK0nrpcKif0xTXKNM'];
        // $userTokenListofIOS = ['936f6ebce52888391b7c715b4a29795903af2fb574e0535eb3a631a7e3b16cbc'];

        if (count($userTokenListofAndroid) >= 1) {

            self::fcm($title, $body, $userTokenListofAndroid, $payload);

        }

        if (count($userTokenListofIOS) >= 1) {

            self::apn($title, $body, $userTokenListofIOS, $payload);

        }

    }

    public function fcm($title, $body, $users, $payload = array())
    {


  $push = new PushNotification('fcm');
  $data = $push->setMessage([
                'notification' => [
                    'title' => $title,
                    'body'  => $body,
                    'sound' => 'default',

                      // "icon"  => "androidlogo",

                ],

                //White icon Android resource
                //         ],
                // 'data' => $payload
            ])
            ->setDevicesToken($users)
            ->send()
            ->getFeedback();


                    return $data;


    }

    public function apn($title, $body, $users, $payload = array())
    {


  $push = new PushNotification('apn');


    $data = $push
            ->setMessage([
                'aps' => [
                    'alert' => [
                        'title'        => $title,
                        'body'         => $body,
                        // "click_action" => "FCM_PLUGIN_ACTIVITY", //Must be present for Android
                        // "icon"         => "sfaicon", //White icon Android resource
                    ],
                    'sound' => 'default',
                ],

                // ,'extraPayLoad' => [
                //     'custom' => 'My custom data',
                // ]
            ])
            ->setDevicesToken($users)
            ->send()
            ->getFeedback()
        ;


                 return $data;
    }

}
