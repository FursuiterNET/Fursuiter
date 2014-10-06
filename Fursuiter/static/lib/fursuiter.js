/* Bindings for all standard AJAX response bindings */
window.fursuiter = {
    responseBindings: {
        ALERT:function(alert){alert(alert)}, //Need to wrap these in closures to counteract Illegal Invocation protection
        LOG:function(message){console.log(message)},
        MESSAGE:showMessage
    }
}

/* Serialize all input elements within element 'el' */
function serialize(el) {
    var MD5 = function(src){return "";} //Dummy encryption function
    var o={};
    $.map($(el).find('input:not([type=radio]:not(:checked)), select, textarea'),function(e) {
        if(n=(e=$(e)).prop('name')) {
            o[n]=((e.is('[type=password]'))
                ?MD5(e.val())
                :((e.is('[type=checkbox]'))
                    ?e.is(':checked')
                    :e.val()));
        }
    });
    return o;
} 

/* Initiate AJAX Request */
function ajax(route,params,callback) {
    callback=callback||handleResponse;
    $.ajax({
        url:route||"ping",
        type:"POST",
        data:params||{},
        complete:function(xhr){
            callback(xhr.responseText);
        }
    })
}

/* Handle AJAX responses (responses should be in properly-formatted JSON) */
function handleResponse(jsonSrc) {
    jo = {}
    try {
        jo = JSON.parse(jsonSrc);
    } catch(e) {
        console.error("Could not parse JSON input: "+e);
        return 1;
    }

    for(k in jo) {
        if(clos=window.responseBindings[k]) {
            return clos(jo[k]);
        } else {
            console.warn("No binding found for \""+k+"\"");
        }
    }
}

/* Display on-screen message to user, message <div> will be appended to any elements with class 'messages' */
function showMessage(message) {
    var m = $("<div>"+message+"&nbsp;</div>").appendTo('.messages');
    var dismiss=function(){$(m).slideUp(function(){$(this).remove();});};
    $('<a href="javascript:void(0)" />').html("(dismiss)").click(dismiss).appendTo(m);
    setTimeout(dismiss,5000);
} 

/* Code for clock from early design
$.fn.clock = function () {
    var hours = $(this).find("#hours");
    var minutes = $(this).find("#minutes");
    var seconds = $(this).find("#seconds");
    var pad = function (n) {
        return (n < 10) ? ("0" + n) : n;
    };
    var update = function () {
        var date = new Date();
        hours.text(pad(date.getHours()));
        minutes.text(pad(date.getMinutes()));
        seconds.text(pad(date.getSeconds()));
    };

    setInterval(update, 500);
};

$(window).load(function () {
    $(".clock").clock();
    $(".nav-toggle").click(function () {
        $(".nav-menu").toggle();
        $(".dash-menu").toggle();
    });
});
*/