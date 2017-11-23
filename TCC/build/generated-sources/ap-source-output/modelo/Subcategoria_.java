package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Categoria;
import modelo.Receita;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-11-23T15:46:27")
@StaticMetamodel(Subcategoria.class)
public class Subcategoria_ { 

    public static volatile SingularAttribute<Subcategoria, String> foto;
    public static volatile SingularAttribute<Subcategoria, Integer> acesso;
    public static volatile ListAttribute<Subcategoria, Receita> receitaList;
    public static volatile SingularAttribute<Subcategoria, Categoria> categoria;
    public static volatile SingularAttribute<Subcategoria, String> nome;
    public static volatile SingularAttribute<Subcategoria, Integer> id;
    public static volatile SingularAttribute<Subcategoria, String> descricao;

}