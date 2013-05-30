<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<script type="text/javascript" src="js/nicEdit.js"></script>

<script type="text/javascript">
    bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>

 <script language="javascript">
     var errTitolo="1";
     var titolo="";
     
      function preview(){
          
     
    
   
       var stringa = nicEditors.findEditor('area2').getContent();
         
       
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


    

    var stringa = nicEditors.findEditor('area2').getContent();
    
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    
    var url="insertPage.jsp?";
    url=url+"titolo="+titolo+"&testo="+stringa;
    xmlhttp.onreadystatechange=testout;
    
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
   
 }

</script>

<%
/*if(request.isRequestedSessionIdValid()){
    response.sendError(response.SC_UNAUTHORIZED,"Devi fare il login");
}else{out.print("Domani");}*/


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
