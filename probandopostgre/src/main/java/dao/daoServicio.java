/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import entidades.Servicio;
public class daoServicio extends conexionJDBC
{
    public ArrayList<Servicio> filtrarLista(String descripcion_se) {
        ArrayList<Servicio> servicios = new ArrayList<Servicio>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT t1.codigo_se, t2.descripcion_ca, t1.descripcion_se, t1.precio, t1.status FROM servicio t1 inner join categoria t2 on t1.codigo_ca = t2.codigo_ca where t1.descripcion_se LIKE '%" + descripcion_se + "%' order by codigo_se asc;");
            //rs = st.executeQuery("SELECT * FROM servicio where descripcion_se LIKE '%" + descripcion_se +"%' order by codigo_se asc;");
            while (rs.next()) {
                servicios.add(new Servicio(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getBoolean(5)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return servicios;
    }
    public ArrayList<Servicio> filtrarCategoria(String codigo_ca) {
        ArrayList<Servicio> servicios = new ArrayList<Servicio>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM servicio where codigo_ca =" + codigo_ca +" and status=" + true +" order by codigo_se asc;");
            while (rs.next()) {
                servicios.add(new Servicio(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getBoolean(5)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return servicios;
    }
    public Servicio obtenerServicio(String id) {
        Servicio servicio = new Servicio();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM servicio where codigo_se=" + id +";");
            while (rs.next()) {
                servicio = new Servicio(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getBoolean(5));
                break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return servicio;
    }
    public int obtenerPrecio(String descripcion_se) {
        int precio = 0;
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM servicio where descripcion_se='" + descripcion_se +"';");
            while (rs.next()) {
                precio = rs.getInt(4);
                break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return precio;
    }
    public int serviciogetID(String descripcion_se) {
        Statement st;
        ResultSet rs;
        int indice = 0;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM servicio where descripcion_se='" + descripcion_se +"';");
            while (rs.next()) {
                indice = rs.getInt(1);
                break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return indice;
    }
    public void nuevoServicio(Servicio servicio) {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "INSERT INTO servicio (codigo_ca, descripcion_se, precio, status) VALUES "
                    + "(" + servicio.getCodigo_ca()+", '" + servicio.getDescripcion_se() +"', " + servicio.getPrecio_se() +", " + servicio.getStatus() +")";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void modificarServicio(Servicio servicio){
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "update servicio set codigo_ca=" + servicio.getCodigo_ca() +",descripcion_se='" + servicio.getDescripcion_se()+"',precio=" + servicio.getPrecio_se() +",status=" + servicio.getStatus() +" where codigo_se=" + servicio.getCodigo_se() +";";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void eliminarServicio(String id)
    {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            st.executeUpdate("DELETE FROM servicio where codigo_se=" + id +";");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
