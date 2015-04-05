/* Bindings for all standard AJAX response bindings */
window.fursuiter = {
  responseBindings: {
    ALERT:function(alert){alert(alert)}, //Need to wrap these in closures to counteract Illegal Invocation protection
    LOG:function(message){console.log(message)},
    MESSAGE:showMessage
  },
  spinners: [],
  requests: {},
  timeouts: {}
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

/* [Private] Initiate AJAX Request, abort duplicates */
function _ajax(options) {

  options.route=options.route||"ping"
  if((r = window.fursuiter.requests[options.route]) && !r.isComplete){
    r.abort()
  }

  options.callback=options.callback||handleResponse;
  return window.fursuiter.requests[options.route] = $.ajax({
    url:options.route,
    type:options.type||"POST",
    data:options.params||{},
    complete:function(xhr){
      window.fursuiter.requests[options.route].isComplete = true;
      if(options.handleResponse===false) {
        options.callback(xhr.responseText)
      } else {
        options.callback(handleResponse(xhr.responseText));
      }
    }
  })
}

/* Standard AJAX request */
function ajax(route,params,callback){
  return _ajax({route:route,params:params,callback:callback,type:"POST",handleResponse:true})
}

/* AJAX for unencapsulated markup grab */
function aget(url,params,callback) {
  return _ajax({route:url,params:params,callback:callback,type:"GET",handleResponse:false})
}

/* Handle AJAX responses (responses should be in properly-formatted JSON) */
function handleResponse(jsonSrc) {
  jo = {}
  try {
    jo = JSON.parse(jsonSrc);
  } catch(e) {
    console.error("Could not parse JSON input: "+e);
    return undefined;
  }

  for(k in jo) {
    if(clos=window.fursuiter.responseBindings[k]) {
      clos(jo[k]);
    } else {
      console.warn("No binding found for \""+k+"\"");
    }
  }

  return jo || undefined
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

/*
  Bind AJAX to element that will fire 0.75 seconds after the last keyup,
  ensures redundant requests and timeout overlap do not occur. Configuration
  parameter object keys are as follows:

  complete: function to execute when AJAX request returns. Arguments are res
    (as in ajax() function), and context (supplied by onfire). Optional
  noinput: function to execute when text field has no input. Optional.
  onfire: function to execute before request is sent. Returned value is used
    as the context argument passed to `complete`. Optional.
  params: function that returns the AJAX request arguments. If not supplied,
    name and value will be pulled from markup automatically.
  parel: selector of parent of the target element(s). Defaults to 'body'.
  * route: AJAX route string
  spinWrap: Wrapper for spinning cog icon. Optional.
*/
function liveInput(target,par) {
  $(par.parel||"body").on("keyup",target,function(){
    noop = function(){}
    t = $(target)
    val = t.val()
    if(val != t.attr('data-previous-value')){
      t.attr('data-previous-value',val)
      clearTimeout(window.fursuiter.timeouts[target])
      if(val){
        window.fursuiter.timeouts[target] = setTimeout(function(){
          context = (par.onfire||noop)()
          if(!val){
            val = t.attr('data-previous-value')
          }
          nm = t.prop('name')
          params = par.params?(par.params(t)):{nm:t.val()}
          s = noop
          if(par.spinWrap) {
            i = $(ico('cog'));
            $(par.spinWrap).html(i);
            s = spin(i)
          }
          ajax(par.route,params,function(res){
            s()
            {(par.complete||noop)(res,context)}
          })
        },750)
      } else {
        (par.noinput||noop)()
      }
    }
  })
}

$(document).ready(function(){
  //Apply binding to search box
  liveInput("#search-input",{
    route: "search",
    complete: function(res){$('#search-results').html(res.CONTENT)},
    onfire: function(){$('#search-results').html("Searching...").show()},
    noinput: function(){$('#search-results').html("").hide()}
  })
})