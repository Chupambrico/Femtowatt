var xmlhttpInviaA, xmlhttpInviaA2;
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

    xmlhttpInviaA=GetXmlHttpObject();
    if (xmlhttpInviaA==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    var url="convalida.jsp?";
    url=url+valori;
    
    xmlhttpInviaA.onreadystatechange = reloadOnState4;
    xmlhttpInviaA.open("GET",url,true);
    xmlhttpInviaA.send(null);
    
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
    
    xmlhttpInviaA2=GetXmlHttpObject();
    if (xmlhttpInviaA2==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    
    url="eliminaPagina.jsp?";
    url=url+valori;
    
    xmlhttpInviaA2.onreadystatechange = reloadOnState4;
    xmlhttpInviaA2.open("GET",url,true);
    xmlhttpInviaA2.send(null);
}

function reloadOnState4(){
    if ((xmlhttpInviaA.readyState==4)&&(xmlhttpInviaA2.readyState==4)){
        window.location.reload();
    }
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
window.onload=function a() { document.getElementById("l3").className="active";  
    document.getElementById("l1").className="";
    document.getElementById("l2").className="";}

