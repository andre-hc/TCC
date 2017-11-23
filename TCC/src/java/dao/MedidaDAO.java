/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Medida;

/**
 *
 * @author icaro
 */
public class MedidaDAO extends GenericDAO<Medida, Integer>{
    
    public MedidaDAO(){
        super(Medida.class);
    }
}
