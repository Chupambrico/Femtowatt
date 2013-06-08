var i=0;
var xmlhttpUt, xmlhttpFin;
var errNome,errCognome,errUtente,errPassword,errConfermaPassword,errEmail,errData;

function getOutput(){
    if (xmlhttpUt.readyState==4){
        var stringa= xmlhttpUt.responseText.trim();

        var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");
        var stringa2="true";
        if(stringa==stringa2){
            document.getElementById("ak5").className="control-group error";
            $('#utenteEs').popover('show');
            setTimeout(function() {$('#utenteEs').popover('hide');},3000);
            errUtente="1";
        }else{
            document.getElementById("ak5").className="control-group success";
            errUtente="0";}
    }
}

function nome1(){
    var stringa = document.modulo_form.nome.value;
    var regexp = /^[a-zA-Z]+$/;

    if (regexp.test(stringa) == false){
        document.getElementById("ak1").className="control-group error";
        $('#nomeEs').popover('show');
        setTimeout(function() {$('#nomeEs').popover('hide');},3000);
        errNome="1";
    }else{
        document.getElementById("ak1").className="control-group success";
        errNome=0;
    }
}

function cognome1(){
    var stringa = document.modulo_form.cognome.value;
    var regexp = /^[a-zA-Z]+$/;

    if (regexp.test(stringa) == false){
        document.getElementById("ak2").className="control-group error";
        $('#cognomeEs').popover('show');
        setTimeout(function() {$('#cognomeEs').popover('hide');},3000);
        errCognome="1";
    }else{
        document.getElementById("ak2").className="control-group success";
        errCognome="0";
    }
}

//Problem!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! on date!
function data1(){
    var stringa = document.modulo_form.dataDiN.value;
    var regexp = /^(([0-2][1-9])|([3][0-1]))\/(([0][1-9])|([1][0-2]))\/[0-9][0-9][0-9][0-9]$/;
    if(regexp.test(stringa) == false){
        document.getElementById("ak3").className="control-group error";
        $('#dataEs').popover('show');
        setTimeout(function() {$('#dataEs').popover('hide');},3000);
        errData = "1";
    }else{
       document.getElementById("ak3").className="control-group success";
       errData = "0";
    }
}

function utente1(){
    xmlhttpUt=GetXmlHttpObject();

    if (xmlhttpUt==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var str = document.modulo_form.utente.value;
    if(str==""){
        document.getElementById("ak5").className="control-group error";
        $('#utenteEs').popover('show');
        setTimeout(function() {$('#utenteEs').popover('hide');},3000);
    }else{
        var url="checkUser.jsp";
        url=url+"?alfa="+str;

        xmlhttpUt.onreadystatechange=getOutput;
        xmlhttpUt.open("GET",url,true);
        xmlhttpUt.send(null);
    }
}

function email1(){
    var stringa = document.modulo_form.email.value;
    var regexp = /^[a-zA-Z0-9]+\@[a-zA-Z]+\.[a-z]+$/;
    if(regexp.test(stringa) == false){
        document.getElementById("ak4").className="control-group error";
        $('#emailEs').popover('show');
        setTimeout(function() {$('#emailEs').popover('hide');},3000);
        errEmail = "1";
    }else{
        document.getElementById("ak4").className="control-group success";
        errEmail = "0";
    }
}

function password1(){
    var stringa = document.modulo_form.password.value;
    var regexp = /^[a-zA-Z0-9]+$/;
    if (regexp.test(stringa) == false){
        document.getElementById("ak6").className="control-group error";
        $('#passwordEs').popover('show');
        setTimeout(function() {$('#passwordEs').popover('hide');},3000);
        errPassword="1";
    }else{
        document.getElementById("ak6").className="control-group success";
        errPassword="0";
    }
}

function confermaPassword1(){
    var stringa = document.modulo_form.password.value;
    var stringa2=document.modulo_form.confermaPassword.value;

    if (stringa!=stringa2 || stringa==""){
        document.getElementById("ak7").className="control-group error";
        $('#confPassEs').popover('show');
        setTimeout(function() {$('#confPassEs').popover('hide');},3000);
        errConfermaPassword="1";
    }else{
        document.getElementById("ak7").className="control-group success";
        errConfermaPassword="0";
    }
}

function finale(){  
    var xmlhttpFin=GetXmlHttpObject();
    if (xmlhttpFin==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    var errore1="";   
    var nome = document.modulo_form.nome.value; 
    var cognome = document.modulo_form.cognome.value; 
    var dataDiN = document.modulo_form.dataDiN.value; 
    var utente = document.modulo_form.utente.value; 
    var password = document.modulo_form.password.value; 
    var confermaPassword = document.modulo_form.confermaPassword.value; 
    var email = document.modulo_form.email.value; 

    if(nome==""){
        errore1="1";
    }
    if(cognome==""){
        errore1="1";
    }
    if(utente==""){
        errore1="1";
    }
    if(password==""){
        errore1="1";
    }
    if(confermaPassword==""){
        errore1="1";
    }

    if(errore1==""){
        if(errNome == "0" || errCongome == "0" || errData == "0" || errUtente == "0" || errEmail == "0" || errPassword == "0" || errConfermaPassword == "0"){
           password= hex_md5(password);

            var url="registra.jsp";
           var  param= "nome="+nome+"&cognome="+cognome+"&dataDiN="+dataDiN+"&utente="+utente+"&password="+password+"&email="+email;

           xmlhttpFin.open("POST",url,true);
           xmlhttpFin.setRequestHeader("Content-type","application/x-www-form-urlencoded");
           xmlhttpFin.send(param); 

            document.getElementById("errore").innerHTML="<div class='alert alert-succes'><h4><b>Good!</b> Registrazione Effettuata!</h4></div>"
            setTimeout(function  a(){location.href="index.jsp";},3000);
        }
    }
}

function reset(){   
    document.getElementById("ak1").className="control-group";
    document.getElementById("ak2").className="control-group";
    document.getElementById("ak3").className="control-group";
    document.getElementById("ak4").className="control-group";
    document.getElementById("ak5").className="control-group"; 
    document.getElementById("ak6").className="control-group";
    document.getElementById("ak7").className="control-group";  
}