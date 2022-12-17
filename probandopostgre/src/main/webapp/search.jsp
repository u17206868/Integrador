<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%--@page import="org.json.JSONObject"--%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    int result = 0;
    HttpSession sesion = request.getSession();
    String dni = request.getParameter("dni");
    if (!dni.equals(""))
    {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/tianbel_lavanderia?user=tianbel_lavanderia&password=laybcgqm");
        st=con.createStatement();
        rs=st.executeQuery("SELECT * FROM `usuarios`;");
        while (rs.next())
            {
                if (rs.getString(8).equals(dni))
                    {
                        sesion.setAttribute("saveid", rs.getString(1));
                        result = 1;
                        break;
                    }
                }
    }
    out.print(result);
    %>