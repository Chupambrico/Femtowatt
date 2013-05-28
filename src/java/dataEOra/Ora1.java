package dataEOra;

import java.util.GregorianCalendar;

/**
 * La classe Data1 definisce alcune caratteristiche e operazioni di una data
 * @author Cognome Nome Classe Anno
 * @version n.n (gg/mm/aaaa)
 */
public class Ora1 {
    public Integer secondi;
    public Integer minuti;
    public Integer ore;
    public String ora;
    
    /**
     * Costruttore della classe Ora senza parametri
     * Per impostare i parametri si possono usare i seguenti metodi:
     * {@link #setOre(Integer ore)} - {@link #setMinuti(Integer minuti)} -
     * {@link #setSecondi(Integer secondi)} - {@link #setOra(String ora)} -
     */
    public Ora1() throws Exception {
        GregorianCalendar oraAttuale = new GregorianCalendar();
        this.setSecondi(oraAttuale.get(oraAttuale.SECOND));
        this.setMinuti(oraAttuale.get(oraAttuale.MINUTE));
        this.setOre(oraAttuale.get(oraAttuale.HOUR_OF_DAY));
        this.setOra();
    }

    /**
     * Costruttore della classe Ora con parametri
     * @param ore Ore
     * @param minuti Minuti
     * @param secondi Secondi
     * @throws java.lang.Exception
     */
    public Ora1(Integer ore, Integer minuti, Integer secondi) throws Exception {
        this.setSecondi(secondi);
        this.setMinuti(minuti);
        this.setOre(ore);
        this.setOra();
    }
    
    /**
     * Costruttore della classe Ora con parametri
     * @param ora Ora
     * @throws java.lang.Exception
     */
    public Ora1(String ora) throws Exception {
        this.setOra(ora);
        this.setSecondi();
        this.setMinuti();
        this.setOre();
    }
    
    /**
     * Restituisce i secondi della Data
     * @return secondi
     */
    public Integer getSecondi(){
        return this.secondi;
    }

    /**
     * Imposta i secondi della Data
     * @param secondi Secondi
     */
    public void setSecondi(Integer secondi) throws Exception {
        try {
            if ( secondi >= 0 && secondi <= 59 )
                this.secondi=secondi;
            else
                throw new Exception("Eccezione : Secondi minori di 0 o maggiori di 59") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore secondi " + npe.getMessage()) ;
        }
    }
    
    public void setSecondi() throws Exception {
        try {
            this.secondi=Integer.parseInt(ora.substring(6, 8));
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore secondi " + npe.getMessage()) ;
        }
    }

    /**
     * Restituisce i minuti della Data
     * @return minuti
     */
    public Integer getMinuti(){
        return this.minuti;
    }

    /**
     * Imposta i minuti della Data
     * @param minuti Minuti
     */
    public void setMinuti(Integer minuti) throws Exception {
        try {
            if ( minuti >= 0 && minuti <= 59 )
                this.minuti=minuti;
            else
                throw new Exception("Eccezione : Minuti minori di 0 o maggiori di 59") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore minuti " + npe.getMessage()) ;
        }
    }
    
    public void setMinuti() throws Exception {
        try {
            this.minuti=Integer.parseInt(ora.substring(3, 5));
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore minuti " + npe.getMessage()) ;
        }
    }
    
    /**
     * Restituisce le ore della Data
     * @return ore
     */
    public Integer getOre(){
        return this.ore;
    }

    /**
     * Imposta le ore della Data
     * @param ore Ore
     */
    public void setOre(Integer ore) throws Exception {
        try {
            if ( ore >= 0 && ore <= 23 )
                this.ore=ore;
            else
                throw new Exception("Eccezione : Ore minori di 0 o maggiori di 23") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore ore " + npe.getMessage()) ;
        }
    }
    
    public void setOre() throws Exception {
        try {
            this.ore=Integer.parseInt(this.ora.substring(0, 2));
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore ore " + npe.getMessage()) ;
        }
    }
    
    /**
     * Restituisce l' ora
     * @return ora
     */
    public String getOra(){
        return this.ora;
    }

    /**
     * Imposta l' ora
     * @param ora Ora
     */
    public void setOra(String ora) throws Exception {
        try{
            if ( this.validaOra(ora) )
                this.ora=ora;
            else
                throw new Exception("Eccezione : Ora errata") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore ora " + npe.getMessage()) ;
        }
    }
    
