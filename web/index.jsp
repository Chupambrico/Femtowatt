<!DOCTYPE html>
<%
String pagina = request.getParameter("pag");
if(pagina == null){
    pagina = "home";
}
session.setAttribute("page",pagina);
session.setAttribute("level",10);
String visualPagina = pagina;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="css/project.css" rel="stylesheet" media="screen">
        <script src="js/md5.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/search.js"></script>
        <script src="js/login.js"></script>
        <script src="js/logout.js"></script>
        <script src="js/home.js"></script>
        <script language="javascript">
            window.onload = lista();
        </script>
        <title>JSP Page</title>
        <%@include file="titles.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
	<%@include file="header.jsp"%>
        <div class="container">
            <div class="row">
                <div class="span3">
                    <%@include file="sidebar.jsp"%>
                </div>
                <div class="span9"  style="padding-top: 40px; word-wrap: break-word;">
                    <div class="page-header">
                        <h1 id="title"><%=visualPagina%></h1>
                    </div>
                    <div>
                        <div id="r">
                        </div>
                        <div id="lista">
                            <%
                            try{
                                pageContext.include(pagina + ".jsp");
                            }catch(Exception e){
                                out.print("404 - Pagina non trovata<br><pre>" + e + "</pre>");
                            }
                            %>
                        </div>
                        <div id="errore" class="">
                        </div>
                        <div class="pagination">
                            <ul id="numeriPagine" >
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="footer.jsp"%>
        <%@include file="modal.jsp"%>
        
        <script>
            $('#sidebar').affix({
                offset: $('#sidebar').position()
            });
        </script>
    </body>
</html>