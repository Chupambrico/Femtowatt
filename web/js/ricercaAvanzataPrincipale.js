var titolo="",arg="",utente="",errTitolo="0",errUtente="0";
var xmlhttpNPagA, xmlhttpCercaA;
var val="";
var i=0;

function nPaginaA(){
    xmlhttpNPagA=GetXmlHttpObject();
    if (xmlhttpNPagA==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="contaElementiA.jsp?";
    url=url+"titolo="+encodeURIComponent(titolo).replace(/'/g,"%27").replace(/"/g,"%22")+"&argomento="+encodeURIComponent(arg).replace(/'/g,"%27").replace(/"/g,"%22")+"&autore="+encodeURIComponent(utente).replace(/'/g,"%27").replace(/"/g,"%22");
    xmlhttpNPagA.onreadystatechange=nPagineOutA;
    xmlhttpNPagA.open("GET",url,true);
    xmlhttpNPagA.send(null);
}

function nPagineOutA(){
    if (xmlhttpNPagA.readyState==4){
        var selectPages="";
        var stringa= xmlhttpNPagA.responseText.trim();
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
              document.getElementById('errore').innerHTML = "<h4>Nessun risultato trovato!</h4>";
                document.getElementById('errore').className = "alert alert-error";  
            }
        }
    }
}

function cercaOutA(){
    document.getElementById("loadBar").style.width = (xmlhttpCercaA.readyState * 25) + "%";
    if (xmlhttpCercaA.readyState==4){
        setTimeout(function(){document.getElementById("r").innerHTML="";},1000);
        var stringa= xmlhttpCercaA.responseText.trim();
        /*var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");*/
        document.getElementById('rA').innerHTML = stringa;
        
        if(unaSola <= 2){
            unaSola = unaSola + 1;
        }
        nPaginaA();
    }
}

function avvioA(valore){
    unaSola=0;
    bottoneDisabled="1";
    document.getElementById('title').innerHTML = "Ricerca ...";
    document.getElementById('errore').className = "";
    document.getElementById('errore').innerHTML = "";
    document.getElementById('numeriPagine').innerHTML = "";
    if(errTitolo==0 && errUtente==0 ){
    cercaA(valore,0);}
}

function cercaA(valore,disabilitare){
   
    xmlhttpCercaA=GetXmlHttpObject();
    document.getElementById('r').innerHTML = "<div class=\"progress progress-striped active\"><div class=\"bar\" style=\"width: 0%;\" id=\"loadBar\"></div></div>";
    if (xmlhttpCercaA==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    if(disabilitare!=0){
        document.getElementById(disabilitare).className = "disabled";  
        document.getElementById(bottoneDisabled).className = ""; 
        bottoneDisabled=disabilitare;
    }
    var url="ricercaAvanzata.jsp?";
    url=url+"titolo="+encodeURIComponent(titolo).replace(/'/g,"%27").replace(/"/g,"%22")+"&nElementi="+valore+"&argomento="+encodeURIComponent(arg).replace(/'/g,"%27").replace(/"/g,"%22")+"&autore="+encodeURIComponent(utente).replace(/'/g,"%27").replace(/"/g,"%22");
    xmlhttpCercaA.onreadystatechange=cercaOutA;
    xmlhttpCercaA.open("GET",url,true);
    xmlhttpCercaA.send(null);
}    

//-----------------------------------------------------------------
 function titolo1(){
    var stringa = document.ricerca.titolo.value;
    if(stringa==""){
       titolo=stringa;
       document.getElementById("ak1").className="control-group success";
       errTitolo="0"; 
    }else{
    var regexp =/^[a-zA-Z0-9\s]/;

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
}
    
function controlA(){
    var stringa = document.ricerca.argomento.value;
   if(stringa!="0"){
        arg=stringa;
        document.getElementById("ak2").className="control-group success";
     
   }else{arg="";}
}
 
 function utente1(){
     
    var stringa = document.ricerca.utente.value;
    
   if(stringa==""){
           utente=stringa;
       document.getElementById("ak3").className="control-group success";
       errUtente="0"; 
    }else{
    var regexp =/^[a-zA-Z0-9\s]/;

    if (regexp.test(stringa) == false){
        document.getElementById("ak3").className="control-group error";
        $('#utenteL').popover('show');
        setTimeout(function() {$('#utenteL').popover('hide');},3000);
        errUtente="1";
    }else{
        utente=stringa;
        document.getElementById("ak3").className="control-group success";
        errUtente="0";
    }
    
   }
} 