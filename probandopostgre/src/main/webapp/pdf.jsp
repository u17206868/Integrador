<%-- 
    Document   : pdf
    Created on : 30 nov. 2022, 10:25:05
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            File reportfile = new File(application.getRealPath("Servicios.jasper"));
            Map<String, Object> parameter = new HashMap<String, Object>();
            String valor = request.getParameter("codigo");
            parameter.put("codigo_ca", valor);
            parameter.put("text", ".");
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
