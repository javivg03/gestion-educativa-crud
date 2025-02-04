<%@ page import="controller.AsignaturaController" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    AsignaturaController.actualizar(id, nombre);
    response.sendRedirect("asignaturas.jsp");
%>
