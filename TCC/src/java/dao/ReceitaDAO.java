/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Receita;

/**
 *
 * @author icaro
 */
public class ReceitaDAO extends GenericDAO<Receita, Integer>{
    
    public ReceitaDAO(){
        super(Receita.class);
    }
}
