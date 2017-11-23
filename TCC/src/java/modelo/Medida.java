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
@Table(name = "medida")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Medida.findAll", query = "SELECT m FROM Medida m")
    , @NamedQuery(name = "Medida.findById", query = "SELECT m FROM Medida m WHERE m.id = :id")
    , @NamedQuery(name = "Medida.findByNome", query = "SELECT m FROM Medida m WHERE m.nome = :nome")
    , @NamedQuery(name = "Medida.findByFoto", query = "SELECT m FROM Medida m WHERE m.foto = :foto")
    , @NamedQuery(name = "Medida.findFilter", query = "Select m FROM Medida m WHERE m.nome like :filtro or CAST(m.id VARCHAR(50)) like :filtro")})
public class Medida implements Serializable {

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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "medida")
    private List<Medidaingrediente> medidaingredienteList;

    public Medida() {
    }

    public Medida(Integer id) {
        this.id = id;
    }

    public Medida(Integer id, String nome, String foto) {
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
        if (!(object instanceof Medida)) {
            return false;
        }
        Medida other = (Medida) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Medida[ id=" + id + " ]";
    }
    
}
