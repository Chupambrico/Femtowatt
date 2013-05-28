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
public class provaOra {
    public static void main(String args[]) throws Exception {
        try {
            String stringa = JOptionPane.showInputDialog(null, "Usare il formato OO:MM:SS\n", "Inserire ora", JOptionPane.QUESTION_MESSAGE);
            Ora1 ora11 = new Ora1(stringa);
            JOptionPane.showMessageDialog(null, ora11.getOra(), "Orario", JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception e) {
              JOptionPane.showMessageDialog(null, e.getMessage(), "Errore!", JOptionPane.ERROR_MESSAGE);
        
        }
        
        
    }
    
}
