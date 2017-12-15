<?php

namespace App\Http\Controllers;

use App\Models\Notifications;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;

class MyNotificationsController extends Controller
{

    public function GetNotifications()
    {
        if ($this->manager) {
            $notifications = Notifications::where('notifiable_type', 'App\Models\User')
                ->whereIn('notifiable_id', Base::getEmpBelongsUser($this->emp_id))
                ->whereNull('read_at')
                ->get()->toArray();

            foreach ($notifications as $i => $item) {

                $notifications[$i]['data'] = json_decode($notifications[$i]['data']);

            }

            $perPage             = 10;
            $pageStart           = \Request::get('page', 1);
            $offSet              = ($pageStart * $perPage) - $perPage;
            $itemsForCurrentPage = array_slice($notifications, $offSet, $perPage);

            $paginator = new LengthAwarePaginator($itemsForCurrentPage, count($notifications), $perPage);

            return $paginator;

        }

        $user = \App\Models\User::find($this->emp_id);
        $data = $user->unreadNotifications()->get()->toArray();

        $notifications = [];
        foreach ($data as $key => $value) {

            $title = '';
            switch ($value['type']) {
                case 'App\Notifications\TaskUpdated':

                    $title = "Task is updated.";

                    break;

                case 'App\Notifications\TaskAllocated':

                    $title = "New task is allocated.";

                    break;

                case 'App\Notifications\TaskCompleted':

                    $title = "Task is completed.";
                    break;
                default:
                    break;
            }

            if (!empty($title)) {

                $info               = [];
                $info['id']         = $value['id'];
                $info['timestamps'] = $value['created_at'];
                $info['title']      = $title;

                if ($value['data']) {

                    if ($value['data']['data']) {

                        if (array_key_exists('cust_name', $value['data']['data'])) {
                            $cust_name = ucwords($value['data']['data']['cust_name']);

                        }

                        if (array_key_exists('schedule_date_time', $value['data']['data'])) {
                            $schedule_date_time = date('d/M/Y h:i A', strtotime($value['data']['data']['schedule_date_time']));

                        }

                        if (!empty($schedule_date_time) && !empty($cust_name)) {

                            $info['message'] = $schedule_date_time . ' / ' . $cust_name . ' ' . $title;
                            $notifications[] = $info;

                        }

                    }

                }

            }

        }

        $perPage             = 10;
        $pageStart           = \Request::get('page', 1);
        $offSet              = ($pageStart * $perPage) - $perPage;
        $itemsForCurrentPage = array_slice($notifications, $offSet, $perPage);

        $paginator = new LengthAwarePaginator($itemsForCurrentPage, count($notifications), $perPage);

        return $paginator;

    }

    public function ReadNotifications(Request $request, $id)
    {
        $user = \App\Models\User::find($this->emp_id);

        $notification = $user->notifications()->where('id', $id)->first();

        if ($notification) {
            $notification->update(['read_at' => Carbon::now()]);
            return Base::touser('ok', true);
        } else {
            return Base::touser('ok');
        }

    }

}
