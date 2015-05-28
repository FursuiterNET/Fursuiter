%if req.user:

<h3>Profile Settings</h3>

%else:

<%include file="../notlogged.mako" />

%endif
