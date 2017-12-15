@verbatim
<!DOCTYPE html >
<html data-ng-app="app" lang="en"  ng-cloak>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
       <meta name="fragment" content="!" />
        <base href="/dashboard" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link href="//fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/g/jquery.slick@1.6.0(slick-theme.css+slick.css),jquery.chardinjs@0.1.2(chardinjs.css),jquery.formvalidation@0.6.1(css/formValidation.min.css)">


     <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/6.0.6/css/intlTelInput.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- Leave those next 4 lines if you care about users using IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">

.float-label-control { position: relative; margin-bottom: 2.5em; }
    .float-label-control ::-webkit-input-placeholder { color: #d4d4bd; }
    .float-label-control :-moz-placeholder { color: #d4d4bd; }
    .float-label-control ::-moz-placeholder { color: #d4d4bd; }
    .float-label-control :-ms-input-placeholder { color: #d4d4bd; }
    .float-label-control input:-webkit-autofill,
    .float-label-control textarea:-webkit-autofill { background-color: transparent !important; -webkit-box-shadow: 0 0 0 1000px white inset !important; -moz-box-shadow: 0 0 0 1000px white inset !important; box-shadow: 0 0 0 1000px white inset !important; }
    .float-label-control input, .float-label-control textarea, .float-label-control label { font-size: 1.3em; box-shadow: none; -webkit-box-shadow: none; }
        .float-label-control input:focus,
        .float-label-control textarea:focus { box-shadow: none; -webkit-box-shadow: none; border-bottom-width: 2px; padding-bottom: 0; }
        .float-label-control textarea:focus { padding-bottom: 4px; }
    .float-label-control input, .float-label-control textarea { display: block; width: 100%; padding: 0.1em 0em 1px 2em; border: none; border-radius: 0px; border-bottom: 1px solid #aaa; outline: none; margin: 0px; background: none; }
    .float-label-control textarea { padding: 0.1em 0em 5px 0em; }
    .float-label-control label { position: absolute; font-weight: normal; top: -1.0em; left: 0.08em; color: #aaaaaa; z-index: -1; font-size: 0.85em; -moz-animation: float-labels 300ms none ease-out; -webkit-animation: float-labels 300ms none ease-out; -o-animation: float-labels 300ms none ease-out; -ms-animation: float-labels 300ms none ease-out; -khtml-animation: float-labels 300ms none ease-out; animation: float-labels 300ms none ease-out; /* There is a bug sometimes pausing the animation. This avoids that.*/ animation-play-state: running !important; -webkit-animation-play-state: running !important; }
    .float-label-control input.empty + label,
    .float-label-control textarea.empty + label { top: 0.1em; font-size: 1.5em; animation: none; -webkit-animation: none; }
    .float-label-control input:not(.empty) + label,
    .float-label-control textarea:not(.empty) + label { z-index: 1; }
    .float-label-control input:not(.empty):focus + label,
    .float-label-control textarea:not(.empty):focus + label { color: #aaaaaa; }
    .float-label-control.label-bottom label { -moz-animation: float-labels-bottom 300ms none ease-out; -webkit-animation: float-labels-bottom 300ms none ease-out; -o-animation: float-labels-bottom 300ms none ease-out; -ms-animation: float-labels-bottom 300ms none ease-out; -khtml-animation: float-labels-bottom 300ms none ease-out; animation: float-labels-bottom 300ms none ease-out; }
    .float-label-control.label-bottom input:not(.empty) + label,
    .float-label-control.label-bottom textarea:not(.empty) + label { top: 3em; }


@keyframes float-labels {
    0% { opacity: 1; color: #aaa; top: 0.1em; font-size: 1.5em; }
    20% { font-size: 1.5em; opacity: 0; }
    30% { top: 0.1em; }
    50% { opacity: 0; font-size: 0.85em; }
    100% { top: -1em; opacity: 1; }
}

@-webkit-keyframes float-labels {
    0% { opacity: 1; color: #aaa; top: 0.1em; font-size: 1.5em; }
    20% { font-size: 1.5em; opacity: 0; }
    30% { top: 0.1em; }
    50% { opacity: 0; font-size: 0.85em; }
    100% { top: -1em; opacity: 1; }
}

@keyframes float-labels-bottom {
    0% { opacity: 1; color: #aaa; top: 0.1em; font-size: 1.5em; }
    20% { font-size: 1.5em; opacity: 0; }
    30% { top: 0.1em; }
    50% { opacity: 0; font-size: 0.85em; }
    100% { top: 3em; opacity: 1; }
}

@-webkit-keyframes float-labels-bottom {
    0% { opacity: 1; color: #aaa; top: 0.1em; font-size: 1.5em; }
    20% { font-size: 1.5em; opacity: 0; }
    30% { top: 0.1em; }
    50% { opacity: 0; font-size: 0.85em; }
    100% { top: 3em; opacity: 1; }
}

       .navbar-brand{
  background: url('/images/mt-logo.png') center / contain no-repeat;
  width: 200px;
}

.navbar {
    margin-bottom: 0px;
   height: 10vh;
}

.jumbotron{
    height: 90vh;
        padding: 0px;
        position: relative;
}


.bg-overlay {
    background: linear-gradient(rgba(0,0,0,.7), rgba(0,0,0,.7)), url("assets/register/images/Deliver1.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;


}


.bg-overlay-2{
    background: linear-gradient(rgba(0,0,0,.8), rgba(0,0,0,.8)), url("assets/register/images/Deliver1.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;


}
/*.background1
{
  background: url('images/Deliver1.png');
  background-repeat: no-repeat;
  background-position: center;
      background-size: cover;
}*/

.mar10
{
      margin-top: 10px;
}
.white
{
      color: white !important;
}
.mar35vh
{
    margin-top: 35vh;
}

.heightfull
{
    min-height: 100vh;
}
.home_icons
{
    width: 100px;
    height: 100px;
}
.nopad
{
  padding: 0px !important;
  margin: 0px !important;
}
.mar6
{
      margin-top: 6%;
}
.font22px
{
color : #283776;


    font-size: 1.5em;
}


.pad6
{
padding-top : 20px
}


.form-header
{
    font-size: 2.5em;

 color: #1e226d;

}
.form-back
{
background: white;
    box-shadow: 0px 0px 14px 14px #f6f6f6;
        border-bottom: #00a5ce solid 6px;
            border-radius: 5px;

}


.bton
{
    background: #1e226d;
    color: white;
font-size: 2em;
    width:80%;
        margin-left: auto;
    margin-right: auto;
}

body
{

  color :#949494;
  font-family: 'PT Sans', sans-serif;
      font-size: 1.5em;
}

/*.pad40
{
      padding-right: 40px;
}
*/


.backf6
{
  background : #f6f6f6;
}

.es1
{
 color: #1e226d;
}
.blck
{
      font-size: 2em;
    color: black;
}


.h2r
{
      margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 5px solid #00a5ce;
    text-align: center;
    height: 0px;
    line-height: 0px;
    width: 5%;
    margin-left: auto;
    margin-right: auto;
}


.pad20
{
  padding-top:10%
}

.pad3{
padding-right: 3%;
    padding-left: 3%;

}

  .pad35
  {
    padding-top: 35%;
  }

.img-center
{
      margin-left: auto;
    margin-right: auto;
}


.backwhite
{
  background :white;
}

.pad25
{
      padding: 25px;
}


.padding15
{
      padding-right: 15%;
    padding-left: 15%;
}


.navbar-collapse.in {
    overflow-y: auto;
    background: white;
}
.navbar-collapse.in.nav-side {
    float: left;
    width: 100%;
}

.font13em
{
     font-size : 1.5em;
}


.form-control-feedback {
    position: absolute;
    top: 0px;
    left: 0;
    z-index: 7;
    display: block;
    width: 34px;
    height: 34px;
    line-height: 34px;
    text-align: center;
}

.min200px
{
min-height: 300px;

}
.min100px
{
min-height: 200px;

}

 .indemo {
    line-height: 50px;
    padding-right: 20%;
    padding-left: 20%;
  }

 .indemobtn {
border-radius: 50px;
border: solid white 1px;
 width: 250px;
     margin-top: 20px;
  }


.whitesmoke
{
  background: whitesmoke;
}

 .footerp{
    font-weight: 800;
    color: grey;
    line-height: 34px;
    font-size: 18px;

}


.c
{
      color: #1e226d;
}

.bln
{
      font-weight: 800;
}


.footer_bottom   { min-height: 80px;
    background: #1e226d;
    color: white;


  }
.pt15
{
  padding-top: 15px;
}

.t7
{
        width: 25px;
    margin-top: -5px;

}

.mrn35px
{
      margin-top: -35px;
}
.fnt25{

    font-size: 24px;
  }


.p25x
{
  padding-top: 25px;
}

.pd60
{
      padding-bottom: 60px;
}

.marT10
{
margin-top: 10%;
}


  .nav>li>a {

    color: #00316b;
}

.navbar-nav>li>a {
    font-family: sans-serif;
    font-size: 16px;
        font-weight: 600;
    }

.nav>li>a:focus, .nav>li>a:hover {
/*    text-decoration: none;*/
/*    background-color:#337ab7;*/

    text-decoration: none;
    background-color: #00a8cc;
    color: white;
    border-radius: 5px;
}

.navbar-toggle
{
        background-color: #00316b !important;
}

.navbar-toggle .icon-bar
{
        background: white;
}
.mtz-logo-head

{
        min-height: 65px;
    z-index: 1000;
    background: white;
    padding: 0px;
    margin: 0px;
    border-radius: 0px;
}

  .nav-side { float: right;
    margin-top: 6px;
}
.pad50px
{
      padding-bottom: 50px;
}

.pad20{
padding: 20px;
}
body
{

    overflow-x: hidden !important;
}



.laptop
{
    background: url(../images/lap.png);
    background-size: contain;
    /* background-position-x: -1px; */
    /* background-position-y: 2px; */
    height: 350px;
    background-repeat: no-repeat;
}

.sllide {
           margin-left: auto;
    margin-right: auto;
    margin-top: -33px;
    /* padding-left: 3px; */
    padding: 54px;
}

.padbott20px
{
  padding-bottom:20px
}
.pad35pe
{
   padding-top: 35%;
}

.full
{width: 100%;}

.contactimage
{
    background: url(../images/Mobile_344.png);
    position: relative;
    min-height: 600px;
        padding-top: 53px;
    background-repeat: no-repeat;
    margin-top: -125px;
}


.map
{
  width: 220px;
    min-height: 400px;
    position: relative;
    overflow: hidden;
    margin-left: 60px;
}

.googlemap
{
 background: url(assets/register/images/Map2.png);
    min-height: 260px;
    background-repeat: no-repeat;
    background-position-x: -55px;
    background-position-y: -15px;
    padding-top: 15px;
}

@media only screen and (max-width: 800px) {

.bton {

    font-size: 1em;

}

.contactimage{
    margin-top: 0px;
  }
.form-header {
    font-size: 1.5em;
    color: #1e226d;
    padding-top: 33px;
}

.mrn35px {
    margin-top: 0px;
    float: none !important;
    text-align: center;
}

.p25x {
    padding-top: 25px;
    text-align: center;
    padding-bottom: 35px;
}

.googlemap
{
    background-size: cover;
}

.indemo {
    line-height: 33px;
    padding-right: 20%;
    padding-left: 20%;
    font-size: 1.5em;
    padding-top: 50px;
}
.col-md-9 form
{
  padding: 0px !important;
}
}


.flts{
font-size: 2.5em !important;

}



@media only screen and (max-width: 430px) {


.flts {
    font-size: 2em !important;
    margin-top: 25px;
}
}





#loader-container{    background: transparent;position:fixed;overflow:hidden;top:0;right:0;left:0;bottom:0;z-index:99999}#loader-container>.spinner{position:fixed;top:50%;left:50%;margin-left:-33px;margin-top:-33px}.spinner{-webkit-animation:rotator 1.4s linear infinite;animation:rotator 1.4s linear infinite}@-webkit-keyframes rotator{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(270deg);transform:rotate(270deg)}}@keyframes rotator{0%{-webkit-transform:rotate(0);transform:rotate(0)}100%{-webkit-transform:rotate(270deg);transform:rotate(270deg)}}.path{stroke-dasharray:187;stroke-dashoffset:0;-webkit-transform-origin:center;transform-origin:center;-webkit-animation:dash 1.4s ease-in-out infinite,colors 5.6s ease-in-out infinite;animation:dash 1.4s ease-in-out infinite,colors 5.6s ease-in-out infinite}@-webkit-keyframes colors{0%{stroke:#2196F3}25%{stroke:#EF5350}50%{stroke:#FFCA28}75%{stroke:#66BB6A}100%{stroke:#2196F3}}@keyframes colors{0%{stroke:#2196F3}25%{stroke:#EF5350}50%{stroke:#FFCA28}75%{stroke:#66BB6A}100%{stroke:#2196F3}}@-webkit-keyframes dash{0%{stroke-dashoffset:187}50%{stroke-dashoffset:46.75;-webkit-transform:rotate(135deg);transform:rotate(135deg)}100%{stroke-dashoffset:187;-webkit-transform:rotate(450deg);transform:rotate(450deg)}}@keyframes dash{0%{stroke-dashoffset:187}50%{stroke-dashoffset:46.75;-webkit-transform:rotate(135deg);transform:rotate(135deg)}100%{stroke-dashoffset:187;-webkit-transform:rotate(450deg);transform:rotate(450deg)}}


.intl-tel-input
{
    width: 100%;
}

.validationSpan{
    color: red;
    margin-top: -25px;
    display: block;
    padding-bottom: 6px;

  }


.intl-tel-input .country-list
{
  z-index: 1000;
}


.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
    cursor: not-allowed;
    background-color: white;
    opacity: 1;
}

</style>
  </head>
  <body>
    <div id="loader-container" data-loading>
            <svg class="spinner" height="65px" viewbox="0 0 66 66" width="65px" xmlns="http://www.w3.org/2000/svg">
                <circle class="path" cx="33" cy="33" fill="none" r="30" stroke-linecap="round" stroke-width="6">
                </circle>
            </svg>
        </div>
<div class="page">


<header>


         <!-- Static navbar -->
      <nav class="navbar mtz-logo-head " style="




    ">

          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>

             <a href="/"><img style="     height: 60px;" src="http://manageteamz.com/mtz/images/mt-logo.png" alt="" class="img-responsive"></a>


          <!--   <a class="navbar-brand" href="#">Project name</a> -->
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav nav-side">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">About</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li role="separator" class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
              <li><a href="#">Contact</a></li>

            </ul>
          </div><!--/.nav-collapse -->

      </nav>


</header>

    <!-- TODO: Here goes your content! -->


<div class="main">

 <!-- Main Section -->
<div class="jumbotron bg-overlay " style="max-height: 100px">

  <div class="container ">
  <h1 class="text-center white flts" >  Delivery Management System </h1>
  </div>

</div>



</div>



 <!-- Sign up -->
  <div class="row heightfull nopad">

  <div class="col-md-12 mar6 pad40">
  <div class="col-md-7">
<div class="col-md-6 text-center">
  <img src="assets/register/images/Tracking_200.png" class="home_icons">
  <h2 class="font22px">Real time tracking</h2>
  <p>
Monitor your ABC delivery with real time tracking and customer will be updated with real time notifications with web link

  </p>
</div>
<div class="col-md-6 text-center">
  <img src="assets/register/images/Deliver.png" class="home_icons">

    <h2 class="font22px">Easy ABC delivery Management</h2>
  <p>
Manage real time status and locations of your ABC delivery on the map. You can assign new tasks and manage your business productively

  </p>
</div>
<div class="col-md-6 text-center">
  <img src="assets/register/images/CustomerSatis_200.png" class="home_icons">

    <h2 class="font22px">Customer Satisfaction</h2>
  <p>
Customer will receive a web link as SMS and track ABC delivery on real time. Rating, Feedback can be provided by customer easily

  </p>
</div>
<div class="col-md-6 text-center">
  <img src="assets/register/images/Respon.png" class="home_icons">
    <h2 class="font22px">Web, iPhone and Android app</h2>
  <p>
ABC business owner shall manage business through web. ABC delivery persons shall use iPhone and Android app to manager their orders without being in the office

  </p>



  </div>
  </div>

  <div class="col-md-5" >
 <div class="form-back col-md-10" ng-controller="SignUpCtrl" >
  <h4 class="form-header text-center"  >Get Stared for Free</h4>
                <form role="form"  ng-show="show_signup" class="pad25" novalidate="" ng-submit="signup()" name="data_form">


                    <div class="form-group float-label-control">
                        <label for="">First name</label>
                        <input type="text" class="form-control" required="" name="first_name" placeholder="First name" ng-model="data.first_name">
                          <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>





<span class="validationSpan" ng-if="data_form.first_name.$invalid && (data_form.$submitted  || data_form.first_name.$touched )">
First name  required
</span>



                    <div class="form-group float-label-control">
                        <label for="">Last name</label>
                        <input type="text" class="form-control" required="" placeholder="Last name" name="last_name" ng-model="data.last_name"/>
                          <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>



<span class="validationSpan" ng-if="data_form.last_name.$invalid && (data_form.$submitted  || data_form.last_name.$touched )">
Last name  required
</span>

                    <div class="form-group float-label-control">
                        <label for="">Email</label>
 <input type="email" class="form-control"  name="email" required="" placeholder="Email" ng-model="data.email" />
                          <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>




<span class="validationSpan" ng-if="data_form.email.$invalid && (data_form.$submitted  || data_form.email.$touched )">
Valid Email required
</span>


<!-- <span class="validationSpan" ng-if="data_form.email">
Valid Email required
</span>

 -->





                    <div class="form-group float-label-control">
                        <label for="">Mobile no</label>
                        <input type="text" name="phone"  ng-intl-tel-input required="" class="form-control" placeholder="Mobile no" ng-model="data.phone" />
                      <!--   <span class="glyphicon glyphicon-phone form-control-feedback"></span> -->

                    </div>

<span class="validationSpan" ng-if="data_form.phone.$invalid && (!data_form.phone.$pristine || data_form.$submitted ) ">
Valid Mobile no required
</span>



<!--                       <form class="form-inline" role="form">
  <div class="form-group has-success has-feedback">
    <label class="control-label" for="inputSuccess4"></label>
    <input type="text" class="form-control" id="inputSuccess4">

  </div>
</form> -->






                       <div class="form-group text-center col-md-12" >
                       <div >
                          <button type="submit" class="btn btn-lg  btn-lg btn-block btn-primary bton">Free Sign Up</button>
                               </div>
                               </div>

<div class="additional-info  col-md-12 pad20" >
                    <a href="/dashboard/login"  class="col-md-4">
                        Login
                    </a>
                    <span class="divider-h">
                    </span>
              <a href="/dashboard/forgot"  class="col-md-8">
                        Forgot your password?
                    </a>
                </div>


                </form>


<form class="md-form-auth form-validation" name="data_form1" ng-hide="show_signup" ng-submit="login()" novalidate="">
    <div class="form-group float-label-control">
        <label for="">
            Email
        </label>
        <input class="form-control" name="email" ng-model="data.email" placeholder="Email" readonly="" required="" type="email"/>
        <span class="glyphicon glyphicon-envelope form-control-feedback">
        </span>
    </div>
    <div class="form-group float-label-control">
        <label for="">
            Password
        </label>
        <input class="form-control" name="password" ng-model="data.password" placeholder="Password" required="" type="password"/>
        <span class="glyphicon glyphicon-lock form-control-feedback">
        </span>
    </div>


    <span class="validationSpan" ng-if="data_form1.password.$invalid && (data_form1.$submitted  || data_form1.password.$touched )">
Password  required
</span>


    <p style="color:red">
        {{alert}}
    </p>
    <br>
        <p class="text-small no-margin">
            We have sent the password to your email address, if you given wrong email id please sign up again
            <a onclick="location.reload();">
                <i>
                    here
                </i>
            </a>
            , if you not got email click
            <a href="javascript:;" ng-click="resendEmail()">
                <i>
                    here
                </i>
            </a>
            to resend password
        </p>
        <div class="form-group text-center col-md-12">
            <div>
                <button class="btn btn-lg btn-lg btn-block btn-primary bton" type="submit">
                   Login
                </button>
            </div>
        </div>
    </br>
</form>


  </div>
  </div>


  </div>



</div>


<footer>
<div class="col-md-12 googlemap    ">




<div class="col-md-4" >
<h3  class="es1 bln">INDIA</h3>
<p class="footerp">


NO.1, 1ST FLOOR, MRK ARCADE,<br> 200 FEET RADIAL ROAD, THORAIPAKKAM,<br>CHENNAI, TAMIL NADU 600097

</p>

<p class="fnt25"><img src="assets/register/images/cal.png" class="t7" /> +91 44-6050 6059</p>
</div>

<div class="col-md-4" >
<h3 class="es1 bln">TEXAS</h3>
<p class="footerp">

9820 IVALENES HOPE DR,<br>
AUSTIN<br> TX 78717.<br>


</p>

<p class="fnt25"><img src="assets/register/images/cal.png" class="t7" /> +1 630 299 7737</p>
</div>


<div class="col-md-4" >
<h3  class="es1 bln">CALGARY</h3>
<p class="footerp">

5838 BURBANK ROAD SE,<br> CALGARY,
ALBERTA,<br> CANADA T2H 1Z3
</p>

<p class="fnt25"><img src="assets/register/images/cal.png" class="t7" /> +1 403 926 3660</p>
</div>
</div>


<div class="bottom-footer col-md-12 footer_bottom">

<div class="col-md-4 p25x">
  <email class="fnt25">bd@manageteamz.com</email>
</div>
<div class="col-md-8">
<div class="mrn35px pull-right">
<img src="assets/register/images/FB.png" />
<img src="assets/register/images/in.png" />
<img src="assets/register/images/Twit.png" />
</div>
</div>

</div>
</footer>
  </div>
    <!-- Including Bootstrap JS (with its jQuery dependency) so that dynamic components work -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular.min.js" type="text/javascript"></script>

        <script src="//cdnjs.cloudflare.com/ajax/libs/fingerprintjs2/1.5.0/fingerprint2.min.js" type="text/javascript"></script>
     <script src="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/6.0.6/lib/libphonenumber/build/utils.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/6.0.6/js/intlTelInput.min.js" type="text/javascript"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/angular-local-storage/0.5.2/angular-local-storage.min.js" type="text/javascript"></script>





<script type="text/javascript">
  /* Float Label Pattern Plugin for Bootstrap 3.1.0 by Travis Wilson
**************************************************/

(function ($) {
    $.fn.floatLabels = function (options) {

        // Settings
        var self = this;
        var settings = $.extend({}, options);


        // Event Handlers
        function registerEventHandlers() {
            self.on('input keyup change', 'input, textarea', function () {
                actions.swapLabels(this);
            });
        }


        // Actions
        var actions = {
            initialize: function() {
                self.each(function () {
                    var $this = $(this);
                    var $label = $this.children('label');
                    var $field = $this.find('input,textarea').first();

                    if ($this.children().first().is('label')) {
                        $this.children().first().remove();
                        $this.append($label);
                    }

                    var placeholderText = ($field.attr('placeholder') && $field.attr('placeholder') != $label.text()) ? $field.attr('placeholder') : $label.text();

                    $label.data('placeholder-text', placeholderText);
                    $label.data('original-text', $label.text());

                    if ($field.val() == '') {
                        $field.addClass('empty')
                    }
                });
            },
            swapLabels: function (field) {
                var $field = $(field);
                var $label = $(field).siblings('label').first();
                var isEmpty = Boolean($field.val());

                if (isEmpty) {
                    $field.removeClass('empty');
                    $label.text($label.data('original-text'));
                }
                else {
                    $field.addClass('empty');
                    $label.text($label.data('placeholder-text'));
                }
            }
        }


        // Initialization
        function init() {
            registerEventHandlers();

            actions.initialize();
            self.each(function () {
                actions.swapLabels($(this).find('input,textarea').first());
            });
        }
        init();


        return this;
    };

    $(function () {
        $('.float-label-control').floatLabels();
    });
})(jQuery);


(function () {
    var $body = $('#body')
    var $loader = $('#loader-container')

    $(window).load(function(){
        setTimeout( hideLoader , 1000)
    });

    function hideLoader() {
        $loader.fadeOut('slow')
    }
})();



    var app = angular.module('app', [
      // 'ngAnimate'
        // ,'ngAria'
        // ,'ngMessages'
        // ,'ngMaterial',
        ,'ngIntlTelInput'
        ,'LocalStorageModule'
        ]);


   angular.module('ngIntlTelInput', []);

angular.module('ngIntlTelInput')
  .provider('ngIntlTelInput', function () {
    var me = this;
    var props = {};
    var setFn = function (obj) {
      if (typeof obj === 'object') {
        for (var key in obj) {
          props[key] = obj[key];
        }
      }
    };
    me.set = setFn;

    me.$get = ['$log', function ($log) {
      return Object.create(me, {
        init: {
          value: function (elm) {
            if (!window.intlTelInputUtils) {
              $log.warn('intlTelInputUtils is not defined. Formatting and validation will not work.');
            }
            elm.intlTelInput(props);
          }
        },
      });
    }];
  });
 angular.module('ngIntlTelInput')
  .directive('ngIntlTelInput', ['ngIntlTelInput', '$log',
    function (ngIntlTelInput, $log) {
      return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, elm, attr, ctrl) {
          // Warning for bad directive usage.
          if (attr.type !== 'text' || elm[0].tagName !== 'INPUT') {
            $log.warn('ng-intl-tel-input can only be applied to a *text* input');
            return;
          }
          // Override default country.
          if (attr.defaultCountry) {
            ngIntlTelInput.set({defaultCountry: attr.defaultCountry});
          }
          // Initialize.
          ngIntlTelInput.init(elm);
          // Validation.
          ctrl.$validators.ngIntlTelInput = function (value) {
            return elm.intlTelInput("isValidNumber");
          };
          // Set model value to valid, formatted version.
          ctrl.$parsers.push(function (value) {


            return elm.intlTelInput('getNumber').replace(/[^\d]/, '');
          });
          // Set input value to model value and trigger evaluation.
          ctrl.$formatters.push(function (value) {
            if (value) {
              value = value.charAt(0) === '+' || '+' + value;
              elm.intlTelInput('setNumber', value);
            }
            return value;
          });
        }
      };
    }])
   .directive('loading',   ['$http' ,function ($http)
    {
        return {
            restrict: 'A',
            link: function (scope, elm, attrs)
            {
                scope.isLoading = function () {
                    return $http.pendingRequests.length > 0;
                };

                scope.$watch(scope.isLoading, function (v)
                {
                    if(v){
                        elm.show();
                    }else{
                        elm.hide();
                    }
                });
            }
        };
      }]);


app.config(function (localStorageServiceProvider,ngIntlTelInputProvider) {
         localStorageServiceProvider.setPrefix('app_sfa').setNotify(true, true);
            ngIntlTelInputProvider.set({
                defaultCountry: 'IN'
            });




  })

    app.controller('SignUpCtrl',function($scope, $http, localStorageService)
    {



     if (localStorageService.get('client-data') == null) {
            var client_data = new Fingerprint2();
            var info = client_data.get(function(result) {
                localStorageService.set("client-data", result);
                $http.defaults.headers.common["x-client-data"] = localStorageService.get('client-data');
            });
        } else {
            $http.defaults.headers.common["x-client-data"] = localStorageService.get('client-data');
        }



          // localStorageServiceProvider.setPrefix('app_sfa').setNotify(true, true);
          //   ngIntlTelInputProvider.set({
          //       defaultCountry: 'IN'
          //   });


            $scope.show_signup = true;


    $scope.signup = function() {


  if ($scope.data_form.$invalid) {


                    return;
                }

   $http.put('dashboard/signup', {
   // $http.put('//api.manageteamz.com/dashboard/signup', {
                    data: $scope.data
                }).then(function(response) {
                    var res = angular.fromJson(response)
                    if (res.data.status == 'ok') {

                          //$mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));

                             $scope.show_signup = false;
                    } else {
                      alert(res.data.data);
                        // $mdDialog.show($mdDialog.alert().title(res.data.data).ok('OK'));
                    }
                });



                }



    $scope.resendEmail = function() {


           var data = {
                    email: '',
                    password: ''
                };
                data.email = $scope.data.email;
                data.password = $scope.data.password;


   $http.post('api/forget', {
                    data: data
                }).success(function(data, status) {
                    var res = angular.fromJson(data);
                    console.log(res.status);
                    if (res.status === 'ok') {

                        $scope.alert = res.data;
                              $scope.submit = true;
                    } else {
                        localStorageService.remove("apitoken");
                        if (res.data instanceof Array) {
                            $scope.alert = res.data[0];
                        } else {
                            $scope.alert = res.data;
                        }
                    }
                });
}

    $scope.login = function() {
                   if ($scope.data_form1.$valid) {
                var data = {
                    email: '',
                    password: ''
                };
                data.email = $scope.data.email;
                data.password = $scope.data.password;
                $http.post('/api/auth?api=web', {
                    data: data
                }).success(function(data, status) {
                    var res = angular.fromJson(data);
                    console.log(res.status);
                    if (res.status === 'ok') {
                        localStorageService.set("apitoken", res.data.token);
                        localStorageService.set("role", res.data.role);

                        if(res.data.demo_links)
                        {
                        localStorageService.set("demo_links", res.data.demo_links);
                        }
                        else
                        {
                               localStorageService.set("demo_links", []);
                        }



                        window.location='/dashboard#/app/user';
                    } else {
                        localStorageService.remove("apitoken");
                        if (res.data instanceof Array) {
                            $scope.alert = res.data[0];
                        } else {
                            $scope.alert = res.data;
                        }
                    }
                });
              }
            }

    });

</script>
  </body>
</html>
@endverbatim
