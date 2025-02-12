<%@ page import="java.util.List, models.ResultadoAprendizaje, models.CriterioEvaluacion, controller.ResultadoController, controller.CriterioController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Editar Criterio de Evaluación</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="../header.jsp" %>
        <div class="main-container centered mt-30">
            <h1>Editar Criterio de Evaluación</h1>
            <%
                int id = Integer.parseInt(request.getParameter("id"));
                CriterioEvaluacion c = CriterioController.obtenerPorId(id);
                List<ResultadoAprendizaje> resultados = ResultadoController.listar();
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String descripcion = request.getParameter("descripcion");
                    int resultadoId = Integer.parseInt(request.getParameter("resultadoId"));
                    CriterioController.actualizar(id, descripcion, resultadoId);
                    response.sendRedirect("criterios.jsp");
                    return;
                }
            %>
            <form action="editarCriterio.jsp?id=<%= c.getId()%>" method="post">
                <input type="hidden" name="id" value="<%= c.getId()%>">
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripción</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" value="<%= c.getDescripcion()%>" required>
                </div>
                <div class="mb-3">
                    <label for="resultadoId" class="form-label">Resultado de Aprendizaje</label>
                    <select class="form-select" id="resultadoId" name="resultadoId" required>
                        <option value="">-- Seleccione un resultado --</option>
                        <% for (ResultadoAprendizaje r : resultados) {
                                String selected = (r.getId() == c.getResultadoId()) ? "selected" : "";
                        %>
                        <option value="<%= r.getId()%>" <%= selected%>><%= r.getDescripcion()%></option>
                        <% }%>
                    </select>
                </div>
                <button type="submit" class="btn-custom">Actualizar</button>
                <a href="criterios.jsp" class="btn-outline" style="margin-left:10px;">Cancelar</a>
            </form>
        </div>

        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>
