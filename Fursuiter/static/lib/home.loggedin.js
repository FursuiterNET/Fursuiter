function initializeFeeds() {

  window.fursuiter.feeds = {
    // (Done is truthy when feed has no more content to display)
    'popular':{el:$('#feed-popular'),done:0,cursor:0},
    'social':{el:$('#feed-social'),done:0,cursor:0},
    'recent':{el:$('#feed-recent'),done:0,cursor:0},
    'events':{el:$('#feed-events'),done:0,cursor:0}
  }
}

/* Fetch latest feed content */
function feed(feedName) {
  if((pane=window.fursuiter.feeds[feedName]) && !pane.done) {

    // Scrolling threshold; if user scrolls past this, more feed is requested
    thresh = ($(pane.el).height() + ($(pane.el).position().top) - $(window).height()*2);
    
    if($(document).scrollTop() > thresh) {
      aget('feeds/'+feedName,{cursor:pane.cursor},function(data) {
        if(data) {
          $(pane.el).append(data)
          pane.cursor = data.cursor
          pane.done = data.done
        } else {
          pane.done=true
          $(pane.el).append("<div class='well'><h3>Error</h3><p><strong>Oh no!</strong> There was an error retrieving more feed entries.</p></div>")
        }
      })
    }
  }
}

function updates(feedName) {
  //TODO: write function to poll server for new posts in feeds
}

$(document).ready(function() {

  // Bindings for feed navs
  $('body').on("click","a.feed-trigger",function(e) {
    e.preventDefault();
    feedName = $(this).attr('data-target-feed')
    feed(feedName)
    $('.feed-pane').hide()
    $('#feed-'+feedName).show()

    $('.feed-trigger.active').removeClass('active').parent('li').removeClass('active')
    $('[data-target-feed="'+feedName+'"]').addClass("active").parent('li').addClass('active')

  // Bindings for message form and status addons
  }).on("submit","#message-form",function(){
    $('#feed-nav [data-feed-id=feed-recent]').click()
    $(this).find('input, textarea, button').attr('disabled',true)
    ajax("post","create",function(res){
      $(res.CONTENT).prependTo('#feed-recent').hide().slideDown()
      $('#message-form').find('input, textarea, button').attr('disabled',false)
      $('#message-input').val("")
    })
  }).on("click",".status-addon-button",function(){
    $('.status-addon-group').hide()
    $('.status-addon-group[data-addon-type='+$(this).attr('data-addon-type')+']').show()
  })

  $('.feed-pane').hide()
  $('.status-addon-group').hide()


  // Bindings for pane changer options (Not using pane changers anymore)
  /*$('.pane-changer').on('click',function(){
    self = this;

    $('.pane-changer.active').removeClass('active')
    $(this).addClass('active')
    $('#home-content').animate({'margin-top':'12px',opacity:0},"fast","swing",function(){
      $(this).css({'margin-top':'-8px'}).animate({opacity:1,'margin-top':'0'},"fast").html("<p>Loading...</p>")
      aget($(self).attr('data-target-pane'),{headless:1},function(res) {
        if(res.trim()) {
          $('#home-content').html(""+res)
          initializeFeeds();
        } else {
          $('#home-content').html("<h3>Error</h3><p>Uh oh! Looks like there was an error loading this page. Please try again in a bit.</p>");
        }
      })
    })
  });*/

  // Initialize feed objects
  initializeFeeds();

  // Load tab specified in URL hash or within markup (not using pane changers anymore)
  /*if(tgt=$('a[href="'+(window.location.hash||"")+'"]')){
    $(tgt).trigger('click')
  }*/

  $('a.feed-trigger.default:first').click(); // Active default marked feed if present
})