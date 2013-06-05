<%
String[] codPag = new String[100];
codPag[0] = "home";
codPag[1] = "scrivipagina";
codPag[2] = "viewPage";
codPag[3] = "showPages";
codPag[4] = "administrator";
codPag[5] = "register";
codPag[6] = "listautenti";
codPag[7] = "listaarticoli";
codPag[8] = "ricercaAvanzataPrincipale";
codPag[9] = "profile";
codPag[10] = "listaarticoliutente";


String[] realPag = new String[100];

realPag[0] = "Home";
realPag[1] = "Scrivi il tuo articolo";
realPag[2] = "Articolo";
realPag[3] = "Articoli";
realPag[4] = "Amministrazione";
realPag[5] = "Registrazione";
realPag[6] = "Lista utenti";
realPag[7] = "Lista articoli";
realPag[8] = "Ricerca avanzata";
realPag[9] = "Profilo";
realPag[10] = "Lista articoli utente";

for(int i = 0; i < realPag.length; i++){
   if(pagina.equals(codPag[i])){
       visualPagina = realPag[i];
       break;
   }
}
%>