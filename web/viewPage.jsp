<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<script src="js/tinymce/tinymce.min.js"></script>
<script language="javascript">
var errTitolo="1";
var titolo="";
var errAngomento="1";
var arg="";

function titolo1(){
    var stringa = document.getElementById("headings").innerHTML;;

    var regexp =/^[a-zA-Z0-9\s]+$/;

    if (regexp.test(stringa) == false){
          document.getElementById("avvisi").innerHTML="<div class='alert alert-error'><h4><b>Attenzione!</b>Titolo non corrtetto!</h4></div>"
      
        errTitolo="1";
    }else{
        titolo=stringa;
        errTitolo="0";
    }
  return;
}
    
function controlA(){
    var stringa = document.scrivi.argomento.value;
    if (stringa=="0"){
        document.getElementById("ak2").className="control-group error";
        errArgomento="1";
    }else{
        arg=stringa;
        document.getElementById("ak2").className="control-group success";
        errArgomento="0";
    }
    
}

       


function testout(){
    if (xmlhttp.readyState==4){
        var stringa= xmlhttp.responseText.trim();
        var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");
        
        if(stringa=="1" || stringa=="2"){
            document.getElementById("avvisi").innerHTML="<div class='alert alert-error'><h4><b>Attenzione!</b> Testo inferiore ai 100 caratteri!</h4></div>"
        }else{
            document.getElementById("avvisi").innerHTML=""
            document.getElementById("avvisi").innerHTML="<div class='alert alert-success'><h4><b>Grazie!</b> Testo Inserito correttamente!</h4></div>"
            setTimeout(function(){ location.href = "try.jsp"; },5000);
        }
    }    
}

function testo1(){


    if((errTitolo=="0") && (errArgomento="0")){

    var stringa = document.getElementById("testo").innerHTML;;
   
    
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var id=document.getElementById("cod").value;
    var a =1;
    var url="insertPage.jsp?";
    url=url+"titolo="+titolo+"&testo="+encodeURIComponent(stringa).replace(/'/g,"%27").replace(/"/g,"%22")+"&argomento="+arg+"&mod="+a+"&cod="+id;
     
    xmlhttp.onreadystatechange=testout;
    
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
    }else{
        document.getElementById("avvisi").innerHTML="<div class='alert alert-error'><h4><b>Attenzione!</b> Titolo e argomento sono errati o assenti!</h4></div>"
    }
}

function inviaMod(){
      var id;
     
      titolo1();
      testo1();
       
}

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
    
    document.getElementById("avvisi").innerHTML="<div class='alert alert-warning'><h4><b>Attenzione!</b> Far click sulle parti che si vogliono modificare!</h4></div>"
    document.getElementById("headings").className="headings";
    document.getElementById("testo").className="editable";
    document.getElementById("arg").innerHTML="<form name='scrivi'><div id='ak2' class='control-group '>"+
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
        "</div></form>";
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


    
out.print("<div id='avvisi'></div><br>");                   
out.print("<b><h2 id='headings'> " + titolo + "</h2></b><br>");
out.print("Autore : <b>" + autore + "</b><br>");
out.print("<div id='arg'>Argomento : <b>" + argomento + "</b></div><br><br>");
out.print("<div  id='testo' class=''> <br>" + testo+"</div>");
out.print("<input id='cod' type='hidden' value='"+id+"' >");

if(autore.equals(nome)){
   out.print("<b>Edit </b><a onclick='mod();' class='icon-edit'> </a>");
   out.print("<b>  Delete </b><a onclick='del();' class='icon-remove'></a>");
    out.print("<a class='btn btn-primary' onclick='inviaMod();' >Salva Modifiche</a>");
  
}

%>
<br><br>
   <a class="btn btn-primary" href="try.jsp?pag=home">< Indietro</a>
