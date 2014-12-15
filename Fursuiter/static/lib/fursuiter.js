/* Bindings for all standard AJAX response bindings */
window.fursuiter = {
    responseBindings: {
        ALERT:function(alert){alert(alert)}, //Need to wrap these in closures to counteract Illegal Invocation protection
        LOG:function(message){console.log(message)},
        MESSAGE:showMessage
    },
    spinners: [],
    requests: {}
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

/* Initiate AJAX Request, abort duplicates */
function ajax(route,params,callback) {

    if((r = window.fursuiter.requests[route]) && !r.isComplete){
        r.abort()
    }

    callback=callback||handleResponse;
    return window.fursuiter.requests[route] = $.ajax({
        url:route||"ping",
        type:"POST",
        data:params||{},
        complete:function(xhr){
            window.fursuiter.requests[route].isComplete = true;
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
        if(clos=window.fursuiter.responseBindings[k]) {
            return clos(jo[k]);
        } else {
            console.warn("No binding found for \""+k+"\"");
        }
    }
}

/* 
    Display on-screen message to user, message <div> will be appended to any
    elements with class 'messages'
*/
function showMessage(message) {
    var m = $("<div>"+message+"&nbsp;</div>").appendTo('.messages');
    var dismiss=function(){$(m).slideUp(function(){$(this).remove();});};
    $('<a href="javascript:void(0)" />').html("(dismiss)").click(dismiss).appendTo(m);
    setTimeout(dismiss,5000);
}

/* Shortcut function, get markup for glyphicon with name `ico` */
function ico(ico){
    return "<span class='glyphicon glyphicon-"+ico+"'></span>"
}

/*
    Make an element spin with the relative speed (default is 1). Returns a
    closure that stops the element spinning when called.
 */
function spin(el,speed){
    rot = 0
    window.fursuiter.spinners.push(nt = setInterval(function(){
        $(el).css({transform:'rotate('+(rot+=(5*(speed||1)))+'deg)'})
    },50))
    return function(){clearInterval(nt)}
}