/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dataEOra;

import javax.swing.*;

/**
 *
 * @author i4a10
 */
public class FinestreDiMessaggio {
    public static void main(String[]args){
        JOptionPane.showMessageDialog(null, "Deve essere un numero intero", "Errore!", JOptionPane.ERROR_MESSAGE);
        String stringa = JOptionPane.showInputDialog(null, "Domanda", "Titolo", JOptionPane.QUESTION_MESSAGE);
        Integer intero = JOptionPane.showConfirmDialog(null, "Scelta", "Titolo", JOptionPane.YES_NO_CANCEL_OPTION);
        Object[] scelte = {"Visualizza Nome", "Imposta Nome", "Informazioni"};
        Integer intero1 = JOptionPane.showOptionDialog(null, "Scelta", "Titolo", JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null, scelte, scelte[1]);
        System.out.println(stringa) ;
        System.out.println(intero) ;
        System.out.println(intero1) ;
    }
}
