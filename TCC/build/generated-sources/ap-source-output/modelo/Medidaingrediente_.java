package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Ingrediente;
import modelo.Medida;
import modelo.Receita;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-11-23T15:46:27")
@StaticMetamodel(Medidaingrediente.class)
public class Medidaingrediente_ { 

    public static volatile SingularAttribute<Medidaingrediente, Receita> receita;
    public static volatile SingularAttribute<Medidaingrediente, Medida> medida;
    public static volatile SingularAttribute<Medidaingrediente, Integer> id;
    public static volatile SingularAttribute<Medidaingrediente, String> quantidade;
    public static volatile SingularAttribute<Medidaingrediente, Ingrediente> ingrediente;

}