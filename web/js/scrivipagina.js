var errTitolo="1";
var titolo="";
var errAngomento="1";
var arg="";

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
