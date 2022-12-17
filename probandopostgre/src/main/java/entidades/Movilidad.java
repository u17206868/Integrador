package entidades;

public class Movilidad {

    private String cod_mo;
    private String marca_mo;
    private String modelo_mo;
    private String placa_mo;
    private boolean status;
    public Movilidad() {
        this.cod_mo = "";
        this.placa_mo = "";
        this.modelo_mo = "";
        this.marca_mo = "";
        this.status = false;
    }

    public Movilidad(String cod_mo,String marca_mo, String modelo_mo, String placa_mo, boolean status) {
        this.cod_mo = cod_mo;
        this.placa_mo = placa_mo;
        this.modelo_mo = modelo_mo;
        this.marca_mo = marca_mo;
        this.status = status;
    }

    public String getCod_mo() {
        return cod_mo;
    }

    public void setCod_mo(String cod_mo) {
        this.cod_mo = cod_mo;
    }

    public String getPlaca_mo() {
        return placa_mo;
    }

    public void setPlaca_mo(String placa_mo) {
        this.placa_mo = placa_mo;
    }

    public String getModelo_mo() {
        return modelo_mo;
    }

    public void setModelo_mo(String modelo_mo) {
        this.modelo_mo = modelo_mo;
    }

    public String getMarca_mo() {
        return marca_mo;
    }

    public void setMarca_mo(String marca_mo) {
        this.marca_mo = marca_mo;
    }
    
    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
