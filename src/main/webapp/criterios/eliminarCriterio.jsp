<%@ page import="controller.CriterioController" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    CriterioController.eliminar(id);
    response.sendRedirect("criterios.jsp");
%>
