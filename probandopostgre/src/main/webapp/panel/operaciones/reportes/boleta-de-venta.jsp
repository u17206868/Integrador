<%-- 
    Document   : boleta-de-venta
    Created on : 8 dic. 2022, 18:12:14
    Author     : tianb
--%>

<%@page import="procesos.gestionPedido"%>
<%@page import="entidades.Pedido"%>
<%@page import="com.itextpdf.layout.element.Paragraph"%>
<%@page import="com.itextpdf.kernel.pdf.PdfDocument"%>
<%@page import="com.itextpdf.kernel.pdf.PdfWriter"%>
<%@page import="com.itextpdf.layout.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="javax.servlet.ServletResponse"%>
<%@page import="javax.servlet.ServletRequest"%>
<%@page import="dao.conexionJDBC"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de servicios</title>
    </head>
    <body>
        <%
            File reportfile = new File(application.getRealPath("panel/operaciones/reportes/boleta-de-venta.jasper"));
            Map<String, Object> parameter = new HashMap<String, Object>();
            int solicitud = Integer.parseInt(request.getParameter("solicitud"));
            Pedido pedido = new gestionPedido().getPedido(solicitud);
            String fecha1 = request.getParameter("fecha1");
            String fecha2 = request.getParameter("fecha2");
            parameter.put("codigo_solicitud", solicitud);
            parameter.put("nombre_cliente", pedido.getNombres_apellidos());
            parameter.put("dni", pedido.getDni());
            parameter.put("direccion", pedido.getDistrito());
            parameter.put("total", pedido.getPrecio_total());
            byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, new conexionJDBC().conectar());
            response.setContentType("application/pdf");
            //response.setHeader("Content-Disposition", "attachment; filename=\"reporte.pdf\"");//guardar archivo
            response.setContentLength(bytes.length);
            ServletOutputStream outputstream = response.getOutputStream();
            outputstream.write(bytes, 0, bytes.length);
            outputstream.flush();
            outputstream.close();
            /*PdfWriter writer = new PdfWriter(response.getOutputStream());
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);
            document.add(new Paragraph(outputstream.toString()));
            document.close();*/
        %>
    </body>
</html>
