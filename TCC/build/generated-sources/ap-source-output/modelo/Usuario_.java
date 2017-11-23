package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Comentario;
import modelo.Favorito;
import modelo.Receita;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-11-23T15:46:27")
@StaticMetamodel(Usuario.class)
public class Usuario_ { 

    public static volatile SingularAttribute<Usuario, String> senha;
    public static volatile SingularAttribute<Usuario, String> uf;
    public static volatile SingularAttribute<Usuario, String> telefone;
    public static volatile SingularAttribute<Usuario, String> foto;
    public static volatile ListAttribute<Usuario, Receita> receitaList;
    public static volatile ListAttribute<Usuario, Comentario> comentarioList;
    public static volatile ListAttribute<Usuario, Favorito> favoritoList;
    public static volatile SingularAttribute<Usuario, String> nome;
    public static volatile SingularAttribute<Usuario, Integer> id;
    public static volatile SingularAttribute<Usuario, Boolean> adm;
    public static volatile SingularAttribute<Usuario, String> email;

}