<%@ page import="controller.ResultadoController" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ResultadoController.eliminar(id);
    response.sendRedirect("resultados.jsp");
%>
