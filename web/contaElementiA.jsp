
<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>

 <%@ include file="connect.jsp" %>
<%

String titolo1 = request.getParameter("titolo");
String argomento1 = request.getParameter("argomento");
String autore1 = request.getParameter("autore");



int i = 0;

    String titolo, testo,  ora, data,autore,richiesta="";
    Integer idu=0,qer=0;
    
    if((autore1!="")&&(autore1 != null)){
  
     richiesta+=" LOWER(\"UTENTE\".USERNAME)LIKE LOWER('%"+autore1+"%')";
    } 
    
    if(argomento1!=""&&(argomento1 != null)){
    if(richiesta!= ""){richiesta+="AND";}
         richiesta+=" LOWER(\"PAGINA\".ARGOMENTO)LIKE LOWER('%"+argomento1+"%')";
    } 
    
   if((titolo1!="")&&(titolo1 != null)){
    if(richiesta!= ""){richiesta+="AND";}
        richiesta+=" LOWER(\"PAGINA\".TITOLO)LIKE LOWER('%"+titolo1+"%')";
    } 
      

      
      
    Integer id = 0;
  
    
    if(richiesta!=""){
    richiesta = richiesta.replaceAll("'","''"); 
    rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\",\"UTENTE\" WHERE \"PAGINA\".\"IDUTENTE\"=\"UTENTE\".\"ID\" AND "+richiesta+"  ORDER BY TITOLO ");
     }else{  rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\",\"UTENTE\" WHERE \"PAGINA\".\"IDUTENTE\"=\"UTENTE\".\"ID\"  ORDER BY TITOLO ");}
    
  while(rs.next()){
      i++;
  }
  
  if(i%10==0){
  out.print(i/10);
  }else{
  out.print((i/10)+1);
  }
   
  %>