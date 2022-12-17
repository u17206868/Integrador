/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Hora_trabajo {
    private int cod_hora;
    private int cod_fecha;
    private String time_hora;
    private boolean status;

    public Hora_trabajo() {
        this.cod_hora = 0;
        this.cod_fecha = 0;
        this.time_hora = "01:00:00";
        this.status = false;
    }

    public Hora_trabajo(int cod_hora, int cod_fecha, String time_hora, boolean status) {
        this.cod_hora = cod_hora;
        this.cod_fecha = cod_fecha;
        this.time_hora = time_hora;
        this.status = status;
    }

    public int getCod_hora() {
        return cod_hora;
    }

    public void setCod_hora(int cod_hora) {
        this.cod_hora = cod_hora;
    }

    public int getCod_fecha() {
        return cod_fecha;
    }

    public void setCod_fecha(int cod_fecha) {
        this.cod_fecha = cod_fecha;
    }

    public String getTime_hora() {
        return time_hora;
    }

    public void setTime_hora(String time_hora) {
        this.time_hora = time_hora;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
