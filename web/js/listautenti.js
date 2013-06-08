var xmlhttpInviaU, xmlhttpInviaU2;
function inviaRisultati(){
    var tot =document.getElementById("i").value;
    var valori="",stato="",valore="";

    for(var i = 1; i <= tot; i++){
        valore=document.getElementById("lvl" + i).value;
        if(valori == ""){
            valori=document.getElementById("lvl" + i).name+"="+valore;
        }else{
            valori=valori +"&"+document.getElementById("lvl" + i).name+"="+valore;
        }
    }
    
    xmlhttpInviaU=GetXmlHttpObject();
    if (xmlhttpInviaU==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    
    url="livello.jsp?";
    url=url+valori;
    
    xmlhttpInviaU.onreadystatechange = reloadOnState4;
    xmlhttpInviaU.open("GET",url,true);
    xmlhttpInviaU.send(null);
    
    valori="";
    stato="";
    valore="";
    for(var i = 1; i <= tot; i++){
        stato=document.getElementById(i).className;
        if(stato!="btn"){
            valore="on";
            if(valori == ""){
                valori=document.getElementById(i).value+"="+valore;
            }else{
                valori=valori +"&"+document.getElementById(i).value+"="+valore;
            }
        }
    }
    
    xmlhttpInviaU2=GetXmlHttpObject();
    if (xmlhttpInviaU2==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    
    url="eliminaUtente.jsp?";
    url=url+valori;
    
    xmlhttpInviaU2.onreadystatechange = reloadOnState4;
    xmlhttpInviaU2.open("GET",url,true);
    xmlhttpInviaU2.send(null);
}

function reloadOnState4(){
    if ((xmlhttpInviaU.readyState==4)&&(xmlhttpInviaU2.readyState==4)){
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