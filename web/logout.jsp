<%
session.removeAttribute("nome");
session.removeAttribute("password");
session.removeAttribute("idSession");
session.setAttribute("livello", 0);
out.print("ok");
%>