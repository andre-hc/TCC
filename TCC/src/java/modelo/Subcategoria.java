/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author icaro
 */
@Entity
@Table(name = "subcategoria")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Subcategoria.findAll", query = "SELECT s FROM Subcategoria s")
    , @NamedQuery(name = "Subcategoria.findById", query = "SELECT s FROM Subcategoria s WHERE s.id = :id")
    , @NamedQuery(name = "Subcategoria.findByNome", query = "SELECT s FROM Subcategoria s WHERE s.nome = :nome")
    , @NamedQuery(name = "Subcategoria.findByFoto", query = "SELECT s FROM Subcategoria s WHERE s.foto = :foto")
    , @NamedQuery(name = "Subcategoria.findByAcesso", query = "SELECT s FROM Subcategoria s WHERE s.acesso = :acesso")
    , @NamedQuery(name = "Subcategoria.findSubCategoriaCategoria", query = "SELECT s FROM Subcategoria s WHERE CAST(s.categoria.id VARCHAR(50)) like :filtro ")
    , @NamedQuery(name = "Subcategoria.findFilter", query = "SELECT s FROM Subcategoria s WHERE s.nome like :filtro or CAST(s.id VARCHAR(50)) like :filtro or s.categoria.nome like :filtro")})
public class Subcategoria implements Serializable {

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
    @Column(name = "foto")
    private String foto;
    @Column(name = "acesso")
    private Integer acesso;
    @Column (name = "descricao")
    @Basic (optional = false)
    private String descricao;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subcategoria")
    private List<Receita> receitaList;
    @JoinColumn(name = "categoria", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Categoria categoria;

    public Subcategoria() {
    }

    public Subcategoria(Integer id) {
        this.id = id;
    }

    public Subcategoria(Integer id, String nome, String foto) {
        this.id = id;
        this.nome = nome;
        this.foto = foto;
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

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public Integer getAcesso() {
        return acesso;
    }

    public void setAcesso(Integer acesso) {
        this.acesso = acesso;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    @XmlTransient
    public List<Receita> getReceitaList() {
        return receitaList;
    }

    public void setReceitaList(List<Receita> receitaList) {
        this.receitaList = receitaList;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
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
        if (!(object instanceof Subcategoria)) {
            return false;
        }
        Subcategoria other = (Subcategoria) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Subcategoria[ id=" + id + " ]";
    }
    
}
