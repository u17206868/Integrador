<%-- 
    Document   : reporte-de-servicios
    Created on : 2 dic. 2022, 03:44:22
    Author     : tianb
--%>

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
            File reportfile = new File(application.getRealPath("panel/operaciones/reportes/reporte-de-servicios.jasper"));
            Map<String, Object> parameter = new HashMap<String, Object>();
            int servicio = Integer.parseInt(request.getParameter("servicio"));
            String fecha1 = request.getParameter("fecha1");
            String fecha2 = request.getParameter("fecha2");
            parameter.put("codigo_se", servicio);
            parameter.put("fecha_inicio", "'" + fecha1 + " 00:00:00'");
            parameter.put("fecha_fin", "'" + fecha2 + " 23:59:59'");
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
