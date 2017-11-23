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
@Table(name = "medidaingrediente")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Medidaingrediente.findAll", query = "SELECT m FROM Medidaingrediente m")
    , @NamedQuery(name = "Medidaingrediente.findById", query = "SELECT m FROM Medidaingrediente m WHERE m.id = :id")
    , @NamedQuery(name = "Medidaingrediente.findByQuantidade", query = "SELECT m FROM Medidaingrediente m WHERE m.quantidade = :quantidade")})
public class Medidaingrediente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "quantidade")
    private String quantidade;
    @JoinColumn(name = "ingrediente", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Ingrediente ingrediente;
    @JoinColumn(name = "medida", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Medida medida;
    @JoinColumn(name = "receita", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Receita receita;

    public Medidaingrediente() {
    }

    public Medidaingrediente(Integer id) {
        this.id = id;
    }

    public Medidaingrediente(Integer id, String quantidade) {
        this.id = id;
        this.quantidade = quantidade;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(String quantidade) {
        this.quantidade = quantidade;
    }

    public Ingrediente getIngrediente() {
        return ingrediente;
    }

    public void setIngrediente(Ingrediente ingrediente) {
        this.ingrediente = ingrediente;
    }

    public Medida getMedida() {
        return medida;
    }

    public void setMedida(Medida medida) {
        this.medida = medida;
    }

    public Receita getReceita() {
        return receita;
    }

    public void setReceita(Receita receita) {
        this.receita = receita;
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
        if (!(object instanceof Medidaingrediente)) {
            return false;
        }
        Medidaingrediente other = (Medidaingrediente) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Medidaingrediente[ id=" + id + " ]";
    }
    
}
