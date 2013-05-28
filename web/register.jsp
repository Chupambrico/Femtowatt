<script src="js/register.js"></script>

<div style="background-color: gainsboro; width:300px;  border-radius: 10px 10px  10px  10px ;  margin: 0 auto;" >
    <form name="modulo_form" >
        <div style="padding-left:5px; padding-top:5px; padding-bottom:10px;  " >
            <table border="0px">
                <tr>
                    <td>
                        <div id="ak1" class="control-group ">
                            <label class="control-label"></label>
                            <div class="controls">
                                <div id="nomeEs" data-animation="true" data-title="Errore!" data-content="Numeri o caratteri speciali non ammessi.">
                                    <input type="text" name="nome"  onChange="nome1();"  placeholder="Nome" class="input-xlarge">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="ak2" class="control-group">
                            <label class="control-label"></label>
                            <div class="controls">
                                <div id="cognomeEs" data-animation="true" data-title="Errore!" data-content="Numeri o caratteri speciali non ammessi.">
                                    <input type="text" name="cognome" onChange="cognome1();"  placeholder="Cognome" class="input-xlarge">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="ak3" class="control-group">
                            <label class="control-label"></label>
                            <div class="controls">
                                <div id="dataEs" data-animation="true" data-title="Errore!" data-content="Data non nel formato corretto.">
                                    <input type="text" name="dataDiN" onChange="data1();" placeholder="Data di nascita" class="input-xlarge">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="ak4" class="control-group">
                            <label class="control-label"></label>
                            <div class="controls">
                                <div id="emailEs" data-animation="true" data-title="Errore!" data-content="Email non corretta.">
                                    <input type="text" name="email" onChange="email1();" placeholder="Email" class="input-xlarge">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="ak5"class="control-group">
                            <label class="control-label"></label>
                            <div class="controls">
                                <div id="utenteEs" data-animation="true" data-title="Errore!" data-content="Numeri o caratteri speciali non ammessi o utente già esistente.">
                                    <input type="text" name="utente" onChange="utente1();" placeholder="Username" class="input-xlarge">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="ak6"class="control-group">
                            <label class="control-label"></label>
                            <div class="controls">
                                <div id="passwordEs" data-animation="true" data-title="Errore!" data-content="Numeri o caratteri speciali non ammessi.">
                                    <input type="password" name="password" onChange="password1();" placeholder="Password" class="input-xlarge">
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="ak7" class="control-group">
                            <label class="control-label"></label>
                            <div class="controls">
                                <div id="confPassEs" data-animation="true" data-title="Errore!" data-content="Password di conferma diversa dalla password.">
                                    <input type="password" name="confermaPassword" onChange="confermaPassword1();" placeholder="Conferma Password" class="input-xlarge">
                                </div>
                                </div>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="controls">
                <input type="button" class="btn btn-success" value="Invia" name="bottone" onclick="finale();"  >
                <input type="button" class="btn btn-danger" value="Reset" onclick="reset();"  >
            </div>
        </div>
    </form>
</div>