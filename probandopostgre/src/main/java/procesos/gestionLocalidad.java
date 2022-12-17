/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package procesos;

import dao.daoLocalidad;
import entidades.Departamento;
import entidades.Provincia;
import entidades.Distrito;
import java.util.ArrayList;

/**
 *
 * @author tianb
 */
public class gestionLocalidad {
    public ArrayList<Departamento> listaDepartamento()
    {
        return new daoLocalidad().listaDepartamento();
    }
    public ArrayList<Provincia> listaProvincia(int cod_departamento)
    {
        return new daoLocalidad().listaProvincia(cod_departamento);
    }
    public ArrayList<Distrito> listaDistrito(int cod_provincia)
    {
        return new daoLocalidad().listaDistrito(cod_provincia);
    }
    public Departamento getDepartamento(int cod_departamento)
    {
        return new daoLocalidad().getDepartamento(cod_departamento);
    }
    public Provincia getProvincia(int cod_provincia)
    {
        return new daoLocalidad().getProvincia(cod_provincia);
    }
    public Distrito getDistrito(int cod_distrito)
    {
        return new daoLocalidad().getDistrito(cod_distrito);
    }
}
