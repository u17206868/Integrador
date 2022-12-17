/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import java.util.ArrayList;

import dao.daoCategoria;
import entidades.Categoria;

public class gestionCategoria {

    public ArrayList<Categoria> filtrarCategoria(String descripcion_ca)
    {
        return new daoCategoria().filtrarLista(descripcion_ca);
    }
    public ArrayList<Categoria> obtenerLista()
    {
        return new daoCategoria().obtenerLista();
    }
    public Categoria obtenerCategoria(String id)
    {
        return new daoCategoria().obtenerCategoria(id);
    }
    public int categoriagetID(String descripcion_ca)
    {
        return new daoCategoria().categoriagetID(descripcion_ca);
    }
    public void registrarCategoria(Categoria categoria){
        new daoCategoria().nuevaCategoria(categoria);
    }
    public void modificarCategoria(Categoria categoria){
        new daoCategoria().modificarCategoria(categoria);
    }
    public void eliminarCategoria(String id){
        new daoCategoria().eliminarCategoria(id);
    }
    public String getIDCategoria(String descripcion_ca){
        return new daoCategoria().getIDCategoria(descripcion_ca);
    }
}
