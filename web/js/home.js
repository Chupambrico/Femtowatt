function anteprimaOut(){
    if (xmlhttp.readyState==4){
        var stringa = xmlhttp.responseText.trim();
        document.getElementById("lista").innerHTML=stringa; 
        lista();
    }
}

function anteprima(){
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    var url="top10.jsp";
    url=url;

    xmlhttp.onreadystatechange=anteprimaOut;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}
    
function search1(){
    var stringa=document.cerca.cerc.value;
    var regexp =/^[a-zA-Z0-9\s]+$/;

    if (regexp.test(stringa) == false){
        document.getElementById("s1").className="control-group error";
        errS=1;
    }else{
        titolo=stringa;
        document.getElementById("s1").className="control-group success";
        errS=0;
    }
}