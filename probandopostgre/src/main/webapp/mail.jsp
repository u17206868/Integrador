<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.JavaEmailSender"%>
<%
    new JavaEmailSender("tianbel@hotmail.com", "hola", "<html><head></head><body><h1>hola mundo</h1></body></html>").generarCorreo();
%>