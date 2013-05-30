<!DOCTYPE html>
<%
String pagina = request.getParameter("pag");
if(pagina == null){
    pagina = "home";
}
session.setAttribute("page",pagina);
session.setAttribute("level",10);
String visualPagina="";
String[] codPag = new String[5];
codPag[0]="home";
codPag[1]="scrivipagina";
codPag[2]="viewPage";
codPag[3]="showPages";
codPag[4]="administrator";

String[] realPag = new String[5];

realPag[0]="Home";
realPag[1]="Scrivi il tuo articolo";
realPag[2]="";
realPag[3]="Elenco";
realPag[4]="Amministrazione";

for(int i=0;i<realPag.length;i++){
   if(pagina.equals(codPag[i])){
       visualPagina=realPag[i];
   }
}
%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="css/project.css" rel="stylesheet" media="screen">
         <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/search.js"></script>
        <script src="js/login.js"></script>
        <script src="js/logout.js"></script>
        <script src="js/home.js"></script>
        <title>JSP Page</title>
    </head>
    <body  >
        <%@include file="navbar.jsp"%>
	<%@include file="header.jsp"%>
        <div class="container">
            <div class="row">
                <div class="span3">
                    <%@include file="sidebar.jsp"%>
                </div>
                <div class="span9"  style="padding-top: 40px; word-wrap: break-word;">
                    <div class="page-header">
                        <h1><%=visualPagina%></h1>
                    </div>
                    
                    <div>
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
            $(function () {
                $("[rel='popover']").popover();  
            });  
        </script>
     
           
        <script>
            $('#sidebar').affix({
                offset: $('#sidebar').position()
            });
        </script>
    </body>
</html>
