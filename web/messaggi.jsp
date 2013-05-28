<%@page import="com.sun.xml.internal.fastinfoset.util.StringArray" contentType="text/html" pageEncoding="UTF-8"%>
<%
String mess = request.getParameter("mess");
String stringa[] = mess.split("1");
mess = "";
for(int i = 0; i < stringa.length; i++){
    mess += " " + stringa[i];
}
%>                
<center>
    <h1><font color="green"><%=mess%></font></h1>
    <%
    response.setHeader("Refresh","5; URL=index.jsp");
    %>
</center>