<%@ page import="controller.AsignaturaController" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    AsignaturaController.eliminar(id);
    response.sendRedirect("asignaturas.jsp");
%>
