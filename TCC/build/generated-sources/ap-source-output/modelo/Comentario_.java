package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Receita;
import modelo.Usuario;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-11-23T15:46:27")
@StaticMetamodel(Comentario.class)
public class Comentario_ { 

    public static volatile SingularAttribute<Comentario, String> texto;
    public static volatile SingularAttribute<Comentario, Receita> receita;
    public static volatile SingularAttribute<Comentario, Usuario> usuario;
    public static volatile SingularAttribute<Comentario, Integer> id;

}