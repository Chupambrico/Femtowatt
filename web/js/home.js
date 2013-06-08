var xmlhttpAnte;
function anteprimaOut(){
    document.getElementById("loadBar").style.width = (xmlhttpAnte.readyState * 25) + "%";
    if (xmlhttpAnte.readyState==4){
        setTimeout(function(){document.getElementById("r").innerHTML="";},1000);
        var stringa = xmlhttpAnte.responseText.trim();
        document.getElementById("lista").innerHTML=stringa;
    }
}

function anteprima(){
    document.getElementById("r").innerHTML="<div class=\"progress progress-striped active\"><div class=\"bar\" style=\"width: 0%;\" id=\"loadBar\"></div></div>";
    xmlhttpAnte=GetXmlHttpObject();
    if (xmlhttpAnte==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    var url="top10.jsp";

    xmlhttpAnte.onreadystatechange=anteprimaOut;
    xmlhttpAnte.open("GET",url,true);
    xmlhttpAnte.send(null);
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