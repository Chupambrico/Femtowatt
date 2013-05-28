
<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>

 <%@ include file="connect.jsp" %>
<%
  String nome=request.getParameter("alfa");

  int i=0;
 if(nome==null ){
  out.print("<h1>404-Page not found</h1>");
  }else{
  Integer id=0;
  String titolo,testo,autore,ora,data;
  rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\",\"UTENTE\" WHERE \"PAGINA\".\"IDUTENTE\"=\"UTENTE\".\"ID\" AND LOWER( \"TITOLO\") LIKE LOWER('%"+nome+"%') AND \"PAGINA\".\"PAGINALEGATA\" IS NULL ORDER BY TITOLO ");
 // rs = q.esecuzioneQuery("SELECT * FROM \"UTENTE\" WHERE \"USERNAME\"='qwe'  ");
  while(rs.next()){i++;}
  
  if(i%10==0){
  out.print(i/10);
  }else{
  out.print((i/10)+1);
  }
   }
  %>