<%
String[] codPag = new String[10];
codPag[0] = "home";
codPag[1] = "scrivipagina";
codPag[2] = "viewPage";
codPag[3] = "showPages";
codPag[4] = "administrator";
codPag[5] = "register";
codPag[6] = "listautenti";
codPag[7] = "listaarticoli";


String[] realPag = new String[10];

realPag[0] = "Home";
realPag[1] = "Scrivi il tuo articolo";
realPag[2] = "Articolo";
realPag[3] = "Articoli";
realPag[4] = "Amministrazione";
realPag[5] = "Registrazione";
realPag[6] = "Lista utenti";
realPag[7] = "Lista articoli";

for(int i = 0; i < realPag.length; i++){
   if(pagina.equals(codPag[i])){
       visualPagina = realPag[i];
       break;
   }
}
%>