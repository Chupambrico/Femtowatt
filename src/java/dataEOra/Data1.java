package dataEOra;

/**
 * La classe Data1 definisce alcune caratteristiche e operazioni di una data
 * @author Cognome Nome Classe Anno
 * @version n.n (gg/mm/aaaa)
 */
public class Data1 {
    public Integer anno;
    public Integer mese;
    public Integer giorno;
    public String data;
    
    /**
     * Costruttore della classe Data1 senza parametri
     * Per impostare i parametri si possono usare i seguenti metodi:
     * {@link #setAnno(Integer anno)} - {@link #setMese(Integer mese)} -
     * {@link #setGiorno(Integer giorno)} - {@link #setData(String data)} -
     */
    public Data1(){
        
    }

    /**
     * Costruttore della classe Data1 con parametri
     * @param anno Anno
     * @param mese Mese
     * @param giorno Giorno
     * @throws java.lang.Exception
     */
    public Data1(Integer giorno, Integer mese, Integer anno) throws Exception {
        this.setAnno(anno);
        this.setMese(mese);
        this.setGiorno(giorno);
        this.setData();
    }
    
    /**
     * Costruttore della classe Data1 con parametri
     * @param data Data1
     * @throws java.lang.Exception
     */
    public Data1(String data) throws Exception {
        this.setData(data);
        this.setAnno();
        this.setMese();
        this.setGiorno();
    }
    
    /**
     * Restituisce l'anno della Data1
     * @return anno
     */
    public Integer getAnno(){
        return this.anno;
    }

    /**
     * Imposta l'anno della Data1
     * @param anno Anno
     */
    public void setAnno(Integer anno) throws Exception {
        try {
            if ( anno >= 0 )
                this.anno=anno;
            else
                throw new Exception("Eccezione : Anno minore di 0") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore anno " + npe.getMessage()) ;
        }
    }
    
    public void setAnno() throws Exception {
        try {
            anno=Integer.parseInt(data.substring(6, 10));
            this.anno=anno;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore anno " + npe.getMessage()) ;
        }
    }

    /**
     * Restituisce il mese della Data1
     * @return mese
     */
    public Integer getMese(){
        return this.mese;
    }

    /**
     * Imposta il mese della Data1
     * @param mese Mese
     */
    public void setMese(Integer mese) throws Exception {
        try {
            if ( mese >= 1 && mese <= 12 )
                this.mese=mese;
            else
                throw new Exception("Eccezione : Mese minore di 1 o maggiore di 12") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore mese " + npe.getMessage()) ;
        }
    }
    
    public void setMese() throws Exception {
        try {
            mese=Integer.parseInt(data.substring(3, 5));
            this.mese=mese;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore mese " + npe.getMessage()) ;
        }
    }
    
    /**
     * Restituisce il giorno della Data1
     * @return giorno
     */
    public Integer getGiorno(){
        return this.giorno;
    }

    /**
     * Imposta il giorno della Data1
     * @param giorno Giorno
     */
    public void setGiorno(Integer giorno) throws Exception {
        try {
            if(mese==1 || mese==3 || mese==5 || mese==7 || mese==8 || mese==10 || mese==12)
                if ( giorno >= 1 && giorno <= 31 )
                    this.giorno=giorno;
                else
                    throw new Exception("Eccezione : Giorno minore di 1 o maggiore di 31") ;

            if(mese==4 || mese==6 || mese==9 || mese==11)
                if ( giorno >= 1 && giorno <= 30 )
                    this.giorno=giorno;
                else
                    throw new Exception("Eccezione : Giorno minore di 1 o maggiore di 30") ;
                
            if(mese==2)
                if((anno%400==0 || (anno%4==0 && anno%100!=0)) && anno%4000!=0)
                    if ( giorno >= 1 && giorno <= 29 )
                        this.giorno=giorno;
                    else
                        throw new Exception("Eccezione : Giorno minore di 1 o maggiore di 29") ;
                else
                    if ( giorno >= 1 && giorno <= 28 )
                        this.giorno=giorno;
                    else
                        throw new Exception("Eccezione : Giorno minore di 1 o maggiore di 28") ;
            
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore giorno " + npe.getMessage()) ;
        }
    }
    
    public void setGiorno() throws Exception {
        try {
            giorno=Integer.parseInt(this.data.substring(0, 2));
            this.giorno=giorno;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore giorno " + npe.getMessage()) ;
        }
    }
    
    /**
     * Restituisce la data
     * @return data
     */
    public String getData(){
        return this.data;
    }

    /**
     * Imposta la data
     * @param data Data1
     */
    public void setData(String data) throws Exception {
        try{
            if ( this.validaData(data) )
                this.data=data;
            else
                throw new Exception("Eccezione : Data errata") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore data " + npe.getMessage()) ;
        }
    }
    
    public void setData() throws Exception {
        String data, giorno, mese, anno=null;               
        
        try{
            if (this.giorno < 10)
                giorno = "0" + this.giorno;
            else
                giorno = Integer.toString(this.giorno);
            
            if (this.mese < 10)
                mese = "0" + this.mese;
            else
                mese = Integer.toString(this.mese);
            
            if (this.anno < 10)
                anno = "000" + this.anno;
            if (this.anno < 100 && this.anno >= 10)
                anno = "00" + this.anno;
            if (this.anno < 1000 && this.anno >= 100)
                anno = "0" + this.anno;
            if (this.anno >= 1000)
                anno = Integer.toString(this.anno);
            
            data = giorno + "/" + mese + "/" + anno;
            this.data=data;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore data " + npe.getMessage()) ;
        }
    }
    
