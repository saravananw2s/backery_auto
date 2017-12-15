@component('mail::layout')
    {{-- Header --}}
    @slot('header')
        <div style = "background-color : white">
            <img src="{{ config('app.logo') }}" style="height: 100px;" />
        </div>
    @endslot

    # <b>Hello {{$user->first_name}} {{$user->last_name}}</b>

<p>Welcome to ManageTeamz – Delivery Management System. You will have access to the following and Its benefits.</p>

## Web app offers:

* Live Tracking of your delivery agents current location from Web.<br>
* Assign Orders to Delivery agents and navigate them to customer location.<br>
* Receive feedback from customer and get a Proof Of Delivery.<br>
* Track your delivery agent and monitor all your Incoming tasks.<br>

## iPhone and Android Driver App:

* Can use Android and iPhone to navigate to customer location.<br>
* View their pending and In progress orders <br>
* Get a Proof of Delivery from Signature. <br>
* Get Customer’s feedback and rating from app.<br>

## Login Credentials :

<p>Go to <a href="http://delivery.manageteamz.com/">delivery.manageteamz.com </a><br>
Username : <b>{{$user->email}}</b><br>
Password : <b>{{$user->user_pwd}}</b><br>
</p>

<p>Once you logged in, go to my settings and change your password.</p>

<p>Delivery iPhone App can be downloaded here:</p>
<a href="https://itunes.apple.com/in/app/manageteamz-delivery/id1241923128?mt=8">https://itunes.apple.com/in/app/manageteamz-delivery/id1241923128?mt=8</a>

<p>Delivery Android App can be downloaded here:</p>
<a href="https://play.google.com/store/apps/details?id=com.w2s.android.sfafleet&hl=en">https://play.google.com/store/apps/details?id=com.w2s.android.sfafleet&hl=en</a>

<p>Write to us if you have any queries  ( bd@manageteamz.com )  or send us a tweet @ManageTeamz</p>

Thanks!<br>
ManageTeamz Team<br>
Call : + 91-44-6050-6059<br>
	   +1-630 299 7737<br>
Email : bd@manageteamz.com<br>
Twitter : <a href="https://twitter.com/ManageTeamz">@ManageTeamz</a><br>

    {{-- Subcopy --}}
    @slot('subcopy')
        @component('mail::subcopy')
            <!-- subcopy here -->
        @endcomponent
    @endslot


    {{-- Footer --}}
    @slot('footer')
        @component('mail::footer')
     
            <table align="center" width="570" cellpadding="0" cellspacing="0">
                <tr>
                    <td">
                        <p">
                            &copy; {{ date('Y') }}
                            <a" href="{{ url('/') }}" target="_blank">{{ config('app.name') }}</a>.
                            All rights reserved.
                        </p>
                    </td>
                </tr>
            </table>

        @endcomponent
    @endslot
@endcomponent
