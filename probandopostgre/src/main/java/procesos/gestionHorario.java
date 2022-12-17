/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import dao.daoHorario;
import entidades.Fecha_trabajo;
import entidades.Hora_trabajo;
import entidades.Mes_trabajo;
import java.util.ArrayList;

/**
 *
 * @author tianb
 */
public class gestionHorario {
    public ArrayList<Fecha_trabajo> getFecha(int codigo_cho, String time_fecha)
    {
        return new daoHorario().getFecha(codigo_cho, time_fecha);
    }
    public ArrayList<Hora_trabajo> getHora(int cod_fecha)
    {
        return new daoHorario().getHora(cod_fecha);
    }
    public String get1Fecha(int cod_fecha)
    {
        return new daoHorario().get1Fecha(cod_fecha);
    }
    public ArrayList<Mes_trabajo> obtenerMeses(int codigo_cho)
    {
        return new daoHorario().obtenerMeses(codigo_cho);
    }
    public int registrarHorario(int codigo_cho, String registro_mes)
    {
        return new daoHorario().registrarHorario(codigo_cho, registro_mes);
    }
}
