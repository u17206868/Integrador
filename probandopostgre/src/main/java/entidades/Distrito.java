/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

public class Distrito 
{
    private int cod_distrito;
    private String nombre_distrito;
    private int cod_provincia;

    public Distrito() {
        this.cod_distrito = 0;
        this.nombre_distrito = "";
        this.cod_provincia = 0;
    }

    public Distrito(int cod_distrito, String nombre_distrito, int cod_provincia) {
        this.cod_distrito = cod_distrito;
        this.nombre_distrito = nombre_distrito;
        this.cod_provincia = cod_provincia;
    }

    public int getCod_distrito() {
        return cod_distrito;
    }

    public void setCod_distrito(int cod_distrito) {
        this.cod_distrito = cod_distrito;
    }

    public String getNombre_distrito() {
        return nombre_distrito;
    }

    public void setNombre_distrito(String nombre_distrito) {
        this.nombre_distrito = nombre_distrito;
    }

    public int getCod_provincia() {
        return cod_provincia;
    }

    public void setCod_provincia(int cod_provincia) {
        this.cod_provincia = cod_provincia;
    }
    
}
