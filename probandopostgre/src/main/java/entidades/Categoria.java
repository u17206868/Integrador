/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Categoria 
{
    private String codigo_ca, descripcion_ca;
    private boolean status;

    public Categoria() 
    {
        this.codigo_ca = "";
        this.descripcion_ca = "";
        this.status = false;
    }

    public Categoria(String codigo_ca, String descripcion_ca, boolean status) {
        this.codigo_ca = codigo_ca;
        this.descripcion_ca = descripcion_ca;
        this.status = status;
    }

    public String getCodigo_ca() {
        return codigo_ca;
    }

    public void setCodigo_ca(String codigo_ca) {
        this.codigo_ca = codigo_ca;
    }

    public String getDescripcion_ca() {
        return descripcion_ca;
    }

    public void setDescripcion_ca(String descripcion_ca) {
        this.descripcion_ca = descripcion_ca;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
