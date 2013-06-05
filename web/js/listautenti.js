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
    
    url="banna.jsp?";
    url=url+valori;
    
    xmlhttp.onreadystatechange = reloadOnState4;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
    
    var valori="",stato="",valore="";

    for(var i = 1; i <= tot; i++){
        valore=document.getElementById("lvl" + i).value;
        if(valori == ""){
            valori=document.getElementById("lvl" + i).name+"="+valore;
        }else{
            valori=valori +"&"+document.getElementById("lvl" + i).name+"="+valore;
        }
    }
    
    xmlhttp2=GetXmlHttpObject();
    if (xmlhttp2==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    
    url="livello.jsp?";
    url=url+valori;
    
    xmlhttp2.onreadystatechange = reloadOnState4;
    xmlhttp2.open("GET",url,true);
    xmlhttp2.send(null);
}

function reloadOnState4(){
    if ((xmlhttp.readyState==4)&&(xmlhttp2.readyState==4)){
        window.location.reload();
    }
}

function ban(id){
    if(document.getElementById(id).className == "btn"){
    document.getElementById(id).className = "btn btn-danger active";
    }else{
    document.getElementById(id).className = "btn";
    }
}
window.onload=function a() { document.getElementById("l2").className="active";  
    document.getElementById("l1").className="";
    document.getElementById("l3").className="";}