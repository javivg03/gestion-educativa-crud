<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, models.ResultadoAprendizaje, controller.ResultadoController" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Nuevo Criterio de Evaluación</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="main-container centered mt-30">
            <h1>Nuevo Criterio de Evaluación</h1>
            <%
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String descripcion = request.getParameter("descripcion");
                    int resultadoId = Integer.parseInt(request.getParameter("resultadoId"));
                    controller.CriterioController.insertar(descripcion, resultadoId);
                    response.sendRedirect("criterios.jsp");
                    return;
                }
                // Obtener la lista de Resultados para el menú desplegable
                List<ResultadoAprendizaje> resultados = ResultadoController.listar();
            %>
            <form action="nuevaCriterio.jsp" method="post">
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripción</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                </div>
                <div class="mb-3">
                    <label for="resultadoId" class="form-label">Resultado de Aprendizaje</label>
                    <select class="form-select" id="resultadoId" name="resultadoId" required>
                        <option value="">-- Seleccione un resultado --</option>
                        <% for (ResultadoAprendizaje r : resultados) {%>
                        <option value="<%= r.getId()%>"><%= r.getDescripcion()%></option>
                        <% }%>
                    </select>
                </div>
                <button type="submit" class="btn-custom">Guardar</button>
                <a href="criterios.jsp" class="btn-outline" style="margin-left:10px;">Cancelar</a>
            </form>
        </div>

        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>
