<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Login</h3>
    </div>
    <div class="modal-body">
        <form class="form-horizontal" name="loginform">
            <div class="control-group">
                <label class="control-label" for="inputEmail">Username</label>
                <div class="controls">
                    <input type="text" id="inputEmail" placeholder="Username" name="loginemail">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputPassword">Password</label>
                <div class="controls">
                    <input type="password" id="inputPassword" placeholder="Password" name="loginpass">
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <label class="checkbox">
                        <input type="checkbox">Ricordami
                    </label>
                    <button class="btn btn-primary" type="button" name="loginbtn" onclick="login();">Entra!</button>
                </div>
            </div>
        </form>
        <div class="alert alert-error hidden" id="loginError">
            <button class="close" type="button" onclick="closePopError();">×</button>
            <strong>Errore!</strong>
            <p id="errorMessage">Change a few things up and try submitting again.</p>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-link">Non sei ancora registrato?</button>
        <a  class="btn" href="index.jsp?pag=register" >Registrati</a>
    </div>
</div>