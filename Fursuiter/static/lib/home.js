feeds = {
    'popular':{el:$('#feed-popular'),done:0,cursor:0},
    'recent':{el:$('#feed-recent'),done:0,cursor:0},
    'social':{el:$('#feed-social'),done:0,cursor:0},
    'events':{el:$('#feed-events'),done:0,cursor:0}
  }

  function feed(feedName) {
    if((pane=feeds[feedName]) && !pane.done) {
      thresh = ($(pane.el).height() + $(pane.el).offset().top - $(window).height()*2);
      if($(document).scrollTop() > thresh) {
        ajax('feeds/'+feedName,{cursor:pane.cursor},function(res) {
          data = handleResponse(res)
          if(data) {
            $(pane.el).append(data.html)
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
    $('#home-content').on("click","#feed-nav li:not(.active) a",function() {
      $('#feed-nav .active').removeClass('active')
      $(this).parents('li:first').addClass('active')

      pane = $('#'+$(this).attr('data-feed-id'))
      $('.feed-pane').hide()
      feed($(pane).show().attr('data-feed-name'))
    })

    $('.feed-pane').hide()

    // Load tab specified in URL hash or within markup
    {((h=window.location.hash)?($('a[href='+h+']')):($('#feed-nav a.default'))).trigger('click')}

    // Bindings for message form and status addons
    $('#home-content').on("submit","#message-form",function(){
      $('#feed-nav [data-feed-id=feed-recent]').click()
      $(this).find('input, textarea, button').attr('disabled',true)
      ajax("post","create",function(res){
        $(res.CONTENT).prependTo('#feed-recent').hide().slideDown()
        $('#message-form').find('input, textarea, button').attr('disabled',false)
        $('#message-input').val("")
      })
    })

    $('.status-addon-button').on("click",function(){
      $('.status-addon-group').hide()
      $('.status-addon-group[data-addon-type='+$(this).attr('data-addon-type')+']').show()
    })

    $('.status-addon-group').hide()

    // Bindings for pane changer options
    $('.pane-changer').on('click',function(){
      self = this;
      $('.pane-changer.active').removeClass('active')
      $(this).addClass('active')
      $('#home-content').animate({'margin-top':'12px',opacity:0},"fast","swing",function(){
        $(this).css({'margin-top':'-8px'}).animate({opacity:1,'margin-top':'0'},"fast").html("<p>Loading...</p>")
        $.ajax({
          url: "/"+$(self).attr('data-target-pane'),
          type: "GET",
          data: {headless:1},
          complete: function(xhr) {
            res = xhr.responseText;
            if(res.trim()) {
              $('#home-content').html(""+res)
            } else {
              $('#home-content').html("<h3>Error</h3><p>Uh oh! Looks like there was an error loading this page. Please try again in a bit.</p>");
            }
          }
        })
      })

      return false;
    }).filter('.active:first').trigger('click');
  })