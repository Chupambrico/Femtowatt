<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
 <script src="js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
 tinymce.init({
                  selector: "textarea",
                  theme: "modern",
                  language : 'it',
                  resize : false,
                  plugins: [
                            
                            "directionality emoticons example example_dependency fullpage fullscreen hr image insertdatetime layer",
                            "legacyoutput link lists media nonbreaking noneditable pagebreak paste preview print",
                            "save searchreplace spellchecker tabfocus table template textcolor visualblocks visualchars wordcount"
                            ],
                 content_css: "css/content.css",
                 toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons", 
                });
                </script>


 <script language="javascript">
     
     var errTitolo="1";
     var titolo="";
     var errAngomento="1";
     var arg="";
     
    

      function preview(){
             var stringa = tinyMCE.activeEditor.getContent();  
             document.getElementById("preview2").innerHTML=stringa;
       
    }
    
    function titolo1(){
        
        var stringa = document.scrivi.titolo.value;
       
        var regexp =/^[a-zA-Z0-9\s]+$/;

        if (regexp.test(stringa) == false){
            document.getElementById("ak1").className="control-group error";
            $('#titoloEs').popover('show');
            setTimeout(function() {$('#titoloEs').popover('hide');},3000);
            errTitolo="1";
        }else{
            titolo=stringa;
            document.getElementById("ak1").className="control-group success";
            errTitolo="0";
        }
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

       
    
function GetXmlHttpObject(){
    if (window.XMLHttpRequest){
        return new XMLHttpRequest();
    }
    if (window.ActiveXObject){
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    return null;
}

  function testout(){
     
    if (xmlhttp.readyState==4){
        var stringa= xmlhttp.responseText.trim();
        var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");
       
        if(stringa=="1" || stringa=="2"){
          
            document.getElementById("errore").innerHTML="<div class='alert alert-error'><h4><b>Attenzione!</b> Testo inferiore ai 100 caratteri!</h4></div>"
        }else{
                document.getElementById("errore").innerHTML=""
                document.getElementById("errore").innerHTML="<div class='alert alert-success'><h4><b>Grazie!</b> Testo Inserito correttamente!</h4></div>"
                setTimeout(function(){ location.href = "try.jsp"; },5000);
        }
        
    }
     
        
    }


function testo1(){


    if((errTitolo=="0") && (errArgomento="0")){

    var stringa = tinyMCE.activeEditor.getContent();
   
    
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    
    var url="insertPage.jsp?";
    url=url+"titolo="+titolo+"&testo="+stringa+"&argomento="+arg;
     
    xmlhttp.onreadystatechange=testout;
    
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
    }else{
        document.getElementById("errore").innerHTML="<div class='alert alert-error'><h4><b>Attenzione!</b> Titolo e argomento sono errati o assenti!</h4></div>"
    }
 }

</script>

<%
if(session.getAttribute("idSession") == null){
    out.print("Per poter scrivere un nuovo articolo devi effettuare il login");
}else{

        %>
       <div id="preview2"></div>
        <div id="inserito">
        <form name="scrivi" width="100%" >            
            <table border="0" width="100%" >
                <tr>
                  
                    <td>
                        <div id="ak1" class="control-group ">
                            <label class="control-label"></label>
                            <div class="controls">
                                <div id="titoloEs" data-animation="true" data-title="Errore!" data-content="Numeri o caratteri speciali non ammessi.">
                                    <input type="text" name="titolo"  onChange="titolo1();"  placeholder="Titolo" class="input-xlarge">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                     <tr>
                  
                    <td>
                        <div id="ak2" class="control-group ">
                            <label class="control-label"></label>
                            <div class="controls" >
                                    <select name="argomento" onchange="controlA();">
                                    <option value="0">---Segli Argomento---</option>
                                    <option value="Elettronica">Elettronica</option>
                                    <option value="Informatica">Informatica</option>
                                    <option value="Inglese">Inglese</option>
                                    <option value="Italiano">Italiano</option>
                                    <option value="Matematica">Matematica</option>
                                    <option value="Storia">Storia</option>
                                    <option value="Sistemi">Sistemi</option>
                                    <option value="Statistica">Statistica</option>
                                     </select>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    
                    <td>
                        
                        
                                <div id="testoEs" data-animation="true" data-title="Errore!" data-content="Testo mancante o minore di 100 caratteri.">   
                        <textarea   style="width: 100%;" id="area2" type="text" cols="100" rows="20" name="testo"></textarea>
                         </div>
                   
                           
                       
                   </td>
                </tr>
            </table>
            <input class="btn btn-success"  type="button" onclick="testo1();" value="Invia!"/>
           <input type="button" class="btn btn-warning" value="Preview" onclick="preview();"  >

        </form>
       </div>
<%}%>
