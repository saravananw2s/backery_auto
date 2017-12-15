<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use App\Http\Controllers\Base;
class JobDemo implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $user_list;
    protected $domain;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($user_list,$domain)
    {
        $this->user_list = $user_list;
        $this->domain = $domain;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {

        Base::change_db($this->domain); // SASS db change for the queue

    \Log::info('Domain '. $this->domain);

    \Log::info('Queue '. json_encode($this->user_list).' '.\DB::connection()->getDatabaseName());

    $cust = \App\Models\Customer::find(1)->notify(new \App\Notifications\CustomerTracking(\App\Models\EmpCustSchedule::first(),\App\Models\User::first(),$this->domain));



    }
}
