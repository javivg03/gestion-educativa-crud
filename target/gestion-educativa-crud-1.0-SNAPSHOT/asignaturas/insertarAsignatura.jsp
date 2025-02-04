<%@ page import="controller.AsignaturaController" %>
<%
    String nombre = request.getParameter("nombre");
    AsignaturaController.insertar(nombre);
    response.sendRedirect("asignaturas.jsp");
%>
