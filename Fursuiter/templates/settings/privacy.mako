%if req.user:

<h3>Privacy Settings</h3>

%else:

<%include file="../notlogged.mako" />

%endif
