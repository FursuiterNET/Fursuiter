<%inherit file="../base.mako" />

<%block name="includes">
	<link rel="stylesheet" href="/static/style/css/gallery.css">
	<script src="/static/lib/imagesloaded.min.js"></script>
	<script src="/static/lib/masonry.min.js"></script>
	<script src="/static/lib/gallery.js"></script>
</%block>

<div class="gallery-container">
	% for i in images:

		<a href="/user/${i['user']}/" class="masonry-target quarter-width">
			<img src="${i['path']}" alt="${i['title']}" class="img-responsive">
		</a>

	% endfor
</div>
