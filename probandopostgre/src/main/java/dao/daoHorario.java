/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidades.Horario;
import entidades.Fecha_trabajo;
import entidades.Hora_trabajo;
import entidades.Mes_trabajo;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
public class daoHorario extends conexionJDBC
{
    public ArrayList<Horario> obtenerLista(int codigo_cho) {
        ArrayList<Horario> horarios = new ArrayList<Horario>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT cod_hora, cod_fecha, to_char(time_hora,'HH12:MI:SS a.m.'), status FROM horario where codigo_cho=" + codigo_cho + " and status=" + true +" order by cod_horario asc;");
            //rs = st.executeQuery("SELECT * FROM horario where codigo_cho=" + codigo_cho + " and status=" + true +" order by cod_horario asc;");
            while (rs.next()) {
                horarios.add(new Horario(rs.getInt(1), rs.getString(2),rs.getInt(3),rs.getInt(4),
                        rs.getBoolean(5)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return horarios;
    }
    public ArrayList<Fecha_trabajo> getFecha(int codigo_cho, String time_fecha) {
        ArrayList<Fecha_trabajo> fecha_trabajo = new ArrayList<Fecha_trabajo>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            st.executeUpdate("set lc_time='es_ES.UTF-8';");
            rs = st.executeQuery("SELECT cod_fecha, codigo_cho,CONCAT(to_char(time_fecha,'TMDay'), ', ', EXTRACT(DAY FROM time_fecha),' de ',to_char(time_fecha,'TMmonth'), ' de ', EXTRACT(YEAR FROM time_fecha)), status FROM fecha_trabajo where codigo_cho=" + codigo_cho + " and status=" + true +" and time_fecha > '" + time_fecha + "' and time_fecha > CURRENT_DATE order by time_fecha asc LIMIT 5;");
            //rs = st.executeQuery("SELECT * FROM fecha_trabajo where codigo_cho=" + codigo_cho + " and status=" + true +" and time_fecha > '" + time_fecha + "' order by cod_fecha asc;");
            while (rs.next()) {
                fecha_trabajo.add(new Fecha_trabajo(rs.getInt(1),rs.getInt(2), rs.getString(3),rs.getBoolean(4)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return fecha_trabajo;
    }
    public String get1Fecha(int cod_fecha) {
        String fecha_text = "2000-01-01";
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            //rs = st.executeQuery("SELECT * FROM fecha_trabajo where cod_fecha=" + cod_fecha + ";");
             st.executeUpdate("set lc_time='es_ES.UTF-8';");
            rs = st.executeQuery("SELECT * FROM fecha_trabajo where cod_fecha=" + cod_fecha + ";");
            while (rs.next()) {
                fecha_text = rs.getString(3);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return fecha_text;
    }
    public ArrayList<Hora_trabajo> getHora(int cod_fecha) {
        ArrayList<Hora_trabajo> hora_trabajo = new ArrayList<Hora_trabajo>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT cod_hora, cod_fecha, to_char(time_hora,'HH12:MI:SS a.m.'), status FROM hora_trabajo where cod_fecha=" + cod_fecha + " and status=" + true +" order by cod_hora asc;");
            while (rs.next()) {
                hora_trabajo.add(new Hora_trabajo(rs.getInt(1),rs.getInt(2), rs.getString(3),rs.getBoolean(4)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return hora_trabajo;
    }
    public ArrayList<Mes_trabajo> obtenerMeses(int codigo_cho) {
        ArrayList<Mes_trabajo> horarios = new ArrayList<Mes_trabajo>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            st.executeUpdate("set lc_time='es_ES.UTF-8';");
            rs = st.executeQuery("SELECT cod_mes, codigo_cho, CONCAT(to_char(registro_mes,'TMMonth'), ' de ', EXTRACT(YEAR FROM registro_mes)) FROM mes_trabajo where codigo_cho=" + codigo_cho + "  order by registro_mes asc;");
            //rs = st.executeQuery("SELECT * FROM horario where codigo_cho=" + codigo_cho + " and status=" + true +" order by cod_horario asc;");
            while (rs.next()) {
                horarios.add(new Mes_trabajo(rs.getInt(1),rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return horarios;
    }
    public int registrarHorario(int codigo_cho, String registro_mes) {
        Statement st;
        ResultSet rs;
        int responding = 0;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("CALL generar_horario(0," + codigo_cho +",'" + registro_mes +"');");
            while (rs.next()) {
                responding = rs.getInt(1);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return responding;
    }
}
