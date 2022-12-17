/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import javax.servlet.http.*;

public class daoLogin extends conexionJDBC
{
    public int clienteLogin(String dni, String password, HttpSession sesion) {
        int response = 0;
        ResultSet rs;
        try {
            String query = "SELECT * FROM cliente where dni=? and password=?;";
            PreparedStatement pstmt = conectar().prepareStatement(query);
            pstmt.setString(1, dni);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            if (!rs.wasNull()) {
                while (rs.next()) {
                    sesion.setAttribute("id", rs.getString(1));
                    sesion.setAttribute("cargo", "1");
                    sesion.setAttribute("dni", rs.getString(7));
                    sesion.setAttribute("nombres", rs.getString(2));
                    response = 1;
                }
            } else {
                response = 0;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return response;
    }

    public int usuarioLogin(String dni, String password, HttpSession sesion) {
        int response = 0;
        ResultSet rs;
        try {
            String query = "SELECT * FROM usuario where dni=? and password=?;";
            PreparedStatement pstmt = conectar().prepareStatement(query);
            pstmt.setString(1, dni);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                sesion.setAttribute("id", rs.getString(1));
                sesion.setAttribute("cargo", rs.getString(2));
                sesion.setAttribute("dni", rs.getString(8));
                sesion.setAttribute("nombres", rs.getString(3));
                response = Integer.parseInt(rs.getString(2));
                break;
            }
        } catch (NumberFormatException | SQLException e) {
            throw new RuntimeException(e);
        }
        return response;
    }
}
