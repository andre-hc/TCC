package modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Categoria;
import modelo.Comentario;
import modelo.Favorito;
import modelo.Medidaingrediente;
import modelo.Subcategoria;
import modelo.Usuario;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-11-23T15:46:27")
@StaticMetamodel(Receita.class)
public class Receita_ { 

    public static volatile SingularAttribute<Receita, Integer> acesso;
    public static volatile SingularAttribute<Receita, Date> tempoPreparo;
    public static volatile SingularAttribute<Receita, Categoria> categoria;
    public static volatile SingularAttribute<Receita, String> nome;
    public static volatile SingularAttribute<Receita, String> imagem1;
    public static volatile SingularAttribute<Receita, Integer> serve;
    public static volatile SingularAttribute<Receita, String> descricao;
    public static volatile SingularAttribute<Receita, String> imagem3;
    public static volatile SingularAttribute<Receita, String> imagem2;
    public static volatile SingularAttribute<Receita, String> imagem5;
    public static volatile SingularAttribute<Receita, Subcategoria> subcategoria;
    public static volatile ListAttribute<Receita, Comentario> comentarioList;
    public static volatile SingularAttribute<Receita, String> imagem4;
    public static volatile ListAttribute<Receita, Favorito> favoritoList;
    public static volatile SingularAttribute<Receita, Usuario> usuario;
    public static volatile ListAttribute<Receita, Medidaingrediente> medidaingredienteList;
    public static volatile SingularAttribute<Receita, Integer> id;

}