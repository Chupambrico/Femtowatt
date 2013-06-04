<%@page import="java.util.*" import="java.net.*" import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%
String titolo1 = request.getParameter("titolo");
String argomento1 = request.getParameter("argomento");
String autore1 = request.getParameter("autore");

String n = request.getParameter("nElementi");

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
    rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\",\"UTENTE\" WHERE \"PAGINA\".\"IDUTENTE\"=\"UTENTE\".\"ID\" AND "+richiesta+"  ORDER BY TITOLO ");
     }else{  rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\",\"UTENTE\" WHERE \"PAGINA\".\"IDUTENTE\"=\"UTENTE\".\"ID\"  ORDER BY TITOLO ");}
    
    Integer nElementi = 0;
    nElementi = Integer.parseInt(n);
    
    Integer risultato = 0;
    risultato = nElementi - 10;
    
    if(risultato > 0){
        i = 0;
        while((rs.next()) && (i < risultato - 1)){//Il -1 perchè il .next si attiva anche quando il risultato esce dalla condizione
            i++;
        }
        i = 0;
    }
    
    out.print("<table width='800px'>");
    while((rs.next()) && (i < 10)){//Bottone number 1
        i++;
        id = rs.getInt("ID");
        titolo = rs.getString("TITOLO");
        autore = rs.getString("USERNAME");
        testo = rs.getString("TESTO");
        testo = testo.replaceAll("\\<.*?\\>", "");

        Integer ltesto = testo.length();

        if(ltesto > 100){
            testo = testo.substring(0,30);
        }else{
            ltesto = (int)(ltesto * 0.3);
            testo = testo.substring(0, ltesto) ; 
        }
        data = rs.getString("DATA");
        ora = rs.getString("ORA");
        out.print("<tr><td><b><h4><a href='try.jsp?pag=viewPage&cod=" + id + "'>" + titolo + "</a></h4></b></td></tr>");
        out.print("<tr><td><b>" + autore + "</b></td></tr>");
        out.print("<tr><td><i>" + testo + "</i></td></tr>");
        out.print("<tr><td>" + data + " " + ora + "</td></tr>");
        out.print("<tr><td><hr width='800px' size='1' style='border: small dashed' ></td></tr>");
    }
    out.print("</table>");

%>