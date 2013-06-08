var xmlhttpLogout;
function logout(){
    xmlhttpLogout = GetXmlHttpObject();
    if (xmlhttpLogout == null){
        alert ("Your browser does not support Ajax HTTP");
        return;
    }
    var url="logout.jsp";
    xmlhttpLogout.onreadystatechange = navLogout;
    xmlhttpLogout.open("GET",url,true);
    xmlhttpLogout.send(null);
}


function navLogout(){
    if (xmlhttpLogout.readyState==4){
        var stringa = xmlhttpLogout.responseText.trim();
        var Re = new RegExp("%0D%0A","g");
        stringa = stringa.replace(Re,"");
        if(stringa != ""){
            window.location.reload();
        }
    }
}