    public void setOra() throws Exception {
        String ora, secondi, minuti, ore;               
        
        try{
            if (this.ore < 10)
                ore = "0" + this.ore;
            else
                ore = Integer.toString(this.ore);
            
            if (this.minuti < 10)
                minuti = "0" + this.minuti;
            else
                minuti = Integer.toString(this.minuti);
            
            if (this.secondi < 10)
                secondi = "0" + this.secondi;
            else
                secondi = Integer.toString(this.secondi);
            
            ora = ore + ":" + minuti + ":" + secondi;
            this.ora=ora;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore ora " + npe.getMessage()) ;
        }
    }
    
    public Integer differenzaInSecondi(Ora1 ora) throws Exception {
        Integer differenzaSecondi;
        try{
            if ( this.validaOra(ora.ora) ){
                differenzaSecondi = this.secondi - ora.secondi ;
                if ( differenzaSecondi < 0)
                    return ( differenzaSecondi * -1 );
                else
                    return differenzaSecondi;
            }
            else
                throw new Exception("Eccezione : Ora errata") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore ora " + npe.getMessage()) ;
        }
    }
    
    public Integer differenzaInMinuti(Ora1 ora) throws Exception {
        Integer differenzaMinuti;
        try{
            if ( this.validaOra(ora.ora) ){
                differenzaMinuti = this.minuti - ora.minuti ;
                if ( differenzaMinuti < 0)
                    return ( differenzaMinuti * -1 );
                else
                    return differenzaMinuti;
            }
            else
                throw new Exception("Eccezione : Ora errata") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore ora " + npe.getMessage()) ;
        }
    }
    
    public Integer differenzaInOre(Ora1 ora) throws Exception {
        Integer differenzaOre;
        try{
            if ( this.validaOra(ora.ora) ){
                differenzaOre = this.ore - ora.ore ;
                if ( differenzaOre < 0)
                    return ( differenzaOre * -1 );
                else
                    return differenzaOre;
            }
            else
                throw new Exception("Eccezione : Ora errata") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore ora " + npe.getMessage()) ;
        }
    }
    
    public DifferenzaOra1 differenzaInOreMinutiSecondi(Ora1 ora) throws Exception {
        Integer differenzaSecondi, differenzaMinuti, differenzaOre;
        DifferenzaOra1 differenzaOra = new DifferenzaOra1();
        try{
            if ( this.validaOra(ora.ora) ){
                differenzaSecondi = this.secondi - ora.secondi ;
                if ( differenzaSecondi < 0)
                    differenzaSecondi = ( differenzaSecondi * -1 );
            
            differenzaMinuti = this.minuti - ora.minuti ;
            if ( differenzaMinuti < 0)
                differenzaMinuti = ( differenzaMinuti * -1 );
            
            differenzaOre = this.ore - ora.ore ;
            if ( differenzaOre < 0)
                differenzaOre = ( differenzaOre * -1 );
            
            differenzaOra.secondi = differenzaSecondi;
            differenzaOra.minuti = differenzaMinuti;
            differenzaOra.ore = differenzaOre;
            return differenzaOra;
            }
            else
                throw new Exception("Eccezione : Ora errata") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore ora " + npe.getMessage()) ;
        }
    }
    
    private boolean validaOra(String ora) throws Exception {
        Integer secondi, minuti, ore;
        Boolean valida=false;

        try{
            secondi=Integer.parseInt(ora.substring(6, 8));
            minuti=Integer.parseInt(ora.substring(3, 5));
            ore=Integer.parseInt(ora.substring(0, 2));

            if(ore >= 0 && ore <= 23){
                if(minuti >= 0 && minuti <= 59)
                    if(secondi >= 0 && secondi <= 59)
                        valida=true;
            }
            return valida;
        }
        catch(StringIndexOutOfBoundsException sioobe){
            throw new Exception("Eccezione : L' ora non rispetta il formato OO/MM/SS!");
        }
        catch(NumberFormatException nfe){
            throw new Exception("Eccezione : L' ora non rispetta il formato OO/MM/SS!");
        }
        catch(NullPointerException npe){
            throw new Exception("Eccezione : Puntatore ora " + npe.getMessage());
        }
    }
    
}
