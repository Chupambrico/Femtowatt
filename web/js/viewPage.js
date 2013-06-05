var errTitolo="1";
var titolo="";
var errAngomento="1";
var arg="";

function titolo1(){
    var stringa = document.getElementById("headings").innerHTML;;

    var regexp =/^[a-zA-Z0-9\s]+$/;

    if (regexp.test(stringa) == false){
          document.getElementById("avvisi").innerHTML="<div class='alert alert-error'><h4><b>Attenzione!</b>Titolo non corrtetto!</h4></div>";
      
        errTitolo="1";
    }else{
        titolo=stringa;
        errTitolo="0";
    }
  return;
}
    
function controlA(){
    var stringa = document.getElementById("argomento").value;
    if (stringa=="0"){
        document.getElementById("ak2").className="control-group error";
        errArgomento="1";
    }else{
        arg=stringa;
        document.getElementById("ak2").className="control-group success";
        errArgomento="0";
    }
    
}

function testout(){
    if (xmlhttp.readyState==4){
        var stringa= xmlhttp.responseText.trim();
        var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");
        
        if(stringa=="1" || stringa=="2"){
            document.getElementById("avvisi").innerHTML="<div class='alert alert-error'><h4><b>Attenzione!</b> Testo inferiore ai 100 caratteri!</h4></div>";
        }else{
            document.getElementById("avvisi").innerHTML="";
            document.getElementById("avvisi").innerHTML="<div class='alert alert-success'><h4><b>Grazie!</b> Testo Inserito correttamente!</h4></div>";
            setTimeout(function(){ location.href = "index.jsp"; },5000);
        }
    }    
}

function testo1(){


    if((errTitolo=="0") && (errArgomento="0")){

    var stringa = document.getElementById("testo").innerHTML;;
   
    
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var id=document.getElementById("cod").value;
    var a =1;
    var url="insertPage.jsp";
    var param = "titolo="+titolo+"&testo="+encodeURIComponent(stringa).replace(/'/g,"%27").replace(/"/g,"%22")+"&argomento="+arg+"&mod="+a+"&cod="+id;
     
    xmlhttp.onreadystatechange=testout;
    
    xmlhttp.open("POST",url,true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.send(param);
    }else{
        document.getElementById("avvisi").innerHTML="<div class='alert alert-error'><h4><b>Attenzione!</b> Titolo e argomento sono errati o assenti!</h4></div>"
    }
}

function inviaMod(){
    var id;
    titolo1();
    controlA();
    testo1();
}

function b(){
    document.getElementById("content").innerHTML = "Sei sicuro di voler eliminare l'articolo?";
    document.getElementById("confirmButton").onclick = del;
    $('#confirmModal').modal('show');
}

function del(){
    $('#confirmModal').modal('hide');
    var id=0;
    id=document.getElementById("cod").value;
    
    xmlhttp=GetXmlHttpObject();
    if (xmlhttp==null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }

    var url="deletePage.jsp?";
    url=url+"cod="+id;

    xmlhttp.onreadystatechange=home;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function home(){
    if (xmlhttp.readyState==4){
        location.href = "index.jsp";
    }
}

function a(){
    document.getElementById("content").innerHTML = "Modificando il testo esso dovrà essere riconfermato, e non apparirà fino ad allora nelle ricerche né potrà essere visualizzato.";
    document.getElementById("confirmButton").onclick = mod;
    $('#confirmModal').modal('show');
}

function mod(){
    $('#confirmModal').modal('hide');
    document.getElementById("modEl").className="hidden";
    document.getElementById("bottone").innerHTML="<a class='btn btn-primary' onclick='inviaMod();' >Salva Modifiche</a>";
    document.getElementById("avvisi").innerHTML="<div class='alert alert-warning'><h4><b>Attenzione!</b> Far click sulle parti che si vogliono modificare!</h4></div>";
    document.getElementById("headings").className="headings";
    document.getElementById("testo").className="editable";
    var s1, s2, s3, s4, s5, s6, s7, s8;
    var ar = document.getElementById("a").innerHTML;
    switch(ar){
        case "Elettronica":
            s1 = " selected";
            break;
        case "Informatica":
            s2 = " selected";
            break;
        case "Inglese":
            s3 = " selected";
            break;
        case "Italiano":
            s4 = " selected";
            break;
        case "Matematica":
            s5 = " selected";
            break;
        case "Storia":
            s6 = " selected";
            break;
        case "Sistemi":
            s7 = " selected";
            break;
        case "Stetistica":
            s8 = " selected";
            break;
    }
    document.getElementById("arg").innerHTML="<div id='ak2' class='control-group '>"+
        "<label class='control-label'></label>"+
        "<div class='controls' >"+
        "<select id='argomento' onchange='controlA();'>"+
        "<option value='0'>---Segli Argomento---</option>"+
        "<option value='Elettronica'" + s1 + ">Elettronica</option>"+
        "<option value='Informatica'" + s2 + ">Informatica</option>"+
        "<option value='Inglese'" + s3 + ">Inglese</option>"+
        "<option value='Italiano'" + s4 + ">Italiano</option>"+
        "<option value='Matematica'" + s5 + ">Matematica</option>"+
        "<option value='Storia'" + s6 + ">Storia</option>"+
        "<option value='Sistemi'" + s7 + ">Sistemi</option>"+
        "<option value='Statistica'" + s8 + ">Statistica</option>"+
        "</select>"+
        "</div>"+
        "</div>"+
        "</div>";
    tinymce.init({
        selector: "h2.headings",
        inline: true,
        toolbar: "undo redo",
        menubar: false
    });

    tinymce.init({
        selector: "div.editable",
        inline: true,
        theme: "modern",
        language : 'it',
        entity_encoding : "raw",
        forced_root_block: false,
        force_p_newlines : true,
        force_br_newlines: false,
        plugins: [
            "advlist anchor autolink charmap code contextmenu",
            "emoticons fullscreen hr image insertdatetime",
            "link media nonbreaking paste preview print",
            "searchreplace table textcolor visualblocks visualchars wordcount"
            ],
        content_css: "css/content.css",
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | nonbreaking link image | print preview media fullpage | forecolor backcolor emoticons"
    });
}