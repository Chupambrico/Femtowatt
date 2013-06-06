function login(){
    user = document.loginform.loginemail.value;
    pass = document.loginform.loginpass.value;
    
    xmlhttp = GetXmlHttpObject();
    if (xmlhttp == null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="login.jsp?";
   pass= hex_md5(pass);
   // document.write(pass);
    url = url + "u=" + user + "&p=" + pass;
    xmlhttp.onreadystatechange = navLogin;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function navLogin(){
    if (xmlhttp.readyState==4){
        var stringa = xmlhttp.responseText.trim();
        if(stringa == ""){
            $('#myModal').modal('hide')
            window.location.reload();
        }else{
            document.getElementById("loginError").className = "alert alert-error";
            document.getElementById("errorMessage").innerHTML = stringa;
        }
    }
}