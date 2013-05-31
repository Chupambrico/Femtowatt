function inviaRisultati(){
    var tot =document.getElementById("i").value;
    var valori="",stato="",valore="";

    stato=document.getElementById("1").className;
    if(stato=="btn btn-inverse"){
        valore="off";
    }else{
        valore="on";
    }
    valori=document.getElementById("1").value+"="+valore;

    for(var i = 2; i <= tot; i++){
        stato=document.getElementById(i).className;
        if(stato=="btn btn-inverse"){
            valore="off";
        }else{
            valore="on";
        }
        valori=valori +"&"+document.getElementById(i).value+"="+valore;
    }

    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    var url="convalida.jsp?";
    url=url+valori;

    xmlhttp.onreadystatechange=anteprimaOut;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function toggle(id){
    document.getElementById(-id).className = "btn btn-inverse";
    if(id > 0){
        document.getElementById(id).className = "btn btn-success active";
    }else{
        document.getElementById(id).className = "btn btn-danger active";
    }
}