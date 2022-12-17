package entidades;

public class Chofer {

    private String codigo_cho;
    private String id_movilidad;
    private String nombre_cho;
    private String apellido_cho;
    private String disponibilidad_cho;
    private boolean status;
    private boolean tipo_chofer;
    public Chofer() 
    {
        this.codigo_cho = "";
        this.id_movilidad = "";
        this.nombre_cho = "";
        this.apellido_cho = "";
        this.disponibilidad_cho = "";
        this.status = false;
        this.tipo_chofer = false;
    }

    public Chofer(String codigo_cho, String id_movilidad, String nombre_cho, String apellido_cho, String disponibilidad_cho, boolean status, boolean tipo_chofer) {
        this.codigo_cho = codigo_cho;
        this.id_movilidad = id_movilidad;
        this.nombre_cho = nombre_cho;
        this.apellido_cho = apellido_cho;
        this.disponibilidad_cho = disponibilidad_cho;
        this.status = status;
        this.tipo_chofer = tipo_chofer;
    }

    public String getId_movilidad() {
        return id_movilidad;
    }

    public void setId_movilidad(String id_movilidad) {
        this.id_movilidad = id_movilidad;
    }

    public String getCodigo_cho() {
        return codigo_cho;
    }

    public void setCodigo_cho(String codigo_cho) {
        this.codigo_cho = codigo_cho;
    }

    public String getNombre_cho() {
        return nombre_cho;
    }

    public void setNombre_cho(String nombre_cho) {
        this.nombre_cho = nombre_cho;
    }

    public String getApellido_cho() {
        return apellido_cho;
    }

    public void setApellido_cho(String apellido_cho) {
        this.apellido_cho = apellido_cho;
    }


    public String getDisponibilidad_cho() {
        return disponibilidad_cho;
    }

    public void setDisponibilidad_cho(String disponibilidad_cho) {
        this.disponibilidad_cho = disponibilidad_cho;
    }
    
    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean getTipo_chofer() {
        return tipo_chofer;
    }

    public void setTipo_chofer(boolean tipo_chofer) {
        this.tipo_chofer = tipo_chofer;
    }
    
}
