/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package funzioni;

/**
 *
 * @author i5a11
 */
public class ControlloCampi {
    private String campo;
    private String condizioni;
    private java.util.regex.Pattern regNome;
    private java.util.regex.Matcher m;
    
    public ControlloCampi(String campo, String condizioni){
        this.setCampo(campo);
        this.setCondizioni(condizioni);
    }
    public void setCampo(String camp){
        campo = camp;
    }
    public void setCondizioni(String cond){
        condizioni = cond;
    }
    public String getCampo(){
        return campo;
    }
    public String getCondizioni(){
        return condizioni;
    }
    public boolean controllo(){
        regNome = java.util.regex.Pattern.compile(this.condizioni);
        m = regNome.matcher(this.campo);
        return m.matches();
    }
}
