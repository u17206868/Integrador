/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Cliente 
{
    private String id;
    private String rango;
    private String nombres;
    private String apellidos;
    private String direccion;
    private String correo;
    private String celular;
    private String dni;
    private String password;

    public Cliente(String id, String rango, String nombres, String apellidos, String direccion, 
            String correo, String celular, String dni, String password) {
        this.id = id;
        this.rango = rango;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.correo = correo;
        this.celular = celular;
        this.dni = dni;
        this.password = password;
    }

    public Cliente() 
    {
        this.id = "0";
        this.rango = "0";
        this.nombres = "";
        this.apellidos = "";
        this.direccion = "";
        this.correo = "";
        this.celular = "";
        this.dni = "0";
        this.password = "";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRango() {
        return rango;
    }
    public void setRango(String rango) {
        this.rango = rango;
    }
    public String getNombres() {
        return nombres;
    }
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    public String getApellidos() {
        return apellidos;
    }
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getCorreo() {
        return correo;
    }
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public String getCelular() {
        return celular;
    }
    public void setCelular(String celular) {
        this.celular = celular;
    }
    public String getDni() {
        return dni;
    }
    public void setDni(String dni) {
        this.dni = dni;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
