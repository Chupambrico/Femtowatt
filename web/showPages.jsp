<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%  
if(session.getAttribute("idSession") == null){
    out.print("Per poter scrivere un nuovo articolo devi effettuare il login");
}else{
    out.print("<a href='try.jsp?pag=scrivipagina'>Scrivi nuovo articolo</a>");
    String id = "";   
    String testo = "";  
    String nome = "";
    String titolo = "";
    Integer num = 0;
    Integer index;
    String parametri = "";
    Integer dimension = 0;

    String indice = request.getParameter("indice");
    if((indice == null) || (indice.equals(""))){
        indice = "0";
    }

    index = Integer.parseInt(indice);
    if (index < 0){
        index = 0;
    }

    rs = q.esecuzioneQuery("SELECT COUNT(*) AS NUMPAG FROM \"PAGINA\" WHERE \"PAGINALEGATA\" IS NULL ");

    rs.next();
    dimension = rs.getInt("NUMPAG");

    if(index >= dimension){
        index = dimension - 6;
    }

    rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\", \"UTENTE\"" + 
                           "WHERE \"PAGINA\".\"IDUTENTE\" = \"UTENTE\".\"ID\"" + 
                           "AND \"PAGINA\".\"PAGINALEGATA\" IS NULL ORDER BY TITOLO");

    try{
        for(int i = 0; i < index; i++){
            rs.next();
        }
        parametri = request.getQueryString();
        if(parametri != null){
            Integer posIndice = parametri.indexOf("indice=");
            if(posIndice > 0){
                parametri = parametri.substring(0, posIndice - 1);
            }
        }

        while (rs.next()) {
            id     = rs.getString("ID");       
            titolo = rs.getString("TITOLO");
            nome   = rs.getString("USERNAME");               
            testo  = rs.getString("TESTO");

            testo = testo.replaceAll("\\<.*?\\>", "");

            Integer ltesto = testo.length();

            if(ltesto > 100){
                testo = testo.substring(0,60);
            }else{
                ltesto = (int)(ltesto * 0.6);
                testo = testo.substring(0, ltesto) ; 
            } 
            out.print("<table border='0'>");                            
            out.print("<tr><td>Titolo : <b>" + titolo + "</b></td></tr>");
            out.print("<tr><td>Nome   : <b>" + nome + "</b></td></tr>");
            out.print("<tr><td>Testo  : " + testo + "<a href='try.jsp?pag=viewPage&cod=" + id + "'>...</a></td></tr>");
            out.print("<tr><td><hr width='100%' heigth='25'></td></tr>");
            out.print("</table>");

            num++;

            if(num == 6){
                break;
            }
        }
        %><center><%
        if(index > 0){
            %>
            <a href="try.jsp?<%=parametri%>&indice=<%=index - 6%>">Precedenti risultati</a>
            <%
        }
        if(rs.next()){
            %>
            <a href="try.jsp?<%=parametri%>&indice=<%=index + 6%>">Prossimi risultati</a>
            <%
        }
        %></center><%
    }catch(Exception e){}
}
%>