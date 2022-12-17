/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidades.Chofer;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author tianb
 */
public class daoChofer extends conexionJDBC
{
    public ArrayList<Chofer> filtrarLista(String nombre_cho) {
        ArrayList<Chofer> choferes = new ArrayList<>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM chofer where nombre_cho LIKE '%" + nombre_cho +"%' order by codigo_cho asc;");
            while (rs.next()) {
                choferes.add(new Chofer(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),rs.getBoolean(6),rs.getBoolean(7)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return choferes;
    }
    public ArrayList<Chofer> obtenerLista() {
        ArrayList<Chofer> choferes = new ArrayList<>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM chofer where status=" + true + " order by codigo_cho asc;");
            while (rs.next()) {
                choferes.add(new Chofer(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),rs.getBoolean(6),rs.getBoolean(7)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return choferes;
    }
    public ArrayList<Chofer> listaRecolector() {
        ArrayList<Chofer> choferes = new ArrayList<>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM chofer where status=" + true + " and tipo_chofer=" + true +" order by codigo_cho asc;");
            while (rs.next()) {
                choferes.add(new Chofer(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),rs.getBoolean(6),rs.getBoolean(7)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return choferes;
    }
    public ArrayList<Chofer> listaRepartidor() {
        ArrayList<Chofer> choferes = new ArrayList<>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM chofer where status=" + true + " and tipo_chofer=" + false +" order by codigo_cho asc;");
            while (rs.next()) {
                choferes.add(new Chofer(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),rs.getBoolean(6),rs.getBoolean(7)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return choferes;
    }
    public int getMovilidad(String id) {
        int result = 0;
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM chofer where codigo_cho=" + id +";");
            while (rs.next()) {
                result = rs.getInt(2);
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public Chofer obtenerChofer(String id) {
        Chofer chofer = new Chofer();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM chofer where codigo_cho=" + id +";");
            while (rs.next()) {
                chofer = new Chofer(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),rs.getBoolean(6),rs.getBoolean(7));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return chofer;
    }
    public void nuevoChofer(Chofer chofer) {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "INSERT INTO chofer (id_movilidad, nombre_cho, apellido_cho, disponibilidad_cho, status, tipo_chofer) VALUES "
                    + "('" + chofer.getId_movilidad()+"', '" + chofer.getNombre_cho()+"', '" + chofer.getApellido_cho() +"', '" +
                    chofer.getDisponibilidad_cho() +"', " + chofer.getStatus() +", " + chofer.getTipo_chofer() +")";
            st.executeUpdate(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void modificarChofer(Chofer chofer){
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "update chofer set id_movilidad='" + chofer.getId_movilidad() +"',nombre_cho='" + chofer.getNombre_cho()+"',apellido_cho='" + chofer.getApellido_cho()+"',disponibilidad_cho='" + chofer.getDisponibilidad_cho() +"',status=" + chofer.getStatus() +",tipo_chofer=" + chofer.getTipo_chofer() +" where codigo_cho=" + chofer.getCodigo_cho() +";";
            st.executeUpdate(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void eliminarChofer(String id)
    {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            st.executeUpdate("DELETE FROM chofer where codigo_cho=" + id +";");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
