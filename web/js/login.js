function login(){
    user = document.loginform.loginemail.value;
    pass = document.loginform.loginpass.value;
    
    xmlhttp = GetXmlHttpObject();
    if (xmlhttp == null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="login.jsp?";
    url = url + "u=" + user + "&p=" + pass;
    xmlhttp.onreadystatechange = navLogin;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function navLogin(){
    if (xmlhttp.readyState==4){
        var stringa = xmlhttp.responseText.trim();
        var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");
        if(stringa != ""){
            $('#myModal').modal('hide')
            document.getElementById("register").className = "hidden";
            document.getElementById("login").className = "hidden";
            document.getElementById("user").className = "";
            document.getElementById("logout").className = "";
            document.getElementById("userN").innerHTML = stringa;
        }else{
            document.getElementById("loginError").className = "alert alert-error";
        }
    }
}

function closePopError(){
    document.getElementById("loginError").className = "alert alert-error hidden";
}