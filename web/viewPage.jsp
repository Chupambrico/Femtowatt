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
while (rs.next()){
    argomento=rs.getString("ARGOMENTO");
    titolo = rs.getString("TITOLO");
    autore = rs.getString("USERNAME");            
    testo = rs.getString("TESTO");
}

if(autore.equals(nome)){
    out.print("<b>Edit </b><a href='#confirmModal' role='button' data-toggle='modal' class='icon-edit'></a>");
    out.print("<b> Delete </b><a onclick='del();' class='icon-remove'></a>");
	out.print("<div id='bottone'></div>");
}
out.print("<div id='avvisi'></div><br>");                   
out.print("<b><h2 id='headings'> " + titolo + "</h2></b><br>");
out.print("Autore : <b>" + autore + "</b><br>");
out.print("<div id='arg'>Argomento : <b>" + argomento + "</b></div><br>");
out.print("<div id='testo' class=''><br>" + testo + "</div>");
out.print("<input id='cod' type='hidden' value='" + id + "' >");
%>
<%@include file="confirmModal.jsp"%>
<br><br>
<a class="btn btn-primary" href="try.jsp?pag=home">< Indietro</a>
      
