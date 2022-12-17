/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;

import entidades.Categoria;

public class daoCategoria extends conexionJDBC
{
    public ArrayList<Categoria> filtrarLista(String descripcion_ca) {
        ArrayList<Categoria> categorias = new ArrayList<>();
        ResultSet rs;
        try {
            String query = "SELECT * FROM categoria where descripcion_ca LIKE ? order by codigo_ca asc;";
            PreparedStatement pstmt = conectar().prepareStatement(query);
            pstmt.setString(1, "%" + descripcion_ca + "%");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                categorias.add(new Categoria(rs.getString(1), rs.getString(2),rs.getBoolean(3)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categorias;
    }
    public ArrayList<Categoria> obtenerLista() {
        ArrayList<Categoria> categorias = new ArrayList<>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM categoria where status=true order by codigo_ca asc;");
            while (rs.next()) {
                categorias.add(new Categoria(rs.getString(1), rs.getString(2),rs.getBoolean(3)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categorias;
    }
    public Categoria obtenerCategoria(String id) {
        Categoria categoria = new Categoria();
        ResultSet rs;
        try {
            String query = "SELECT * FROM categoria where codigo_ca=?;";
            PreparedStatement pstmt = conectar().prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(id));
            rs = pstmt.executeQuery();
            while (rs.next()) {
                categoria = new Categoria(rs.getString(1), rs.getString(2),rs.getBoolean(3));
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoria;
    }
    public String getIDCategoria(String descripcion_ca) {
        ResultSet rs;
        String indice = "0";
        try {
            String query = "SELECT * FROM categoria where descripcion_ca=?;";
            PreparedStatement pstmt = conectar().prepareStatement(query);
            pstmt.setString(1, descripcion_ca);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                indice = rs.getString(1);
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return indice;
    }
    public int categoriagetID(String descripcion_ca) {
        Statement st;
        ResultSet rs;
        int indice = 0;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM categoria where descripcion_ca='" + descripcion_ca +"';");
            while (rs.next()) {
                indice = rs.getInt(1);
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return indice;
    }
    public void nuevaCategoria(Categoria categoria) {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "INSERT INTO categoria (descripcion_ca, status) VALUES "
                    + "('" + categoria.getDescripcion_ca() +"', " + categoria.getStatus() +")";
            st.executeUpdate(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void modificarCategoria(Categoria categoria){
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "update categoria set descripcion_ca='" + categoria.getDescripcion_ca() +"',status=" + categoria.getStatus() +" where codigo_ca=" + categoria.getCodigo_ca() +";";
            st.executeUpdate(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void eliminarCategoria(String id)
    {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            st.executeUpdate("DELETE FROM categoria where codigo_ca=" + id +";");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
