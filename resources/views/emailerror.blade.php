<h1> User : {!! $user_role !!} </h1>
<br>
<h1> Server headers </h1>

<br>
<p>
{{ print_r($_SERVER) }}
</p>
<br>

<h1> Full Stack Trace </h1>
{!! $content !!}


