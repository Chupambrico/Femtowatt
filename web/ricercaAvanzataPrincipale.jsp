 <script language="javascript">
     var titolo="",arg="",utente="",errTitolo="0",errUtente="0";
     var val="";
     var i=0;


function nPaginaA(){
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="contaElementiA.jsp?";
    url=url+"titolo="+titolo+"&argomento="+arg+"&autore="+utente;
    xmlhttp.onreadystatechange=nPagineOutA;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function nPagineOutA(){
    if (xmlhttp.readyState==4){
        var selectPages="";
        var stringa= xmlhttp.responseText.trim();
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
    if (xmlhttp.readyState==4){
        var stringa= xmlhttp.responseText.trim();
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
    document.getElementById('t1').innerHTML = "Ricerca ...";
    document.getElementById('errore').className = "";
    document.getElementById('errore').innerHTML = "";
    document.getElementById('numeriPagine').innerHTML = "";
    if(errTitolo==0 && errUtente==0 ){
    cercaA(valore,0);}
}

function cercaA(valore,disabilitare){
   
    xmlhttp=GetXmlHttpObject();
    document.getElementById('rA').innerHTML = "<img src='img/ajax-loader.gif'/>";
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    if(disabilitare!=0){
        document.getElementById(disabilitare).className = "disabled";  
        document.getElementById(bottoneDisabled).className = ""; 
        bottoneDisabled=disabilitare;
    }
    var url="ricercaAvanzata.jsp?";
    url=url+"titolo="+titolo+"&nElementi="+valore+"&argomento="+arg+"&autore="+utente;
    xmlhttp.onreadystatechange=cercaOutA;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
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
 
 
 </script>
        <div id="inserito">
        <form name="ricerca"  >            
            <table border="0"  >
                <tr>

                    <td>
                        <div id="ak1" class="control-group ">
                            <label class="control-label"></label>
                            <div class="controls">
                                <div id="titoloEs" data-animation="true" data-title="Errore!" data-content="Numeri o caratteri speciali non ammessi.">
                                    <input type="text" name="titolo"  onChange="titolo1();"  placeholder="Titolo" class="input-xlarge">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                     <tr>

                    <td>
                        <div id="ak2" class="control-group ">
                            <label class="control-label"></label>
                            <div class="controls" >
                                    <select name="argomento" onchange="controlA();">
                                    <option value="0">---Segli Argomento---</option>
                                    <option value="Elettronica">Elettronica</option>
                                    <option value="Informatica">Informatica</option>
                                    <option value="Inglese">Inglese</option>
                                    <option value="Italiano">Italiano</option>
                                    <option value="Matematica">Matematica</option>
                                    <option value="Storia">Storia</option>
                                    <option value="Sistemi">Sistemi</option>
                                    <option value="Statistica">Statistica</option>
                                     </select>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                       <div id="ak3" class="control-group ">
                            <label class="control-label"></label>
                            <div class="controls">
                                <div id="utenteL" data-animation="true" data-title="Errore!" data-content="Numeri o caratteri speciali non ammessi.">
                                    <input type="text" name="utente"  onChange="utente1();"  placeholder="Nome autore" class="input-xlarge">
                                </div>
                            </div>
                        </div>
                   </td>
                </tr>
            </table>
            <input class="btn btn-success"  type="button" onclick="avvioA(10);" value="Cerca!"/>
        </form>
            <div id="rA"></div>
    </div>