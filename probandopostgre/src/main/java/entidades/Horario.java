/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Horario {
    private int cod_horario;
    private String time_horario;
    private int codigo_cho;
    private int tipo_horario;
    private boolean status;

    public Horario() {
        this.cod_horario = 0;
        this.time_horario = "2000-01-01 01:01:01";
        this.codigo_cho = 0;
        this.tipo_horario = 0;
        this.status = false;
    }

    public Horario(int cod_horario, String time_horario, int codigo_cho, int tipo_horario, boolean status) {
        this.cod_horario = cod_horario;
        this.time_horario = time_horario;
        this.codigo_cho = codigo_cho;
        this.tipo_horario = tipo_horario;
        this.status = status;
    }

    public int getCod_horario() {
        return cod_horario;
    }

    public void setCod_horario(int cod_horario) {
        this.cod_horario = cod_horario;
    }

    public String getTime_horario() {
        return time_horario;
    }

    public void setTime_horario(String time_horario) {
        this.time_horario = time_horario;
    }

    public int getCodigo_cho() {
        return codigo_cho;
    }

    public void setCodigo_cho(int codigo_cho) {
        this.codigo_cho = codigo_cho;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getTipo_horario() {
        return tipo_horario;
    }

    public void setTipo_horario(int tipo_horario) {
        this.tipo_horario = tipo_horario;
    }
    
}
