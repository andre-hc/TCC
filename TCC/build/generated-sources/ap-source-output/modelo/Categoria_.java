package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Receita;
import modelo.Subcategoria;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-11-23T15:46:27")
@StaticMetamodel(Categoria.class)
public class Categoria_ { 

    public static volatile SingularAttribute<Categoria, String> foto;
    public static volatile SingularAttribute<Categoria, Integer> acesso;
    public static volatile ListAttribute<Categoria, Receita> receitaList;
    public static volatile ListAttribute<Categoria, Subcategoria> subcategoriaList;
    public static volatile SingularAttribute<Categoria, String> nome;
    public static volatile SingularAttribute<Categoria, Integer> id;
    public static volatile SingularAttribute<Categoria, String> descricao;

}