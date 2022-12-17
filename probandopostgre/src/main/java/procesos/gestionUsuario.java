/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;
import java.util.ArrayList;
import entidades.Usuario;
import dao.daoUsuario;
public class gestionUsuario {
    public ArrayList<Usuario> obtenerUsuarios()
    {
        return new daoUsuario().obtenerLista();
    }
    public ArrayList<Usuario> filtrarUsuarios(String dni)
    {
        return new daoUsuario().filtrarLista(dni);
    }
    public Usuario obtenerUsuario(String id)
    {
        return new daoUsuario().obtenerUsuario(id);
    }
    public int obtenerDni(String dni, String id)
    {
        return new daoUsuario().dniUsuario(dni, id);
    }
    public void registrarUsuario(Usuario usuario){
        new daoUsuario().nuevoUsuario(usuario);
    }
    public void modificarUsuario(Usuario usuario){
        new daoUsuario().modificarUsuario(usuario);
    }
    public void eliminarUsuario(String id){
        new daoUsuario().eliminarUsuario(id);
    }
}
