<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<script src="tinymce/tinymce.min.js"></script>
<script src="js/viewPage.js"></script>              
<%
String nome = (String)session.getAttribute("nome");
String id = request.getParameter("cod"); 
String testo = "";   
String titolo = "";
String autore = "";
Integer ids = Integer.parseInt(id);   

rs = q.esecuzioneQuery("SELECT *" + 
                           "FROM \"PAGINA\", \"UTENTE\"" + 
                           "WHERE \"PAGINA\".\"IDUTENTE\" = \"UTENTE\".\"ID\"" + 
                           "AND \"PAGINA\".\"ID\" = " + ids);
String argomento="";
Integer idu=0;
while (rs.next()){
    idu=rs.getInt("IDUTENTE");
    argomento=rs.getString("ARGOMENTO");
    titolo = rs.getString("TITOLO");
    autore = rs.getString("USERNAME");            
    testo = rs.getString("TESTO");
}

if(autore.equals(nome)){
    out.print("<div id='modEl'>");
    out.print("<b>Edit </b><a onclick='a();' class='icon-edit'></a>");
    out.print("<b> Delete </b><a onclick='b();' class='icon-remove'></a>");
    out.print("</div>");
}
out.print("<div id='avvisi'></div>");                   
out.print("<b><h2 id='headings'> " + titolo + "</h2></b><br>");
out.print("Autore :<a href='index.jsp?pag=profile&cod="+idu+"'> <b>" + autore + "</b></a><br>");
out.print("<div id='arg'>Argomento : <b id='a'>" + argomento + "</b></div><br>");
out.print("<div id='testo' class=''><br>" + testo + "</div>");
out.print("<input id='cod' type='hidden' value='" + id + "' >");
out.print("<div id='bottone'></div>");
%>
<%@include file="confirmModal.jsp"%>
<br><br>
<a class="btn btn-primary" href="index.jsp?pag=home">< Indietro</a>
      
