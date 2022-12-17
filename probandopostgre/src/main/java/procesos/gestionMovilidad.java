/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import dao.daoMovilidad;
import entidades.Movilidad;
import java.util.ArrayList;

public class gestionMovilidad {
    public ArrayList<Movilidad> filtrarMovilidades(String marca_mo)
    {
        return new daoMovilidad().filtrarLista(marca_mo);
    }
    public Movilidad obtenerMovilidad(String id)
    {
        return new daoMovilidad().obtenerMovilidad(id);
    }
    public void registrarMovilidad(Movilidad movilidad){
        new daoMovilidad().nuevaMovilidad(movilidad);
    }
    public void modificarMovilidad(Movilidad movilidad){
        new daoMovilidad().modificarMovilidad(movilidad);
    }
    public void eliminarMovilidad(String id){
        new daoMovilidad().eliminarMovilidad(id);
    }
}
