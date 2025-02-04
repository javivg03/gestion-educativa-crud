<%@ page import="controller.CriterioController" %>
<%
    String descripcion = request.getParameter("descripcion");
    int resultadoId = Integer.parseInt(request.getParameter("resultadoId"));
    CriterioController.insertar(descripcion, resultadoId);
    response.sendRedirect("criterios.jsp");
%>
