/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author icaro
 */
@Entity
@Table(name = "receita")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Receita.findAll", query = "SELECT r FROM Receita r")
    , @NamedQuery(name = "Receita.findById", query = "SELECT r FROM Receita r WHERE r.id = :id")
    , @NamedQuery(name = "Receita.findByNome", query = "SELECT r FROM Receita r WHERE r.nome = :nome")
    , @NamedQuery(name = "Receita.findByTempoPreparo", query = "SELECT r FROM Receita r WHERE r.tempoPreparo = :tempoPreparo")
    , @NamedQuery(name = "Receita.findByDescricao", query = "SELECT r FROM Receita r WHERE r.descricao = :descricao")
    , @NamedQuery(name = "Receita.findByAcesso", query = "SELECT r FROM Receita r WHERE r.acesso = :acesso")
    , @NamedQuery(name = "Receita.findByServe", query = "SELECT r FROM Receita r WHERE r.serve = :serve")
    , @NamedQuery(name = "Receita.findByImagem1", query = "SELECT r FROM Receita r WHERE r.imagem1 = :imagem1")
    , @NamedQuery(name = "Receita.findByImagem2", query = "SELECT r FROM Receita r WHERE r.imagem2 = :imagem2")
    , @NamedQuery(name = "Receita.findByImagem3", query = "SELECT r FROM Receita r WHERE r.imagem3 = :imagem3")
    , @NamedQuery(name = "Receita.findByImagem4", query = "SELECT r FROM Receita r WHERE r.imagem4 = :imagem4")
    , @NamedQuery(name = "Receita.findByImagem5", query = "SELECT r FROM Receita r WHERE r.imagem5 = :imagem5")
    , @NamedQuery(name = "Receita.findFilter", query = "SELECT r FROM Receita r WHERE r.nome like :filtro "
            + "or CAST(r.id VARCHAR(50)) like :filtro "
            + "or CAST(r.serve VARCHAR(10)) like :filtro "
            + "or CAST(r.acesso VARCHAR(10)) like :filtro "
            + "or CAST(r.tempoPreparo VARCHAR(10)) like :filtro")
    , @NamedQuery(name = "Receita.findReceitaCategoria", query = "SELECT r FROM Receita r WHERE CAST(r.categoria.id VARCHAR(50)) like :filtro ")
    , @NamedQuery(name = "Receita.findReceitaSubCategoria", query = "SELECT r FROM Receita r WHERE CAST(r.subcategoria.id VARCHAR(50)) like :filtro ")
    , @NamedQuery(name = "Receita.findMinhasReceitas", query = "SELECT r FROM Receita r WHERE CAST(r.usuario.id VARCHAR(50)) like :filtro ")})

@NamedNativeQueries({
    @NamedNativeQuery(name = "Receita.aleatorio", query = "SELECT r FROM Receita r order by RANDOM() limit 4",
    resultClass = Receita.class),
    @NamedNativeQuery(name = "Receita.maisAcessado", query = "SELECT r FROM Receita r order by r.acesso limit 4",
    resultClass = Receita.class),
    @NamedNativeQuery(name = "Receita.findIngredienteReceita", query = "SELECT RECEITA.ID FROM RECEITA INNER JOIN MEDIDAINGREDIENTE ON RECEITA.ID = MEDIDAINGREDIENTE.RECEITA"
            + " AND INGREDIENTE.ID = MEDIDAINGREDIENTE.INGREDIENTE",
    resultClass = Receita.class)
})
public class Receita implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Basic(optional = false)
    @Column(name = "tempo_preparo")
    @Temporal(TemporalType.DATE)
    private Date tempoPreparo;
    @Column(name = "descricao")
    private String descricao;
    @Column(name = "acesso")
    private Integer acesso;
    @Basic(optional = false)
    @Column(name = "serve")
    private Integer serve;
    @Basic(optional = false)
    @Column(name = "imagem1")
    private String imagem1;
    @Basic(optional = false)
    @Column(name = "imagem2")
    private String imagem2;
    @Basic(optional = false)
    @Column(name = "imagem3")
    private String imagem3;
    @Column(name = "imagem4")
    private String imagem4;
    @Column(name = "imagem5")
    private String imagem5;
    @JoinColumn(name = "categoria", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Categoria categoria;
    @JoinColumn(name = "subcategoria", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Subcategoria subcategoria;
    @JoinColumn(name = "usuario", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Usuario usuario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "receita")
    private List<Favorito> favoritoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "receita")
    private List<Comentario> comentarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "receita")
    private List<Medidaingrediente> medidaingredienteList;

    public Receita() {
    }

    public Receita(Integer id) {
        this.id = id;
    }

    public Receita(Integer id, String nome, Date tempoPreparo, Integer serve, String imagem1, String imagem2, String imagem3) {
        this.id = id;
        this.nome = nome;
        this.tempoPreparo = tempoPreparo;
        this.serve = serve;
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.imagem3 = imagem3;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getTempoPreparo() {
        return tempoPreparo;
    }

    public void setTempoPreparo(Date tempoPreparo) {
        this.tempoPreparo = tempoPreparo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Integer getAcesso() {
        return acesso;
    }

    public void setAcesso(Integer acesso) {
        this.acesso = acesso;
    }

    public Integer getServe() {
        return serve;
    }

    public void setServe(int serve) {
        this.serve = serve;
    }

    public String getImagem1() {
        return imagem1;
    }

    public void setImagem1(String imagem1) {
        this.imagem1 = imagem1;
    }

    public String getImagem2() {
        return imagem2;
    }

    public void setImagem2(String imagem2) {
        this.imagem2 = imagem2;
    }

    public String getImagem3() {
        return imagem3;
    }

    public void setImagem3(String imagem3) {
        this.imagem3 = imagem3;
    }

    public String getImagem4() {
        return imagem4;
    }

    public void setImagem4(String imagem4) {
        this.imagem4 = imagem4;
    }

    public String getImagem5() {
        return imagem5;
    }

    public void setImagem5(String imagem5) {
        this.imagem5 = imagem5;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Subcategoria getSubcategoria() {
        return subcategoria;
    }

    public void setSubcategoria(Subcategoria subcategoria) {
        this.subcategoria = subcategoria;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @XmlTransient
    public List<Favorito> getFavoritoList() {
        return favoritoList;
    }

    public void setFavoritoList(List<Favorito> favoritoList) {
        this.favoritoList = favoritoList;
    }

    @XmlTransient
    public List<Comentario> getComentarioList() {
        return comentarioList;
    }

    public void setComentarioList(List<Comentario> comentarioList) {
        this.comentarioList = comentarioList;
    }

    @XmlTransient
    public List<Medidaingrediente> getMedidaingredienteList() {
        return medidaingredienteList;
    }

    public void setMedidaingredienteList(List<Medidaingrediente> medidaingredienteList) {
        this.medidaingredienteList = medidaingredienteList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Receita)) {
            return false;
        }
        Receita other = (Receita) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Receita[ id=" + id + " ]";
    }
    
}
