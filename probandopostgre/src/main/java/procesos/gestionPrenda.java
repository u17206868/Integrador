/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import dao.daoPrenda;
import entidades.Prenda;
import java.util.ArrayList;

/**
 *
 * @author tianb
 */
public class gestionPrenda {
    public ArrayList<Prenda> filtrarPrenda(String nombre_prenda)
    {
        return new daoPrenda().filtrarLista(nombre_prenda);
    }
    public ArrayList<Prenda> obtenerLista()
    {
        return new daoPrenda().obtenerLista();
    }
    public Prenda obtenerPrenda(String id)
    {
        return new daoPrenda().obtenerPrenda(id);
    }
    public int prendagetID(String nombre_prenda)
    {
        return new daoPrenda().prendagetID(nombre_prenda);
    }
    public void registrarPrenda(Prenda prenda){
        new daoPrenda().nuevoPrenda(prenda);
    }
    public void modificarPrenda(Prenda prenda){
        new daoPrenda().modificarPrenda(prenda);
    }
    public void eliminarPrenda(String id){
        new daoPrenda().eliminarPrenda(id);
    }
}
