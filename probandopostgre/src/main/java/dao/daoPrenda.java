/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidades.Prenda;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author tianb
 */
public class daoPrenda extends conexionJDBC
{
    public ArrayList<Prenda> filtrarLista(String nombre_prenda) {
        ArrayList<Prenda> prendas = new ArrayList<Prenda>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM prendas where nombre_prenda LIKE '%" + nombre_prenda +"%' order by codigo_prenda asc;");
            while (rs.next()) {
                prendas.add(new Prenda(rs.getInt(1), rs.getString(2),
                        rs.getBoolean(3)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return prendas;
    }
    public ArrayList<Prenda> obtenerLista() {
        ArrayList<Prenda> prendas = new ArrayList<Prenda>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM prendas where status=" + true +" order by codigo_prenda asc;");
            while (rs.next()) {
                prendas.add(new Prenda(rs.getInt(1), rs.getString(2),
                        rs.getBoolean(3)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return prendas;
    }
    public Prenda obtenerPrenda(String id) {
        Prenda prenda = new Prenda();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM prendas where codigo_prenda=" + id +";");
            while (rs.next()) {
                prenda = new Prenda(rs.getInt(1), rs.getString(2), rs.getBoolean(3));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return prenda;
    }
    public int prendagetID(String nombre_prenda) {
        int result = 0;
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM prendas where nombre_prenda='" + nombre_prenda +"';");
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public void nuevoPrenda(Prenda prenda) {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "INSERT INTO prendas (nombre_prenda, status) VALUES "
                    + "('" + prenda.getNombre_prenda() +"', " + prenda.getStatus() +")";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void modificarPrenda(Prenda prenda){
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "update prendas set nombre_prenda='" + prenda.getNombre_prenda() + "',status=" + prenda.getStatus() +" where codigo_prenda=" + prenda.getCodigo_prenda() +";";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void eliminarPrenda(String id)
    {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            st.executeUpdate("DELETE FROM prendas where codigo_prendas=" + id +";");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
