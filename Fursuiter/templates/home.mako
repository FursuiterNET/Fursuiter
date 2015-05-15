%if req.user:
  
  <%include file="home.loggedin.mako" />

%else:

  <%include file="home.public.mako" />

%endif
