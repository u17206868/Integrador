/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Mes_trabajo {

    private int cod_mes;
    private int codigo_cho;
    private String registro_mes;

    public Mes_trabajo() {
    }

    public Mes_trabajo(int cod_mes, int codigo_cho, String registro_mes) {
        this.cod_mes = cod_mes;
        this.codigo_cho = codigo_cho;
        this.registro_mes = registro_mes;
    }

    public int getCod_mes() {
        return cod_mes;
    }

    public void setCod_mes(int cod_mes) {
        this.cod_mes = cod_mes;
    }

    public int getCodigo_cho() {
        return codigo_cho;
    }

    public void setCodigo_cho(int codigo_cho) {
        this.codigo_cho = codigo_cho;
    }

    public String getRegistro_mes() {
        return registro_mes;
    }

    public void setRegistro_mes(String registro_mes) {
        this.registro_mes = registro_mes;
    }

}
