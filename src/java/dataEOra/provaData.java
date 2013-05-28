/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dataEOra;

/**
 *
 * @author i4a10
 */
public class provaData {
    public static void main(String args[]) throws Exception {
        Data1 data11 = new Data1(20, 06, 1994) ;
        Data1 data12 = new Data1("02/03/1995");
        Data1 data13 = new Data1();
        System.out.println(data11.data) ;
        System.out.println(data11.differenzaInGiorniMesiAnni(data12).anni) ;
        System.out.println(data11.differenzaInGiorniMesiAnni(data12).mesi) ;
        System.out.println(data11.differenzaInGiorniMesiAnni(data12).giorni) ;
        System.out.println(data12.giorno) ;
    }
    
}
