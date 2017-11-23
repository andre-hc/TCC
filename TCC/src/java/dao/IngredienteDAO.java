/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Ingrediente;

/**
 *
 * @author icaro
 */
public class IngredienteDAO extends GenericDAO<Ingrediente, Integer>{
    
    public IngredienteDAO(){
        super(Ingrediente.class);
}
}
