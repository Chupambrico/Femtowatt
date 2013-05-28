<%@page import="java.util.*" import="java.net.*" import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<div id="sample">
<script type="text/javascript" src="js/nicEdit.js"></script>
<script type="text/javascript">
    bkLib.onDomLoaded(function(){nicEditors.allTextAreas()});
</script>
<%
/*if(request.isRequestedSessionIdValid()){
    response.sendError(response.SC_UNAUTHORIZED,"Devi fare il login");
}else{out.print("Domani");}*/

String titolo = request.getParameter("titolo");   
String nome = (String)session.getAttribute("nome");
Integer nomeN = 0;
rs = q.esecuzioneQuery("SELECT * FROM \"UTENTE\" WHERE \"USERNAME\" = '" + nome + "'");
while (rs.next()){
    nomeN = rs.getInt("ID");
}
String testo = request.getParameter("testo");

String invia = request.getParameter("invia");
String preview = request.getParameter("preview");
String errore = "";

if(preview != null){
    out.print(testo);
    %>
    <form method="post" action="<%=request.getRequestURI() + "?" + request.getQueryString()%>">
        <table border="0" >
            <tr>
                <td >Titolo:</td>
                <td><input type="text" name="titolo" style="width:150px;"/></td>
            </tr>
            <tr>
                <td>Testo:</td>
                <td><textarea id="area2" type="text" cols="80" rows="20" name="testo" ><%=testo%></textarea></td>
            </tr>
        </table>
        <input  type="submit" name="invia" value="Invia!"/>
        <input  type="submit" name="preview" value="Preview"/>
    </form>
    </div>
    <%
}else{
    if(invia != null){
        out.print("<table border='0'>");
        out.print("<form method='post' action='" + request.getRequestURI() + "?" + request.getQueryString() + "' >  ");             

        if((titolo == null) || (titolo.equals(""))){
            errore = "1";
            out.print("<tr><td >Titolo:</td><td><input type='text' name='titolo' style='width:150px;background:red;'/><font color='red'>Manca il titolo</font></td></tr>") ;  
        }else{
            out.print("<tr><td >Titolo:</td><td><input type='text' name='titolo' style='width:150px;'value='" + titolo + "'/></td></tr>") ;  
        }
        String testo2 = testo;

        testo2 = testo2.replaceAll("\\<.*?\\>","");       
        testo2 = testo2.replaceAll("nbsp","");
        testo2 = testo2.replaceAll("&","");
        testo2 = testo2.replaceAll(";","");
        testo2 = testo2.replaceAll(" ","");
        testo2 = URLDecoder.decode(testo2);
        testo2 = URLEncoder.encode(testo2);
        testo2 = testo2.replaceAll("\\<.*?\\>","");       
        testo2 = testo2.replaceAll("%0D%0A","");
        Integer ltesto2 = testo2.length();

        if((testo2 == null) || (testo2.equals("")) ){ 
            errore = "1";
            out.print("<tr><tr><td>Testo:</td><td><textarea id='area2' type='text' cols='80' rows='20' name='testo' ></textarea><font color='red'>Testo mancante</font></td></tr></td></tr>") ;  
        }else{
            if(ltesto2 < 100){
                errore = "1";
                out.print("<tr><tr><td>Testo:</td><td><textarea  id='area2' type='text' cols='80' rows='20' name='testo' >" + testo + "</textarea><font color='red'>Il testo deve essere min 100 caretteri</font></td></tr></td></tr>") ;  
            }else{
                //out.print("<tr><td>Testo:</td><td><textarea id='area2' type='text' cols='80' rows='20'   name='testo' > "+testo+"</textarea></td></tr>") ;  
            }  
        }
        out.print("</table>");
        %>
        <input  type="submit" name="invia" value="Invia!"/>
        <input  type="submit" name="preview" value="Preview"/>
        </form>
        </div>
        <%
        if(errore.equals("")){            
            testo = testo.replaceAll("'","''");  

            Calendar calendar = new GregorianCalendar(); 
            String anno = Integer.toString(calendar.get(calendar.YEAR));
            String mese = Integer.toString(calendar.get(calendar.MONTH)+1);
            String giorno = Integer.toString(calendar.get(calendar.DAY_OF_MONTH));
            String ora = Integer.toString(calendar.get(calendar.HOUR_OF_DAY));
            String minuti = Integer.toString(calendar.get(calendar.MINUTE));
            String secondi = Integer.toString(calendar.get(calendar.SECOND));
            String data = mese + "/" + giorno + "/" + anno;
            String orario = ora + ":" + minuti + ":" + secondi;

            int i = 0;

            Integer ltesto = testo.length();

            if(ltesto > 10000){
                if((testo.length() % 10000) == 0){    
                    i = testo.length() / 10000;
                }else{   
                    i = (int)(testo.length() / 10000) + 1;
                }

                String ptesto = "";

                int punt = 0;

                ptesto = testo.substring(punt, punt + 10000);

                punt += 10000;

                q.esecuzioneUpdate("INSERT INTO \"PAGINA\" (\"TITOLO\",\"DATA\",\"ORA\",\"ARGOMENTO\",\"TESTO\",\"IDUTENTE\") VALUES "
                    + "('" + titolo + "','" + data + "' ,'" + orario + "','ciao','" + ptesto + "','" + nomeN + "')");
                rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\" WHERE \"TITOLO\"='" + titolo + "'");

                Integer id = 0;          
                while(rs.next()){
                    id = rs.getInt("ID");
                }

                for(int a = 0; a <= (i - 2); a++){
                    if(a == (i - 2)){
                        ptesto = testo.substring(punt, testo.length());
                        q.esecuzioneUpdate("INSERT INTO \"PAGINA\" (\"TITOLO\",\"DATA\",\"ORA\",\"ARGOMENTO\",\"TESTO\",\"IDUTENTE\",\"PAGINALEGATA\",\"NPAGINA\") VALUES "
                            + "('" + titolo + "','" + data + "' ,'" + orario + "','ciao','" + ptesto + "','" + nomeN + "','" + id + "','" + a + "')");
                    }else{
                        ptesto=testo.substring(punt, punt+10000);
                        q.esecuzioneUpdate("INSERT INTO \"PAGINA\" (\"TITOLO\",\"DATA\",\"ORA\",\"ARGOMENTO\",\"TESTO\",\"IDUTENTE\",\"PAGINALEGATA\",\"NPAGINA\") VALUES "
                            + "('" + titolo + "','" + data + "' ,'" + orario + "','ciao','" + ptesto + "','" + nomeN + "','" + id + "','" + a + "')");
                    }  
                    punt += 10000;             
                }
            }else{
                q.esecuzioneUpdate("INSERT INTO \"PAGINA\" (\"TITOLO\",\"DATA\",\"ORA\",\"ARGOMENTO\",\"TESTO\",\"IDUTENTE\") VALUES "
                    + "('" + titolo + "','" + data + "' ,'" + orario + "','ciao','" + testo + "','" + nomeN + "')");                                                 
            }
            response.sendRedirect("page.jsp?pag=messaggi&mess=Testo1Inserito");
        }
    }else{
        %>
        <form method="post" action="<%=request.getRequestURI() + "?" + request.getQueryString()%>">            
            <table border="0">
                <tr>
                    <td >Titolo:</td>
                    <td>
                        <input type="text" name="titolo" style="width:150px;"/>
                    </td>
                </tr>
                <tr>
                    <td>Testo:</td>
                    <td>
                        <textarea id="area2" type="text" cols="80" rows="20" name="testo"></textarea>
                    </td>
                </tr>
            </table>
            <input type="submit" name="invia" value="Invia!"/>
            <input type="submit" name="preview" value="Preview"/>
        </form>
        </div>
    <%}
}%>