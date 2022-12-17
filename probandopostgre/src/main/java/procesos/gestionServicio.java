/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import java.util.ArrayList;
import entidades.Servicio;
import dao.daoServicio;
public class gestionServicio 
{
    public ArrayList<Servicio> filtrarServicio(String descripcion_se)
    {
        return new daoServicio().filtrarLista(descripcion_se);
    }
    public ArrayList<Servicio> filtrarCategoria(String codigo_ca)
    {
        return new daoServicio().filtrarCategoria(codigo_ca);
    }
    public Servicio obtenerServicio(String id)
    {
        return new daoServicio().obtenerServicio(id);
    }
    public int serviciogetID(String descripcion_se)
    {
        return new daoServicio().serviciogetID(descripcion_se);
    }
    public int obtenerPrecio(String descripcion_se)
    {
        return new daoServicio().obtenerPrecio(descripcion_se);
    }
    public void registrarServicio(Servicio servicio){
        new daoServicio().nuevoServicio(servicio);
    }
    public void modificarServicio(Servicio servicio){
        new daoServicio().modificarServicio(servicio);
    }
    public void eliminarServicio(String id){
        new daoServicio().eliminarServicio(id);
    }
}
