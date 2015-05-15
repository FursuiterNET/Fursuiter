<%inherit file="../base.mako" />
%if req.user:

Bark bark!

%else:

Not logged in!

%endif