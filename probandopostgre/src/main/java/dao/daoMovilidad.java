package dao;

import entidades.Movilidad;
import java.sql.*;
import java.util.ArrayList;

public class daoMovilidad extends conexionJDBC
{
    public ArrayList<Movilidad> filtrarLista(String marca_mo) {
        ArrayList<Movilidad> movilidades = new ArrayList<Movilidad>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM movilidad where marca_mo LIKE '%" + marca_mo +"%' order by id_movilidad asc;");
            while (rs.next()) {
                movilidades.add(new Movilidad(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),rs.getBoolean(5)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return movilidades;
    }
    public ArrayList<Movilidad> obtenerLista() {
        ArrayList<Movilidad> movilidades = new ArrayList<Movilidad>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM movilidad where status=" + true + " order by id_movilidad asc;");
            while (rs.next()) {
                movilidades.add(new Movilidad(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),rs.getBoolean(5)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return movilidades;
    }
    public Movilidad obtenerMovilidad(String id) {
        Movilidad movilidad = new Movilidad();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM movilidad where id_movilidad=" + id +";");
            while (rs.next()) {
                movilidad = new Movilidad(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),rs.getBoolean(5));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return movilidad;
    }
    public void nuevaMovilidad(Movilidad movilidad) {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "INSERT INTO movilidad (marca_mo, modelo_mo, placa_mo, status) VALUES "
                    + "('" + movilidad.getMarca_mo()+"', '" + movilidad.getModelo_mo() +"', '" +
                    movilidad.getPlaca_mo() +"', " + movilidad.getStatus() +")";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void modificarMovilidad(Movilidad movilidad){
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "update movilidad set marca_mo='" + movilidad.getMarca_mo() +"',modelo_mo='" + movilidad.getModelo_mo()+"',placa_mo='" + movilidad.getPlaca_mo() +"',status=" + movilidad.getStatus() +" where id_movilidad=" + movilidad.getCod_mo() +";";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void eliminarMovilidad(String id)
    {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            st.executeUpdate("DELETE FROM movilidad where id_movilidad=" + id +";");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
