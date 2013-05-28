<%
CreaConnessione c = new CreaConnessione("jdbc:firebirdsql:localhost:E:/db/GRANDEPROGETTO.FDB", "SYSDBA", "masterkey");
Query q = new Query(c.connetti());
ResultSet rs;
%>
