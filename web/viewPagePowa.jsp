<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<script src="js/tinymce/tinymce.min.js"></script>
<script language="javascript">

function del(){
    var id=0;
    id=document.getElementById("cod").value;
        
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
           alert ("Your browser does not support Ajax HTTP");
           return;
                      }
      

    var url="deletePage.jsp?";
    url=url+"cod="+id;

    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
         
  }
  
function mod(){
    document.getElementById("headings").className="headings";
    document.getElementById("testo").className="editable";
    document.getElementById("arg").innerHTML="<div id='ak2' class='control-group '>"+
        "<label class='control-label'></label>"+
        "<div class='controls' >"+
        "<select name='argomento' onchange='controlA();'>"+
        "<option value='0'>---Segli Argomento---</option>"+
        "<option value='Elettronica'>Elettronica</option>"+
        "<option value='Informatica'>Informatica</option>"+
        "<option value='Inglese'>Inglese</option>"+
        "<option value='Italiano'>Italiano</option>"+
        "<option value='Matematica'>Matematica</option>"+
        "<option value='Storia'>Storia</option>"+
        "<option value='Sistemi'>Sistemi</option>"+
        "<option value='Statistica'>Statistica</option>"+
        "</select>"+
        "</div>"+
        "</div>"+
        "</div>";
    modt();
}

function modt(){
    tinymce.init({
        selector: "h2.headings",
        inline: true,
        toolbar: "undo redo",
        menubar: false
    });

    tinymce.init({
        selector: "div.editable",
        inline: true,
        plugins: [
            "advlist autolink lists link image charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste"
        ],
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
    });
}
</script>              
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

rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\" WHERE \"PAGINALEGATA\" = " + ids + " ORDER BY NPAGINA ASC");
while (rs.next()){
    testo += rs.getString("TESTO");
}                            
out.print("<div id='titolo'><h2 id='headings'><b> " + titolo + "</b></h2></div><br>");
out.print("Autore : <b>" + autore + "</b><br>");
out.print("<div id='arg'>Argomento : <b>" + argomento + "</b></div><br><br>");
out.print("<div  id='testo' class=''> <br>" + testo+"</div>");
out.print("<input id='cod' type='hidden' value='"+id+"' >");

if(autore.equals(nome)){
   out.print(" <b>Edit </b><a onclick='mod();' class='icon-edit'> </a>");
      out.print("  <b>  Delete </b><a onclick='del();' class='icon-remove'></a>");
}

%>
<br><br>
   <a class="btn btn-primary" href="try.jsp?pag=home">< Indietro</a>
      
