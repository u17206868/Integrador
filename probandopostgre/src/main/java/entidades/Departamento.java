/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Departamento 
{
    private int cod_departamento;
    private String nombre_departamento;
    private int cod_pais;

    public Departamento() {
        this.cod_departamento = 0;
        this.nombre_departamento = "";
        this.cod_pais = 0;
    }

    public Departamento(int cod_departamento, String nombre_departamento, int cod_pais) {
        this.cod_departamento = cod_departamento;
        this.nombre_departamento = nombre_departamento;
        this.cod_pais = cod_pais;
    }

    public int getCod_departamento() {
        return cod_departamento;
    }

    public void setCod_departamento(int cod_departamento) {
        this.cod_departamento = cod_departamento;
    }

    public String getNombre_departamento() {
        return nombre_departamento;
    }

    public void setNombre_departamento(String nombre_departamento) {
        this.nombre_departamento = nombre_departamento;
    }

    public int getCod_pais() {
        return cod_pais;
    }

    public void setCod_pais(int cod_pais) {
        this.cod_pais = cod_pais;
    }
    
}
