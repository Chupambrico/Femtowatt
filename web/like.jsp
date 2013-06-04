<%@page import="java.util.*" import="java.net.*" import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%
String nome = request.getParameter("alfa");
String n = request.getParameter("nElementi");
int i = 0;

if(n == null || nome == null){
    //out.print("<h1>404-Page not found</h1>");
    out.print(nome);
}else{
    Integer id = 0;
    String titolo, testo, autore, ora, data;
    rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\",\"UTENTE\" WHERE \"PAGINA\".\"IDUTENTE\"=\"UTENTE\".\"ID\" AND LOWER( \"TITOLO\") LIKE LOWER('%"+nome+"%') AND \"PAGINA\".\"ATTIVO\" = 'on' AND \"PAGINA\".\"DEL\" <> 'on' ORDER BY TITOLO ");
    
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
}
%>