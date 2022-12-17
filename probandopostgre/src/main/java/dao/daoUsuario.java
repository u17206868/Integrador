/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import entidades.Usuario;
public class daoUsuario extends conexionJDBC
{
    public ArrayList<Usuario> obtenerLista() {
        ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM usuario;");
            while (rs.next()) {
                usuarios.add(new Usuario(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return usuarios;
    }
    //ORDER BY column1, column2, ... ASC
    public ArrayList<Usuario> filtrarLista(String dni) {
        ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM usuario where dni LIKE '%" + dni +"%' order by id asc;");
            while (rs.next()) {
                usuarios.add(new Usuario(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return usuarios;
    }
    public Usuario obtenerUsuario(String id) {
        Usuario usuario = new Usuario();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM usuario where id=" + id +";");
            while (rs.next()) {
                usuario = new Usuario(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }
    public int dniUsuario(String dni, String id) 
    {
        int response = 255;
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try 
        {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM usuario where dni='" + dni + "';");
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
    public void nuevoUsuario(Usuario usuario) {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "INSERT INTO usuario (cargo, nombres, apellidos, direccion, correo, celular, dni, password) VALUES "
                    + "('" + "2" +"', '" + usuario.getNombres() +"', '" + usuario.getApellidos()+"', '" + usuario.getDireccion() +"', '" +
                    usuario.getCorreo() +"', '" + usuario.getCelular() +"', '" + usuario.getDni() +"', '" + usuario.getPassword() +"')";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void modificarUsuario(Usuario usuario){
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "update usuario set nombres='" + usuario.getNombres() +"',apellidos='" + usuario.getApellidos()+"',direccion='" + usuario.getDireccion() +"',correo='" +
                    usuario.getCorreo() +"',celular='" + usuario.getCelular() +"',dni='" + usuario.getDni() +"',password='" + usuario.getPassword() +"' where id=" + usuario.getId() +";";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void eliminarUsuario(String id)
    {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            st.executeUpdate("DELETE FROM usuario where id=" + id +";");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
