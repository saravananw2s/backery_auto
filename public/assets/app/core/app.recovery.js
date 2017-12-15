var globalapp = {};
globalapp.debugMode = true;

globalapp.isEmpty = function (str) {
    return (!str || 0 === str.length);
}


window.mdSelectOnKeyDownOverride = function(event) { event.stopPropagation(); };


globalapp.getSubdomain =  function (url) {

        var url = url || window.location.hostname;
        var regexParse = new RegExp('[a-z\-0-9]{2,63}\.[a-z\.]{2,5}$');
        var urlParts = regexParse.exec(url);
        var sub_domain = window.location.hostname.replace(urlParts[0],'').slice(0, -1);
        if(globalapp.isEmpty(sub_domain))
        {
            sub_domain = 'www';
        }
        return sub_domain;
}

globalapp.alert = function (str) {

    // var mp3 = $('<audio id="soundHandle" style="display:none;"></audio>').attr('src','assets/sound/gets-in-the-way.mp3');

    // $(mp3)[0].play();
}



globalapp.notifyMe = function (title,body,icon) {


 return;


 // request permission on page load
document.addEventListener('DOMContentLoaded', function () {
  if (Notification.permission !== "granted")
    Notification.requestPermission();
});

    var title = title || 'Update from Fleets';
    var icon = icon || '//manageteamz.com/api/logo';
    var body = body || 'You got new notification';

  if (!Notification) {
    //alert('Desktop notifications not available in your browser');
    return;
  }

  if (Notification.permission !== "granted")
    Notification.requestPermission();
  else {
    var notification = new Notification(title, {
      icon: icon,
      body: body,
    });

    notification.onclick = function () {
      // window.open("http://stackoverflow.com/a/13328397/1269037");
    };

  }

}





 globalapp.socket_host = 'http://'+document.location.host+':6001';
// globalapp.socket_host = 'http://localhost:6001';


globalapp.channel = globalapp.getSubdomain()+'-';


if (globalapp.debugMode) {
    // window.console.log = function(data) {
    //     console.info(data);
    // }
    // window.console.warn = function(data) {
    //     console.info(data);
    // }
    // window.console.error = function(data) {
    //     console.info(data);
    // }
} else {
    window.console.log = function(data) {}
    window.console.warn = function(data) {}
    window.console.error = function(data) {}
}

globalapp.logout = function()
{

       globalapp.clear()
     document.location = "/dashboard/login";

}

globalapp.clear = function()
{

    localStorage.clear();
    sessionStorage.clear();


 var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }


}
globalapp.pagenation = [5, 10, 15];
globalapp.errorimg = '/assets/images/error/no-preview.jpg';
globalapp.imgerror = function(data, event) {
    data.onerror = null;
    data.src = globalapp.errorimg;
}
globalapp.back = function() {
    window.history.back();
}
globalapp.ajax = {};
globalapp.ajax.x = function() {
    if (typeof XMLHttpRequest !== 'undefined') {
        return new XMLHttpRequest();
    }
    var versions = ["MSXML2.XmlHttp.6.0", "MSXML2.XmlHttp.5.0", "MSXML2.XmlHttp.4.0", "MSXML2.XmlHttp.3.0", "MSXML2.XmlHttp.2.0", "Microsoft.XmlHttp"];
    var xhr;
    for (var i = 0; i < versions.length; i++) {
        try {
            xhr = new ActiveXObject(versions[i]);
            break;
        } catch (e) {}
    }
    return xhr;
};
globalapp.post = function(url, value) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({
        value: value
    }));
}
