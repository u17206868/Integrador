/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Fecha_trabajo 
{
    private int cod_fecha;
    private int codigo_cho;
    private String time_fecha;
    private boolean status;

    public Fecha_trabajo() {
        this.cod_fecha = 0;
        this.codigo_cho = 0;
        this.time_fecha = "2000-01-01";
        this.status = false;
    }

    public Fecha_trabajo(int cod_fecha, int codigo_cho, String time_fecha, boolean status) {
        this.cod_fecha = cod_fecha;
        this.codigo_cho = codigo_cho;
        this.time_fecha = time_fecha;
        this.status = status;
    }

    public int getCod_fecha() {
        return cod_fecha;
    }

    public void setCod_fecha(int cod_fecha) {
        this.cod_fecha = cod_fecha;
    }

    public int getCodigo_cho() {
        return codigo_cho;
    }

    public void setCodigo_cho(int codigo_cho) {
        this.codigo_cho = codigo_cho;
    }

    public String getTime_fecha() {
        return time_fecha;
    }

    public void setTime_fecha(String time_fecha) {
        this.time_fecha = time_fecha;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
