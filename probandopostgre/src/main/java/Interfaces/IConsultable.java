package Interfaces;

public interface IConsultable {
    public void filtrarLista(String foreign_key);
    public <T> T obtenerEntidad(String id);
}
