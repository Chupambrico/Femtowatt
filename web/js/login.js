var xmlhttpLogin;
function login(){
    user = document.loginform.loginemail.value;
    pass = document.loginform.loginpass.value;
    
    xmlhttpLogin = GetXmlHttpObject();
    if (xmlhttpLogin == null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="login.jsp?";
    pass= hex_md5(pass);
    //document.write(pass);
    url = url + "u=" + user + "&p=" + pass;
    xmlhttpLogin.onreadystatechange = navLogin;
    xmlhttpLogin.open("GET",url,true);
    xmlhttpLogin.send(null);
}

function navLogin(){
    if (xmlhttpLogin.readyState==4){
        var stringa = xmlhttpLogin.responseText.trim();
        if(stringa == ""){
            $('#myModal').modal('hide')
            window.location.reload();
        }else{
            document.getElementById("loginError").className = "alert alert-error";
            document.getElementById("errorMessage").innerHTML = stringa;
        }
    }
}