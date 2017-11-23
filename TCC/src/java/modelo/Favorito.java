/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author icaro
 */
@Entity
@Table(name = "favorito")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Favorito.findAll", query = "SELECT f FROM Favorito f")
    , @NamedQuery(name = "Favorito.findById", query = "SELECT f FROM Favorito f WHERE f.id = :id")
    , @NamedQuery(name = "Favorito.findFilter", query = "SELECT f FROM Favorito f WHERE f.receita.nome like :filtro or f.usuario.nome like :filtro or CAST(f.id VARCHAR(50)) like :filtro")
//  , @NamedQuery(name = "Favorito.findUsuarioReceita", query = "SELECT f FROM Favorito f WHERE favorito.usuario.id = :filtro"
//            + " AND favorito.receita.id = :filtro2")
})
public class Favorito implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "receita", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Receita receita;
    @JoinColumn(name = "usuario", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Usuario usuario;

    public Favorito() {
    }

    public Favorito(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Receita getReceita() {
        return receita;
    }

    public void setReceita(Receita receita) {
        this.receita = receita;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
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
        if (!(object instanceof Favorito)) {
            return false;
        }
        Favorito other = (Favorito) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Favorito[ id=" + id + " ]";
    }
    
}
