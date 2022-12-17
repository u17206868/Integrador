/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import entidades.Cliente;

public class daoCliente extends conexionJDBC
{

    public ArrayList<Cliente> obtenerLista() {
        ArrayList<Cliente> clientes = new ArrayList<Cliente>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM cliente;");
            while (rs.next()) {
                clientes.add(new Cliente(rs.getString(1), "1", rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return clientes;
    }
    //ORDER BY column1, column2, ... ASC
    public ArrayList<Cliente> filtrarLista(String dni) {
        ArrayList<Cliente> clientes = new ArrayList<Cliente>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM cliente where dni LIKE '%" + dni +"%' order by id asc;");
            while (rs.next()) {
                clientes.add(new Cliente(rs.getString(1), "1", rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return clientes;
    }
    public ArrayList<Cliente> autoCompletar(String dni) {
        ArrayList<Cliente> clientes = new ArrayList<Cliente>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM cliente where dni LIKE '%" + dni +"%' order by id asc LIMIT 10;");
            while (rs.next()) {
                clientes.add(new Cliente(rs.getString(1), "1", rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return clientes;
    }
    public Cliente obtenerCliente(String id) {
        Cliente cliente = new Cliente();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM cliente where id=" + id +";");
            while (rs.next()) {
                cliente = new Cliente(rs.getString(1), "1", rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return cliente;
    }
    public Cliente obtenerViaDNI(String dni) {
        Cliente cliente = new Cliente();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM cliente where dni='" + dni +"';");
            while (rs.next()) {
                cliente = new Cliente(rs.getString(1), "1", rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8));
                break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return cliente;
    }
    public int dniCliente(String dni) 
    {
        int response = 255;
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try 
        {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM cliente where dni='" + dni + "';");
            while (rs.next())
            {
                response = 1;
                break;
            }
            if (response == 255)
            {
                response = 0;
            }
        } 
        catch (Exception e) 
        {
            throw new RuntimeException(e);
        }
        return response;
    }
    public void nuevoCliente(Cliente cliente) {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "INSERT INTO cliente (nombres, apellidos, direccion, correo, celular, dni, password) VALUES "
                    + "('" + cliente.getNombres() +"', '" + cliente.getApellidos()+"', '" + cliente.getDireccion() +"', '" +
                    cliente.getCorreo() +"', '" + cliente.getCelular() +"', '" + cliente.getDni() +"', '" + cliente.getPassword() +"')";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void modificarCliente(Cliente cliente){
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "update cliente set nombres='" + cliente.getNombres() +"',apellidos='" + cliente.getApellidos()+"',direccion='" + cliente.getDireccion() +"',correo='" +
                    cliente.getCorreo() +"',celular='" + cliente.getCelular() +"',dni='" + cliente.getDni() +"',password='" + cliente.getPassword() +"' where id=" + cliente.getId() +";";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void modificarPassword(String password, String dni, int type){
        try {
            if (type == 1)
            {
                String query = "update cliente set password=? where dni=?;";
                PreparedStatement pstmt = conectar().prepareStatement(query);
                pstmt.setString(1, password);
                pstmt.setString(2, dni);
                pstmt.executeUpdate();
            } else
            {
                String query = "update usuario set password=? where dni=?;";
                PreparedStatement pstmt = conectar().prepareStatement(query);
                pstmt.setString(1, password);
                pstmt.setString(2, dni);
                pstmt.executeUpdate();
            }  
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void eliminarCliente(String id)
    {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            st.executeUpdate("DELETE FROM cliente where id=" + id +";");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
