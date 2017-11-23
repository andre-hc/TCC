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
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
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
@Table(name = "ingrediente")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ingrediente.findAll", query = "SELECT i FROM Ingrediente i")
    , @NamedQuery(name = "Ingrediente.findById", query = "SELECT i FROM Ingrediente i WHERE i.id = :id")
    , @NamedQuery(name = "Ingrediente.findByNome", query = "SELECT i FROM Ingrediente i WHERE i.nome = :nome")
    , @NamedQuery(name = "Ingrediente.findByFoto", query = "SELECT i FROM Ingrediente i WHERE i.foto = :foto")
    , @NamedQuery(name = "Ingrediente.findByAcesso", query = "SELECT i FROM Ingrediente i WHERE i.acesso = :acesso")})

@NamedNativeQueries({
    @NamedNativeQuery(name = "Ingrediente.maisAcessado", query = "SELECT i FROM Ingrediente i order by i.acesso limit 4",
    resultClass = Receita.class)
})
public class Ingrediente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Column(name = "foto")
    private String foto;
    @Column(name = "acesso")
    private Integer acesso;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ingrediente")
    private List<Medidaingrediente> medidaingredienteList;

    public Ingrediente() {
    }

    public Ingrediente(Integer id) {
        this.id = id;
    }

    public Ingrediente(Integer id, String nome) {
        this.id = id;
        this.nome = nome;
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
        if (!(object instanceof Ingrediente)) {
            return false;
        }
        Ingrediente other = (Ingrediente) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Ingrediente[ id=" + id + " ]";
    }
    
}
