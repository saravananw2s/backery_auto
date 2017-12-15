 <h1 id="test">

 </h1>


<!-- <script src="//{{ Request::getHost() }}:6001/socket.io/socket.io.js"></script>
 -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/socket.io/1.7.3/socket.io.min.js"></script>

<script type="text/javascript">
	window.app = {};
	window.app.url = 'http://'+document.location.host+':6001';
</script>
  <script src="/assets/app/core/echo.js" type="text/javascript"></script>
<script type="text/javascript">

window.Echo.private(channeldomain+'user-'+2)
    .listen('LocationUpdate', (e) => {
        console.log('managers')
        console.log(e);
    });


window.Echo.private(channeldomain+'current_location')
    .listen('LocationUpdate', (e) => {
        console.log(e);
    });

</script>