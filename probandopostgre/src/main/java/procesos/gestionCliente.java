/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;
import java.util.ArrayList;
import entidades.Cliente;
import dao.daoCliente;
public class gestionCliente {
    public ArrayList<Cliente> obtenerClientes()
    {
        return new daoCliente().obtenerLista();
    }
    public ArrayList<Cliente> filtrarClientes(String dni)
    {
        return new daoCliente().filtrarLista(dni);
    }
    public Cliente obtenerCliente(String id)
    {
        return new daoCliente().obtenerCliente(id);
    }
    public int obtenerDni(String dni)
    {
        return new daoCliente().dniCliente(dni);
    }
    public void registrarCliente(Cliente cliente){
        new daoCliente().nuevoCliente(cliente);
    }
    public void modificarCliente(Cliente cliente){
        new daoCliente().modificarCliente(cliente);
    }
    public void eliminarCliente(String id){
        new daoCliente().eliminarCliente(id);
    }
    public Cliente obtenerClienteDNI(String dni)
    {
        return new daoCliente().obtenerViaDNI(dni);
    }
    public ArrayList<Cliente> autoCompletar(String dni)
    {
        return new daoCliente().autoCompletar(dni);
    }
    public void modificarPassword(String password, String dni, int type)
    {
        new daoCliente().modificarPassword(password, dni, type);
    }
}
