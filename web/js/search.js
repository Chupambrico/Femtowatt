var i=0;
var xmlhttpNPag, xmlhttpCerca, xmlhttpLista;
var nPagine;
var nomeSpecial,bottoneDisabled;
var unaSola,pagina,errS;

function nPagina(){
    xmlhttpNPag=GetXmlHttpObject();
    if (xmlhttpNPag==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="contaElementi.jsp";
    url=url+"?alfa="+encodeURIComponent(nomeSpecial).replace(/'/g,"%27").replace(/"/g,"%22");
    xmlhttpNPag.onreadystatechange=nPagineOut;
    xmlhttpNPag.open("GET",url,true);
    xmlhttpNPag.send(null);
}

function nPagineOut(){
    if (xmlhttpNPag.readyState==4){
        var selectPages="";
        var stringa= xmlhttpNPag.responseText.trim();
        var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");
        nPagine=stringa;
        if((unaSola==1)){
            if(nPagine!=0){
                if(nPagine!=1){
                    for(var i=1;i<=nPagine;i++){
                        if(i==1){
                            selectPages=selectPages+"<li id="+i+"  class='disabled' ><a   onclick='cerca1("+i*10+","+i+");'>"+i+"</a></li>";
                        }else{
                            selectPages=selectPages+"<li id="+i+" class='' ><a  onclick='cerca1("+i*10+","+i+");'>"+i+"</a></li>";}
                        }
                        document.getElementById('numeriPagine').innerHTML = selectPages; 
                    }else{
                        document.getElementById('numeriPagine').innerHTML = "";
                }     
            }else{
                document.getElementById('errore').innerHTML = "<h4>Nessun risultato trovato con : &nbsp&nbsp<b><i>"+nomeSpecial+"</i></b></h4>";
                document.getElementById('errore').className = "alert alert-error";
            }
        }
    }
}

function cercaOut(){
    document.getElementById("loadBar").style.width = (xmlhttpCerca.readyState * 25) + "%";
    if (xmlhttpCerca.readyState==4){
        setTimeout(function(){document.getElementById("r").innerHTML="";},750);
        var stringa= xmlhttpCerca.responseText.trim();
        /*var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");*/
        document.getElementById('lista').innerHTML = stringa;
        if(unaSola <= 2){
            unaSola = unaSola + 1;
        }
        nPagina(unaSola);
    }
}

function avvio(valore){
    unaSola=0;
    bottoneDisabled="1";
    nomeSpecial = document.cerca.cerc.value;
    document.getElementById('errore').className = "";
    document.getElementById('errore').innerHTML = "";
    document.getElementById('numeriPagine').innerHTML = "";
    document.getElementById('title').innerHTML = "Ricerca";
    cerca1(valore,0);
}

function cerca1(valore,disabilitare){
    xmlhttpCerca=GetXmlHttpObject();
    document.getElementById('r').innerHTML = "<div class=\"progress progress-striped active\"><div class=\"bar\" style=\"width: 0%;\" id=\"loadBar\"></div></div>";
    if (xmlhttpCerca==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    if(disabilitare!=0){
        document.getElementById(disabilitare).className = "disabled";  
        document.getElementById(bottoneDisabled).className = ""; 
        bottoneDisabled=disabilitare;
    }
    var url="like.jsp?";
    url=url+"alfa="+encodeURIComponent(nomeSpecial).replace(/'/g,"%27").replace(/"/g,"%22")+"&nElementi="+valore;
    xmlhttpCerca.onreadystatechange=cercaOut;
    xmlhttpCerca.open("GET",url,true);
    xmlhttpCerca.send(null);
}
//-------------End--Cerca-------------------//
//-------------Lista------------------------//

function risultato(){
    if (xmlhttpLista.readyState==4){
        var stringa= xmlhttpLista.responseText.trim();
        var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");
        var n=stringa.split("/");
        $('#search').typeahead({source: n});
    }
}

function lista(){
    xmlhttpLista=GetXmlHttpObject();
    if (xmlhttpLista==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="tutto.jsp";
    url=url;
    xmlhttpLista.onreadystatechange=risultato;
    xmlhttpLista.open("GET",url,true);
    xmlhttpLista.send(null);
}
//-------------END--Lista------------------------//     

function GetXmlHttpObject(){
    if (window.XMLHttpRequest){
        return new XMLHttpRequest();
    }
    if (window.ActiveXObject){
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    return null;
}