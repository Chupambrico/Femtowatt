function logout(){
    xmlhttp = GetXmlHttpObject();
    if (xmlhttp == null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="logout.jsp";
    xmlhttp.onreadystatechange = navLogout;
    xmlhttp.open("GET",url,true);
    xmlhttp.send(null);
}

function navLogout(){
    if (xmlhttp.readyState==4){
        var stringa = xmlhttp.responseText.trim();
        var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");
        if(stringa != ""){
            document.getElementById("userN").innerHTML = "";
            document.getElementById("register").className = "";
            document.getElementById("login").className = "";
            document.getElementById("user").className = "hidden";
            document.getElementById("logout").className = "hidden";
        }
    }
}