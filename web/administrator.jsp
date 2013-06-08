<%@page import="java.sql.*" import="database.CreaConnessione"  import="java.sql.*" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<script language="javascript">
    window.onload=function a() { document.getElementById("l1").className="active";  
    document.getElementById("l3").className=""; 
    document.getElementById("l2").className="";}
</script>
<%@include file="schede.html" %>
<table>
    <tr>
        <td>
            Totale pagine :
        </td>
        <td>
            <%
            rs = q.esecuzioneQuery("SELECT COUNT(*) AS TOTPAG FROM \"PAGINA\"");
            while(rs.next()){
                out.print(rs.getString("TOTPAG"));
            }%>
        <td/>
    </tr>
    <tr>
        <td>
            Totale Utenti :
        </td>
        <td>
            <%
            rs = q.esecuzioneQuery("SELECT COUNT(*) AS TOTUTE FROM \"UTENTE\"");
            while(rs.next()){
                out.print(rs.getString("TOTUTE") + "");
            }
            %>
        </td>
    </tr>
</table>
