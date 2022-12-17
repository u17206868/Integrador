/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import java.util.ArrayList;
import entidades.Chofer;
import dao.daoChofer;
public class gestionChofer 
{
    public ArrayList<Chofer> filtrarChofer(String nombre_cho)
    {
        return new daoChofer().filtrarLista(nombre_cho);
    }
    public ArrayList<Chofer> listaRecolector()
    {
        return new daoChofer().listaRecolector();
    }
    public ArrayList<Chofer> listaRepartidor()
    {
        return new daoChofer().listaRepartidor();
    }
    public Chofer obtenerChofer(String id)
    {
        return new daoChofer().obtenerChofer(id);
    }
    public int getMovilidad(String id)
    {
        return new daoChofer().getMovilidad(id);
    }
    public void registrarChofer(Chofer chofer){
        new daoChofer().nuevoChofer(chofer);
    }
    public void modificarChofer(Chofer chofer){
        new daoChofer().modificarChofer(chofer);
    }
    public void eliminarChofer(String id){
        new daoChofer().eliminarChofer(id);
    }
}
