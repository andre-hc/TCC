/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Comentario;

/**
 *
 * @author icaro
 */
public class ComentarioDAO extends GenericDAO<Comentario, Integer> {

    public ComentarioDAO() {
        super(Comentario.class);
    }
}
