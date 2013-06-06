<script src="js/ricercaAvanzataPrincipale.js"></script>
<div id="inserito">
    <form name="ricerca"  >            
        <table border="0"  >
            <tr>

                <td>
                    <div id="ak1" class="control-group ">
                        <label class="control-label"></label>
                        <div class="controls">
                            <div id="titoloEs" data-animation="true" data-title="Errore!" data-content="Numeri o caratteri speciali non ammessi.">
                                <input type="text" name="titolo"  onChange="titolo1();"  placeholder="Titolo" class="input-xlarge">
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
                 <tr>

                <td>
                    <div id="ak2" class="control-group ">
                        <label class="control-label"></label>
                        <div class="controls" >
                                <select name="argomento" onchange="controlA();">
                                <option value="0">---Segli Argomento---</option>
                                <option value="Elettronica">Elettronica</option>
                                <option value="Informatica">Informatica</option>
                                <option value="Inglese">Inglese</option>
                                <option value="Italiano">Italiano</option>
                                <option value="Matematica">Matematica</option>
                                <option value="Storia">Storia</option>
                                <option value="Sistemi">Sistemi</option>
                                <option value="Statistica">Statistica</option>
                                 </select>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                   <div id="ak3" class="control-group ">
                        <label class="control-label"></label>
                        <div class="controls">
                            <div id="utenteL" data-animation="true" data-title="Errore!" data-content="Numeri o caratteri speciali non ammessi.">
                                <input type="text" name="utente"  onChange="utente1();"  placeholder="Nome autore" class="input-xlarge">
                            </div>
                        </div>
                    </div>
               </td>
            </tr>
        </table>
        <input class="btn btn-success"  type="button" onclick="avvioA(10);" value="Cerca!"/>
    </form>
    <div id="rA"></div>
</div>