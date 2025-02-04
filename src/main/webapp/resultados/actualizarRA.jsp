<%@ page import="controller.ResultadoController" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String descripcion = request.getParameter("descripcion");
    int asignaturaId = Integer.parseInt(request.getParameter("asignaturaId"));
    ResultadoController.actualizar(id, descripcion, asignaturaId);
    response.sendRedirect("resultados.jsp");
%>
