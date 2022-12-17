/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import dao.daoLogin;
import javax.servlet.http.HttpSession;
public class gestionLogin 
{
    public int loginUsuario(String dni, String password, HttpSession sesion)
    {
        return new daoLogin().usuarioLogin(dni, password, sesion);
    }
    public int loginCliente(String dni, String password, HttpSession sesion)
    {
        return new daoLogin().clienteLogin(dni, password, sesion);
    }
}
