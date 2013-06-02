<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<script src="tinymce/tinymce.min.js"></script>
<script>
tinymce.init({
    selector: "textarea",
    theme: "modern",
	language : 'it',
	resize : false,
	plugins: [
		"advlist anchor autolink autosave bbcode charmap code contextmenu",
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
     
    function preview(){
        var stringa = document.scrivi.testo.value;
        document.getElementById("preview2").innerHTML=stringa;
    }
    
    function titolo1(){
        var stringa = document.scrivi.titolo.value;
        var regexp =/^[a-zA-Z0-9]+$/;

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

    function risultato(){
        if (xmlhttp.readyState==4){
            var stringa= xmlhttp.responseText.trim();
            var Re = new RegExp("%0D%0A","g");
            stringa = stringa.replace(Re,"");
            if(stringa==1 || stringa==2){
                setTimeout(function() {$('#testoEs').popover('hide');},3000); 
            }else{
                document.getElementById("tutto").innerHTML=""
                document.getElementById("tutto").innerHTML="<div class='alert alert-success'><h4><b>Grazie!</b> Testo Inserito correttamente!</h4></div>"
                setTimeout(function(){ location.href = "try.jsp"; },5000);
            }
        }
    }


    function testo1(){
        if(errTitolo!="1"){
            var stringa = document.scrivi.testo.value;
            xmlhttp=GetXmlHttpObject();
            if (xmlhttp==null){
                alert ("Your browser does not support Ajax HTTP");
                return;
            }
            var url = "insertPage.jsp";
            url = url + "&titolo=" + titolo + "&testo=" + stringa;
            xmlhttp.onreadystatechange=risultato;
            xmlhttp.open("GET",url,true);
            xmlhttp.send(null);
        }else{
            titolo1();
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
                                <input type="text" name="titolo" onChange="titolo1();" placeholder="Titolo" class="input-xlarge">
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="testoEs" data-animation="true" data-title="Errore!" data-content="Testo mancante o minore di 100 caratteri.">   
                        <textarea   style="width: 100%;" id="Area2" type="text" cols="100" rows="20" name="testo"></textarea>
                    </div>
                </td>
            </tr>
        </table>
        <input class="btn btn-success"  type="submit" name="invia" value="Invia!"/>
        <input type="button" class="btn btn-danger" value="Preview" onclick="preview();"  >
    </form>
</div>
<%
}
%>