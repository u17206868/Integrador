/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

public class Provincia 
{
    private int cod_provincia;
    private String nombre_provincia;
    private int cod_departamento;

    public Provincia() {
        this.cod_provincia = 0;
        this.nombre_provincia = "";
        this.cod_departamento = 0;
    }

    public Provincia(int cod_provincia, String nombre_provincia, int cod_departamento) {
        this.cod_provincia = cod_provincia;
        this.nombre_provincia = nombre_provincia;
        this.cod_departamento = cod_departamento;
    }

    public int getCod_provincia() {
        return cod_provincia;
    }

    public void setCod_provincia(int cod_provincia) {
        this.cod_provincia = cod_provincia;
    }

    public String getNombre_provincia() {
        return nombre_provincia;
    }

    public void setNombre_provincia(String nombre_provincia) {
        this.nombre_provincia = nombre_provincia;
    }

    public int getCod_departamento() {
        return cod_departamento;
    }

    public void setCod_departamento(int cod_departamento) {
        this.cod_departamento = cod_departamento;
    }
    
}
