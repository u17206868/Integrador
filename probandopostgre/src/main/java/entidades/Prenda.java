/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Prenda 
{
    private int codigo_prenda;
    private String nombre_prenda;
    private boolean status;

    public Prenda() {
        this.codigo_prenda = 0;
        this.nombre_prenda = "";
        this.status = false;
    }

    public Prenda(int codigo_prenda, String nombre_prenda, boolean status) {
        this.codigo_prenda = codigo_prenda;
        this.nombre_prenda = nombre_prenda;
        this.status = status;
    }

    public int getCodigo_prenda() {
        return codigo_prenda;
    }

    public void setCodigo_prenda(int codigo_prenda) {
        this.codigo_prenda = codigo_prenda;
    }

    public String getNombre_prenda() {
        return nombre_prenda;
    }

    public void setNombre_prenda(String nombre_prenda) {
        this.nombre_prenda = nombre_prenda;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
