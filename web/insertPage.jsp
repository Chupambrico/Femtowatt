<%@page import="java.util.*" import="java.net.*" import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<% 
String titolo = request.getParameter("titolo");   
String nome = (String)session.getAttribute("nome");
Integer nomeN = 0;
rs = q.esecuzioneQuery("SELECT * FROM \"UTENTE\" WHERE \"USERNAME\" = '" + nome + "'");
while (rs.next()){
    nomeN = rs.getInt("ID");
}

String testo = request.getParameter("testo");
String argomento = request.getParameter("argomento");
String mods = request.getParameter("mod");
String errore = "";    
String testo2 = testo;
testo2 = testo2.replaceAll("\\<.*?\\>","");
testo2 = testo2.replaceAll(";","");
testo2 = testo2.replaceAll(" ","");
Integer ltesto2 = testo2.length();



if((testo2 == null) || (testo2.equals("")) ){ 
    errore = "1";
    out.print("1") ;  
}else{
    if(ltesto2 < 100){
        errore = "1";
        out.print("2") ;  
    }else{
        out.print("3") ;  
    }  
}



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
    
    if(mods.equals("1")){
     String ida = request.getParameter("cod"); 
     Integer ids = Integer.parseInt(ida);   
   q.esecuzioneUpdate("UPDATE  \"PAGINA\" SET \"TITOLO\"='"+titolo+"' ,\"DATA\"='"+data+"',\"ORA\"='"+orario+"',\"ARGOMENTO\"='"+argomento+"',\"TESTO\"='"+testo+"',\"ATTIVO\"='off' WHERE ID="+ids);
    
    }else{
    int i = 0;

  //  Integer ltesto = testo.length();

  /*  if(ltesto > 10000){
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
            + "('" + titolo + "','" + data + "' ,'" + orario + "','" + argomento + "','" + ptesto + "','" + nomeN + "')");
        rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\" WHERE \"TITOLO\"='" + titolo + "'");

        Integer id = 0;          
        while(rs.next()){
            id = rs.getInt("ID");
        }

        for(int a = 0; a <= (i - 2); a++){
            if(a == (i - 2)){
                ptesto = testo.substring(punt, testo.length());
                q.esecuzioneUpdate("INSERT INTO \"PAGINA\" (\"TITOLO\",\"DATA\",\"ORA\",\"ARGOMENTO\",\"TESTO\",\"IDUTENTE\",\"PAGINALEGATA\",\"NPAGINA\") VALUES "
                    + "('" + titolo + "','" + data + "' ,'" + orario + "','" + argomento + "','" + ptesto + "','" + nomeN + "','" + id + "','" + a + "')");
            }else{
                ptesto=testo.substring(punt, punt+10000);
                q.esecuzioneUpdate("INSERT INTO \"PAGINA\" (\"TITOLO\",\"DATA\",\"ORA\",\"ARGOMENTO\",\"TESTO\",\"IDUTENTE\",\"PAGINALEGATA\",\"NPAGINA\") VALUES "
                    + "('" + titolo + "','" + data + "' ,'" + orario + "','" + argomento + "','" + ptesto + "','" + nomeN + "','" + id + "','" + a + "')");
            }  
            punt += 10000;             
        }
    }else{*/

                       
        q.esecuzioneUpdate("INSERT INTO \"PAGINA\" (\"TITOLO\",\"DATA\",\"ORA\",\"ARGOMENTO\",\"TESTO\",\"IDUTENTE\") VALUES "
            + "('" + titolo + "','" + data + "' ,'" + orario + "','" + argomento + "','" + testo + "','" + nomeN + "')");                                                 
   }
 //   }
}
%>
