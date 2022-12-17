package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class conexionJDBC {
    Connection conexion = null;
    String db="lavanderia";//nombre de base de datos
    String host="129.151.111.223";//ip del postgresql //Local server 10.0.0.173
    String port="5432";//puerto de postgesql por default = 5432
    String user="christian";//nombre de usuario
    String pass="laybcgqm";//contraseña de usuario
    
    String driverDb="org.postgresql.Driver";
    String url="jdbc:postgresql://" + host + ":" + port +"/" + db;
    
    public Connection conectar()
    {
        try
        {
            Class.forName(driverDb);
            conexion= DriverManager.getConnection(url,user,pass);
            if (!conexion.isClosed())
            {
                System.out.println("conexion exitosa a la base de datos @" + db);
            }
            return conexion;
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            Logger.getLogger(dao.conexionJDBC.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public Connection getConexion()
    {
        return conexion;
    }
}