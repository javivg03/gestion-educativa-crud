<%@ page import="controller.ResultadoController" %>
<%
    String descripcion = request.getParameter("descripcion");
    int asignaturaId = Integer.parseInt(request.getParameter("asignaturaId"));
    ResultadoController.insertar(descripcion, asignaturaId);
    response.sendRedirect("resultados.jsp");
%>
