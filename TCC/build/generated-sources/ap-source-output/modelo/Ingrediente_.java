package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Medidaingrediente;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-11-23T15:46:27")
@StaticMetamodel(Ingrediente.class)
public class Ingrediente_ { 

    public static volatile SingularAttribute<Ingrediente, String> foto;
    public static volatile SingularAttribute<Ingrediente, Integer> acesso;
    public static volatile SingularAttribute<Ingrediente, String> nome;
    public static volatile ListAttribute<Ingrediente, Medidaingrediente> medidaingredienteList;
    public static volatile SingularAttribute<Ingrediente, Integer> id;

}