function anteprimaOut(){
    document.getElementById("loadBar").style.width = (xmlhttp.readyState * 25) + "%";
    if (xmlhttp.readyState==4){
        setTimeout(function(){document.getElementById("r").innerHTML="";},1000);
        var stringa = xmlhttp.responseText.trim();
        document.getElementById("lista").innerHTML=stringa;
        lista();
    }
}

function anteprima(){
    document.getElementById("r").innerHTML="<div class=\"progress progress-striped active\"><div class=\"bar\" style=\"width: 0%;\" id=\"loadBar\"></div></div>";
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    var url="top10.jsp";

    xmlhttp.onreadystatechange=anteprimaOut;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}
    
function search1(){
    var stringa=document.cerca.cerc.value;
    var regexp =/^[a-zA-Z0-9 '\\ \s]+$/;

    if (regexp.test(stringa) == false){
        document.getElementById("errore").innerHTML="Caratteri non Ammessi o casella vuota!";
        errS=1;
    }else{
        titolo=stringa;
       
        errS=0;
    }
}