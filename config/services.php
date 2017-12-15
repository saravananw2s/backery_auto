<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Stripe, Mailgun, SparkPost and others. This file provides a sane
    | default location for this type of information, allowing packages
    | to have a conventional place to find your various credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
    ],

    'ses' => [
        'key' => env('SES_KEY','AKIAIWULYZKHBHKG7TSQ'),
        'secret' => env('SES_SECRET','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'),
        'region' => 'eu-west-1',
    ],

    'sparkpost' => [
        'secret' => env('SPARKPOST_SECRET'),
    ],

    'stripe' => [
        'model' => App\User::class,
        'key' => env('STRIPE_KEY'),
        'secret' => env('STRIPE_SECRET'),
    ],
    'github' => [
    'client_id' => 'dff54cf59e105614b4a4',
    'client_secret' => '976b488676170417868417a0c31ff8c493796d56',
    'redirect' => 'http://manageteamz.com/api/callback_auth',
    ],

];
