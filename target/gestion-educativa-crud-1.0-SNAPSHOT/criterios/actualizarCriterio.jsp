<%@ page import="controller.CriterioController" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String descripcion = request.getParameter("descripcion");
    int resultadoId = Integer.parseInt(request.getParameter("resultadoId"));
    CriterioController.actualizar(id, descripcion, resultadoId);
    response.sendRedirect("criterios.jsp");
%>