    public Integer differenzaInAnni(Data1 data) throws Exception {
        Integer differenzaAnni;
        try{
            if ( this.validaData(data.data) ){
                differenzaAnni = this.anno - data.anno ;
                if ( differenzaAnni < 0)
                    return ( differenzaAnni * -1 );
                else
                    return differenzaAnni;
            }
            else
                throw new Exception("Eccezione : Data errata") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore data " + npe.getMessage()) ;
        }
    }
    
    public Integer differenzaInMesi(Data1 data) throws Exception {
        Integer differenzaMesi;
        try{
            if ( this.validaData(data.data) ){
                differenzaMesi = this.mese - data.mese ;
                if ( differenzaMesi < 0)
                    return ( differenzaMesi * -1 );
                else
                    return differenzaMesi;
            }
            else
                throw new Exception("Eccezione : Data errata") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore data " + npe.getMessage()) ;
        }
    }
    
    public Integer differenzaInGiorni(Data1 data) throws Exception {
        Integer differenzaGiorni;
        try{
            if ( this.validaData(data.data) ){
                differenzaGiorni = this.giorno - data.giorno ;
                if ( differenzaGiorni < 0)
                    return ( differenzaGiorni * -1 );
                else
                    return differenzaGiorni;
            }
            else
                throw new Exception("Eccezione : Data errata") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore data " + npe.getMessage()) ;
        }
    }
    
    public DifferenzaData1 differenzaInGiorniMesiAnni(Data1 data) throws Exception {
        Integer differenzaGiorni, differenzaMesi, differenzaAnni;
        DifferenzaData1 differenzaData = new DifferenzaData1();
        try{
            if ( this.validaData(data.data) ){
                differenzaGiorni = this.giorno - data.giorno ;
                if ( differenzaGiorni < 0)
                    differenzaGiorni = ( differenzaGiorni * -1 );
            
            differenzaMesi = this.mese - data.mese ;
            if ( differenzaMesi < 0)
                differenzaMesi = ( differenzaMesi * -1 );
            
            differenzaAnni = this.anno - data.anno ;
            if ( differenzaAnni < 0)
                differenzaAnni = ( differenzaAnni * -1 );
            
            differenzaData.giorni = differenzaGiorni;
            differenzaData.mesi = differenzaMesi;
            differenzaData.anni = differenzaAnni;
            return differenzaData;
            }
            else
                throw new Exception("Eccezione : Data errata") ;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore data " + npe.getMessage()) ;
        }
    }
    
    public Integer calcolaGiorni() throws Exception {
        Integer giorni, giorniMese = null, giorniAnno;
        try{
            if(mese==1 || mese==3 || mese==5 || mese==7 || mese==8 || mese==10 || mese==12)
                giorniMese = 31;

            if(mese==4 || mese==6 || mese==9 || mese==11)
                giorniMese = 30;
                
            if(mese==2)
                if((anno%400==0 || (anno%4==0 && anno%100!=0)) && anno%4000!=0)
                    giorniMese = 29;
                else
                    giorniMese = 28;
            
            if((anno%400==0 || (anno%4==0 && anno%100!=0)) && anno%4000!=0)
                giorniAnno = 366;
            else
                giorniAnno = 365;
            
            giorni = this.giorno + giorniMese + giorniAnno;
            return giorni;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore data " + npe.getMessage()) ;
        }
    }
    
    public Integer calcolaMesi() throws Exception {
        Integer mesi;
        try{
            mesi = this.mese + ( this.anno * 12 );
            return mesi;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore data " + npe.getMessage()) ;
        }
    }
    
    public Integer calcolaAnni() throws Exception {
        try{
            return this.anno;
        } catch (NullPointerException npe) {
              throw new Exception("Eccezione : Puntatore data " + npe.getMessage()) ;
        }
    }
    
    private boolean validaData(String data) throws Exception {
        Integer anno, mese, giorno;
        Boolean valida=false;

        try{
            anno=Integer.parseInt(data.substring(6, 10));
            mese=Integer.parseInt(data.substring(3, 5));
            giorno=Integer.parseInt(data.substring(0, 2));

            if(anno>=1000 && anno<=9999){
                if(mese==1 || mese==3 || mese==5 || mese==7 || mese==8 || mese==10 || mese==12)
                    if(giorno>=1 && giorno<=31)
                        valida=true;

                if(mese==4 || mese==6 || mese==9 || mese==11)
                    if(giorno>=1 && giorno<=30)
                        valida=true;
                
                if(mese==2)
                    if((anno%400==0 || (anno%4==0 && anno%100!=0)) && anno%4000!=0)
                        if(giorno>=1 && giorno<=29)
                            valida=true;
                        else
                            ;
                    else
                        if(giorno>=1 && giorno<=28)
                            valida=true;
            }
            return valida;
        }
        catch(StringIndexOutOfBoundsException sioobe){
            throw new Exception("Eccezione : La data non rispetta il formato GG/MM/AAAA!");
        }
        catch(NumberFormatException nfe){
            throw new Exception("Eccezione : La data non rispetta il formato GG/MM/AAAA!");
        }
        catch(NullPointerException npe){
            throw new Exception("Eccezione : Puntatore data " + npe.getMessage());
        }
    }
    
}
