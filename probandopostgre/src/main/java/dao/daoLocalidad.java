/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidades.Departamento;
import entidades.Provincia;
import entidades.Distrito;
import java.sql.*;
import java.util.ArrayList;
public class daoLocalidad extends conexionJDBC{
    public ArrayList<Departamento> listaDepartamento() {
        ArrayList<Departamento> departamentos = new ArrayList<Departamento>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM departamentos where cod_pais=1 order by cod_departamento asc;");
            while (rs.next()) {
                departamentos.add(new Departamento(rs.getInt(1), rs.getString(2),
                        rs.getInt(3)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return departamentos;
    }
    public Departamento getDepartamento(int cod_departamento) {
        Departamento departamento = new Departamento();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM departamentos where cod_departamento=" + cod_departamento +";");
            while (rs.next()) {
                departamento = new Departamento(rs.getInt(1), rs.getString(2),
                        rs.getInt(3));
                break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return departamento;
    }
    public ArrayList<Provincia> listaProvincia(int cod_departamento) {
        ArrayList<Provincia> provincias = new ArrayList<Provincia>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM provincia where cod_departamento=" + cod_departamento +" order by cod_provincia asc;");
            while (rs.next()) {
                provincias.add(new Provincia(rs.getInt(1), rs.getString(2),
                        rs.getInt(3)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return provincias;
    }
    public Provincia getProvincia(int cod_provincia) {
        Provincia provincia = new Provincia();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM provincia where cod_provincia=" + cod_provincia +";");
            while (rs.next()) {
                provincia = new Provincia(rs.getInt(1), rs.getString(2),
                        rs.getInt(3));
                break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return provincia;
    }
    public ArrayList<Distrito> listaDistrito(int cod_provincia) {
        ArrayList<Distrito> distritos = new ArrayList<Distrito>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM distrito where cod_provincia=" + cod_provincia +" order by cod_distrito asc;");
            while (rs.next()) {
                distritos.add(new Distrito(rs.getInt(1), rs.getString(2),
                        rs.getInt(3)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return distritos;
    }
    public Distrito getDistrito(int cod_distrito) {
        Distrito distrito = new Distrito();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM distrito where cod_distrito=" + cod_distrito +";");
            while (rs.next()) {
                distrito = new Distrito(rs.getInt(1), rs.getString(2),
                        rs.getInt(3));
                break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return distrito;
    }
}
