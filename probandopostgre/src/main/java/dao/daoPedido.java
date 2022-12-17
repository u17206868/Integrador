/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidades.Pedido;
import entidades.Solicitud;
import entidades.Detalle;
import entidades.Consultar;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import procesos.gestionPrenda;
import procesos.gestionCategoria;
import procesos.gestionServicio;

/**
 *
 * @author tianb
 */
public class daoPedido extends conexionJDBC {

    public ArrayList<Pedido> filtrarLista(String nombre_cliente, String busqueda) {
        ArrayList<Pedido> pedidos = new ArrayList<Pedido>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT t1.codigo_solicitud, CONCAT(t2.nombres,' ',t2.apellidos), t3.placa_mo, CONCAT(t4.nombre_cho, ' ', t4.apellido_cho), "
                    + "t5.time_fecha, t6.placa_mo, CONCAT(t7.nombre_cho, ' ', t7.apellido_cho), t8.time_fecha, t1.hora_fecha_ingreso, t1.hora_fecha_salida, t9.nombre_distrito, t2.correo, t1.precio_total, "
                    + "t1.status, t1.tipo_pedido, t1.cancelado, t2.dni from pedido t1 inner join cliente t2 on t1.id_cliente = t2.id inner join movilidad t3 on t1.mov_recolector = t3.id_movilidad "
                    + "inner join chofer t4 on t3.id_movilidad = t4.id_movilidad inner join fecha_trabajo t5 on t1.cod_fecha_recolector = t5.cod_fecha "
                    + "inner join movilidad t6 on t1.mov_repartidor = t6.id_movilidad inner join chofer t7 on t6.id_movilidad = t7.id_movilidad "
                    + "inner join fecha_trabajo t8 on t1.cod_fecha_repartidor = t8.cod_fecha inner join distrito t9 on t1.cod_distrito = t9. cod_distrito "
                    + "where " + busqueda + " LIKE '%" + nombre_cliente + "%' and t1.status=true and t1.cancelado=false order by t1.codigo_solicitud desc;");//t2.nombres
            while (rs.next()) {
                pedidos.add(new Pedido(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getString(12), rs.getInt(13), rs.getBoolean(14),
                        rs.getBoolean(15), rs.getBoolean(16),rs.getString(17)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return pedidos;
    }
    public ArrayList<Pedido> listaCompleta(String nombre_cliente, String busqueda) {
        ArrayList<Pedido> pedidos = new ArrayList<Pedido>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT t1.codigo_solicitud, CONCAT(t2.nombres,' ',t2.apellidos), t3.placa_mo, CONCAT(t4.nombre_cho, ' ', t4.apellido_cho), "
                    + "t5.time_fecha, t6.placa_mo, CONCAT(t7.nombre_cho, ' ', t7.apellido_cho), t8.time_fecha, t1.hora_fecha_ingreso, t1.hora_fecha_salida, t9.nombre_distrito, t2.correo, t1.precio_total, "
                    + "t1.status, t1.tipo_pedido, t1.cancelado, t2.dni from pedido t1 inner join cliente t2 on t1.id_cliente = t2.id inner join movilidad t3 on t1.mov_recolector = t3.id_movilidad "
                    + "inner join chofer t4 on t3.id_movilidad = t4.id_movilidad inner join fecha_trabajo t5 on t1.cod_fecha_recolector = t5.cod_fecha "
                    + "inner join movilidad t6 on t1.mov_repartidor = t6.id_movilidad inner join chofer t7 on t6.id_movilidad = t7.id_movilidad "
                    + "inner join fecha_trabajo t8 on t1.cod_fecha_repartidor = t8.cod_fecha inner join distrito t9 on t1.cod_distrito = t9. cod_distrito "
                    + "where " + busqueda + " LIKE '%" + nombre_cliente + "%' order by t1.codigo_solicitud desc;");//t2.nombres
            while (rs.next()) {
                pedidos.add(new Pedido(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getString(12), rs.getInt(13), rs.getBoolean(14),
                        rs.getBoolean(15), rs.getBoolean(16),rs.getString(17)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return pedidos;
    }
    public ArrayList<Detalle> filtrarDetalle(int codigo_solicitud) {
        ArrayList<Detalle> detalles = new ArrayList<Detalle>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String txtDetalle = "SELECT t1.codigo_detalle, t2.codigo_solicitud, t3.nombre_prenda, t1.cantidad, t4.descripcion_ca,"
                    + " t5.descripcion_se, t1.descripcion, t1.sub_total  from detalle t1 inner join pedido t2 on t1.codigo_solicitud = t2.codigo_solicitud"
                    + " inner join prendas t3 on t1.codigo_prenda = t3.codigo_prenda inner join categoria t4 on t1.codigo_ca = t4.codigo_ca "
                    + "inner join servicio t5 on t1.codigo_se = t5.codigo_se";
            if (codigo_solicitud == 0) {
                txtDetalle += ";";
            } else {
                txtDetalle += " where t1.codigo_solicitud=" + codigo_solicitud + ";";
            }
            rs = st.executeQuery(txtDetalle);
            while (rs.next()) {
                detalles.add(new Detalle(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return detalles;
    }
    
    public Pedido getPedido(int codigo_solicitud) {
        Pedido pedido = new Pedido();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT t1.codigo_solicitud, CONCAT(t2.nombres,' ',t2.apellidos), t3.placa_mo, CONCAT(t4.nombre_cho, ' ', t4.apellido_cho), "
                    + "t5.time_fecha, t6.placa_mo, CONCAT(t7.nombre_cho, ' ', t7.apellido_cho), t8.time_fecha, t1.hora_fecha_ingreso, t1.hora_fecha_salida, t9.nombre_distrito, t2.correo, t1.precio_total, "
                    + "t1.status, t1.tipo_pedido, t1.cancelado, t2.dni from pedido t1 inner join cliente t2 on t1.id_cliente = t2.id inner join movilidad t3 on t1.mov_recolector = t3.id_movilidad "
                    + "inner join chofer t4 on t3.id_movilidad = t4.id_movilidad inner join fecha_trabajo t5 on t1.cod_fecha_recolector = t5.cod_fecha "
                    + "inner join movilidad t6 on t1.mov_repartidor = t6.id_movilidad inner join chofer t7 on t6.id_movilidad = t7.id_movilidad "
                    + "inner join fecha_trabajo t8 on t1.cod_fecha_repartidor = t8.cod_fecha inner join distrito t9 on t1.cod_distrito = t9. cod_distrito "
                    + "where t1.codigo_solicitud =" + codigo_solicitud + ";");//t2.nombres
            while (rs.next()) {
                pedido = new Pedido(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getString(12), rs.getInt(13), rs.getBoolean(14),
                        rs.getBoolean(15), rs.getBoolean(16),rs.getString(17));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return pedido;
    }
    
    public ArrayList<Detalle> getDetalle(int codigo_solicitud) {
        ArrayList<Detalle> detalle = new ArrayList<Detalle>();
        Statement st;
        ResultSet rs;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String txtDetalle = "SELECT t1.codigo_detalle, t2.codigo_solicitud, t3.nombre_prenda, t1.cantidad, t4.descripcion_ca,"
                    + " t5.descripcion_se, t1.descripcion, t1.sub_total  from detalle t1 inner join pedido t2 on t1.codigo_solicitud = t2.codigo_solicitud"
                    + " inner join prendas t3 on t1.codigo_prenda = t3.codigo_prenda inner join categoria t4 on t1.codigo_ca = t4.codigo_ca "
                    + "inner join servicio t5 on t1.codigo_se = t5.codigo_se where t2.codigo_solicitud=" + codigo_solicitud + ";";
            rs = st.executeQuery(txtDetalle);
            while (rs.next()) {
                detalle.add(new Detalle(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return detalle;
    }

    public void modificarPedido(Solicitud solicitud) {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            String query = "update pedido set id_cliente=" + solicitud.getId_cliente() + ",mov_recolector=" + solicitud.getMov_recolector() + ",cod_fecha_recolector=" + solicitud.getCod_fecha_recolector() + ",cod_hora_recolector="
                    + solicitud.getCod_hora_recolector() + ",mov_repartidor=" + solicitud.getMov_repartidor() + ",cod_fecha_repartidor=" + solicitud.getCod_fecha_repartidor() + ",cod_hora_repartidor="
                    + solicitud.getCod_hora_repartidor() + ",cod_departamento=" + solicitud.getCod_departamento() + ",cod_provincia=" + solicitud.getCod_provincia()
                    + ",cod_distrito=" + solicitud.getCod_distrito() + ",precio_total=" + solicitud.getPrecio_total() + ",status=" + solicitud.getStatus() + " where id=" + solicitud.getCodigo_solicitud() + ";";
            st.executeUpdate(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void eliminarPedido(int codigo_solicitud) {
        Statement st;
        Connection cn = conectar();
        try {
            st = cn.createStatement();
            st.executeUpdate("DELETE FROM pedido where codigo_solicitud=" + codigo_solicitud + ";");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Consultar> generarArrayDetalles(String prendas_tipo, String prendas_cantidad, String prendas_categoria, String prendas_servicio, String prendas_descripcion, String sub_total) {
        ArrayList<Consultar> detalles = new ArrayList<Consultar>();
        String[] tipo = generarArreglo(prendas_tipo);
        String[] cantidad = generarArreglo(prendas_cantidad);
        String[] categoria = generarArreglo(prendas_categoria);
        String[] servicio = generarArreglo(prendas_servicio);
        String[] descripcion = generarArreglo(prendas_descripcion);
        String[] subtotal = generarArreglo(sub_total);
        for (int i = 0; i < tipo.length; i++) {
            detalles.add(new Consultar(0, 0, new gestionPrenda().prendagetID(tipo[i]), Integer.parseInt(cantidad[i]), new gestionCategoria().categoriagetID(categoria[i]), new gestionServicio().serviciogetID(servicio[i]), descripcion[i], Integer.parseInt(subtotal[i])));
        }
        return detalles;
    }

    public int generarSolicitud(int tipo_solicitud, Solicitud solicitud) {
        int responding = 0;
        ResultSet rs;
        Integer[] tipo = arrayIDPrenda(generarArreglo(solicitud.getPrendas_tipo()));
        String[] cantidad = generarArreglo(solicitud.getPrendas_cantidad());
        Integer[] categoria = arrayIDCategoria(generarArreglo(solicitud.getPrendas_categoria()));
        Integer[] servicio = arrayIDServicio(generarArreglo(solicitud.getPrendas_servicio()));
        String[] descripcion = generarArreglo(solicitud.getPrendas_descripcion());
        String[] subtotal = generarArreglo(solicitud.getSub_total());
        try {
            Connection cn = conectar();
            String query = "CALL crear_solicitud (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement pstmt = cn.prepareStatement(query);
            pstmt.setInt(1, 0);
            pstmt.setInt(2, solicitud.getId_cliente());
            pstmt.setInt(3, solicitud.getMov_recolector());
            pstmt.setInt(4, solicitud.getCod_fecha_recolector());
            pstmt.setInt(5, solicitud.getCod_hora_recolector());
            pstmt.setInt(6, solicitud.getMov_repartidor());
            pstmt.setInt(7, solicitud.getCod_fecha_repartidor());
            pstmt.setInt(8, solicitud.getCod_hora_repartidor());
            pstmt.setInt(9, solicitud.getCod_departamento());
            pstmt.setInt(10, solicitud.getCod_provincia());
            pstmt.setInt(11, solicitud.getCod_distrito());
            pstmt.setInt(12, solicitud.getPrecio_total());
            pstmt.setBoolean(13, solicitud.getStatus());
            pstmt.setTimestamp(14, Timestamp.valueOf(solicitud.getReg_ingreso()));
            pstmt.setTimestamp(15, Timestamp.valueOf(solicitud.getReg_salida()));
            pstmt.setBoolean(16, solicitud.getTipo_de_pedido());
            pstmt.setBoolean(17, solicitud.getPedido_cancelado());
            pstmt.setArray(18, cn.createArrayOf("integer", tipo));
            pstmt.setArray(19, cn.createArrayOf("integer", cantidad));
            pstmt.setArray(20, cn.createArrayOf("integer", categoria));
            pstmt.setArray(21, cn.createArrayOf("integer", servicio));
            pstmt.setArray(22, cn.createArrayOf("text", descripcion));
            pstmt.setArray(23, cn.createArrayOf("integer", subtotal));//23
            pstmt.setInt(24, tipo_solicitud);
            //pstmt.executeUpdate();
            rs = pstmt.executeQuery();
            while (rs.next()) {
                responding = rs.getInt(1);
                break;
            }
            return responding;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public int registrarIngresoSalida(int codigo_solicitud, boolean ingreso) {
        int responding = 0;
        ResultSet rs;
        try {
            Connection cn = conectar();
            String query = "CALL registrar_tiempo (?, ?, ?);";
            PreparedStatement pstmt = cn.prepareStatement(query);
            pstmt.setInt(1, 0);
            pstmt.setInt(2, codigo_solicitud);
            pstmt.setBoolean(3, ingreso);
            //pstmt.executeUpdate();
            rs = pstmt.executeQuery();
            while (rs.next()) {
                responding = rs.getInt(1);
                break;
            }
            return responding;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public int cancelarSolicitud(int codigo_solicitud) {
        int responding = 0;
        ResultSet rs;
        try {
            Connection cn = conectar();
            String query = "CALL cancelar_solicitud (?, ?);";
            PreparedStatement pstmt = cn.prepareStatement(query);
            pstmt.setInt(1, 0);
            pstmt.setInt(2, codigo_solicitud);
            //pstmt.executeUpdate();
            rs = pstmt.executeQuery();
            while (rs.next()) {
                responding = rs.getInt(1);
                break;
            }
            return responding;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public int completarSolicitud(int codigo_solicitud) {
        int responding = 0;
        ResultSet rs;
        try {
            Connection cn = conectar();
            String query = "CALL completar_solicitud (?, ?);";
            PreparedStatement pstmt = cn.prepareStatement(query);
            pstmt.setInt(1, 0);
            pstmt.setInt(2, codigo_solicitud);
            //pstmt.executeUpdate();
            rs = pstmt.executeQuery();
            while (rs.next()) {
                responding = rs.getInt(1);
                break;
            }
            return responding;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public String[] generarArreglo(String cadena) {
        cadena = cadena.substring(0, cadena.length() - 1);
        String[] array = cadena.split("\\*");
        return array;
    }

    public Integer[] arrayIDPrenda(String[] cadena) {
        Integer[] nuevoArreglo = new Integer[cadena.length];
        gestionPrenda prenda = new gestionPrenda();
        for (int x = 0; x < cadena.length; x++) {
            nuevoArreglo[x] = prenda.prendagetID(cadena[x]);
        }
        return nuevoArreglo;
    }

    public Integer[] arrayIDCategoria(String[] cadena) {
        Integer[] nuevoArreglo = new Integer[cadena.length];
        gestionCategoria categoria = new gestionCategoria();
        for (int x = 0; x < cadena.length; x++) {
            nuevoArreglo[x] = categoria.categoriagetID(cadena[x]);
        }
        return nuevoArreglo;
    }

    public Integer[] arrayIDServicio(String[] cadena) {
        Integer[] nuevoArreglo = new Integer[cadena.length];
        gestionServicio servicio = new gestionServicio();
        for (int x = 0; x < cadena.length; x++) {
            nuevoArreglo[x] = servicio.serviciogetID(cadena[x]);
        }
        return nuevoArreglo;
    }
}
