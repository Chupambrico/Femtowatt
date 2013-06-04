function inviaRisultati(){
    var tot =document.getElementById("i").value;
    var valori="",stato="",valore="";

    for(var i = 1; i <= tot; i++){
        stato=document.getElementById(i).className;
        if(stato=="btn"){
            valore="off";
        }else{
            valore="on";
        }
        if(valori == ""){
            valori=document.getElementById(i).value+"="+valore;
        }else{
            valori=valori +"&"+document.getElementById(i).value+"="+valore;
        }
    }

    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    var url="convalida.jsp?";
    url=url+valori;
    
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
    
    valori="";
    stato="";
    valore="";
    for(var i = 1; i <= tot; i++){
        stato=document.getElementById(i+"d").className;
        if(stato!="btn"){
            valore="on";
            if(valori == ""){
                valori=document.getElementById(i).value+"="+valore;
            }else{
                valori=valori +"&"+document.getElementById(i).value+"="+valore;
            }
        }
    }
    
    xmlhttp2=GetXmlHttpObject();
    if (xmlhttp2==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    
    url="elimina.jsp?";
    url=url+valori;

    xmlhttp2.open("GET",url,true);
    xmlhttp2.send(null);
}

function toggle(id){
    document.getElementById(-id).className = "btn";
    if(id > 0){
        document.getElementById(id).className = "btn btn-success active";
    }else{
        document.getElementById(id).className = "btn btn-danger active";
    }
}

function del(id){
    if(document.getElementById(id).className == "btn"){
    document.getElementById(id).className = "btn btn-danger active";
    }else{
    document.getElementById(id).className = "btn";
    }
}