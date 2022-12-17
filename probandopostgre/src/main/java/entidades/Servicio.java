/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Servicio 
{
    private String codigo_se, descripcion_se, precio_se, codigo_ca;
    private boolean status;

    public String getCodigo_se() {
        return codigo_se;
    }

    public void setCodigo_se(String codigo_se) {
        this.codigo_se = codigo_se;
    }

    public String getDescripcion_se() {
        return descripcion_se;
    }

    public void setDescripcion_se(String descripcion_se) {
        this.descripcion_se = descripcion_se;
    }

    public String getPrecio_se() {
        return precio_se;
    }

    public void setPrecio_se(String precio_se) {
        this.precio_se = precio_se;
    }

    public String getCodigo_ca() {
        return codigo_ca;
    }

    public void setCodigo_ca(String codigo_ca) {
        this.codigo_ca = codigo_ca;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Servicio() {
        this.codigo_se = "";
        this.codigo_ca = "";
        this.descripcion_se = "";
        this.precio_se = "";
        this.status = false;
    }

    public Servicio(String codigo_se, String codigo_ca, String descripcion_se, String precio_se, boolean status) {
        this.codigo_se = codigo_se;
        this.codigo_ca = codigo_ca;
        this.descripcion_se = descripcion_se;
        this.precio_se = precio_se;
        this.status = status;
    }
}
