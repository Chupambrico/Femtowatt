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
            document.getElementById("register").style.display = "block";
            document.getElementById("login").style.display = "block";
            document.getElementById("user").style.display = "none";
            document.getElementById("logout").style.display = "none";
        }
    }
}