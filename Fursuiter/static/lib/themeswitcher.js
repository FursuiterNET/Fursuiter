function capitalize(src){
  return src?(src[0].toUpperCase()+src.substring(1)):src
}

$(document).ready(function(){
	theme = 'simplex'
	$('<div id="theme-selector">').prependTo('body')
		.html('<div class="btn-group dropup">' +
			'<button class="btn btn-info dropdown-toggle" id="theme-list-toggle" data-toggle="dropdown" aria-expanded="false">' +
				'<span class="visible-xs">X-Small</span><span class="visible-sm">Small</span><span class="visible-md">Medium</span><span class="visible-lg">Large</span>' +
				'<span class="caret"></span>' +
				'<span class="sr-only">Toggle Dropdown</span>' +
			'</button>' +
			'<ul class="dropdown-menu" role="menu" id="theme-list"></ul>' +
		'</div>').css({position:'fixed',bottom:'16px',left:'16px','z-index':50})

	themes = ['cerulean','cosmo','cyborg','darkly','flatly','journal','lumen','paper','readable','sandstone','simplex','slate','spacelab','superhero','united','yeti']

	for(t in themes) {
		t = themes[t]
		if(typeof t !="string"){continue;}
		$("<li>").appendTo($('#theme-list'))
			.text(capitalize(t))
			.wrapInner("<a href='javascript:void(0)' class='theme-anchor' data-theme='"+t+"'>")
	}

	$('body').on('click','.theme-anchor',function(){
		$('#stylesheet').attr('href',"https://maxcdn.bootstrapcdn.com/bootswatch/3.3.1/"+$(this).attr('data-theme')+"/bootstrap.min.css")
	})
})