<%@ page import="java.util.List, models.Asignatura, controller.AsignaturaController, models.ResultadoAprendizaje, controller.ResultadoController, models.CriterioEvaluacion, controller.CriterioController" %>
<%
    // Obtener todas las asignaturas para llenar el dropdown
    List<Asignatura> asignaturas = AsignaturaController.listar();
    String asignaturaParam = request.getParameter("asignaturaId");
    int asignaturaId = 0;
    if (asignaturaParam != null && asignaturaParam.matches("\\d+")) {
        asignaturaId = Integer.parseInt(asignaturaParam);
    }

    // Obtener los resultados de aprendizaje según la asignatura seleccionada
    List<ResultadoAprendizaje> resultados = (asignaturaId > 0) ? ResultadoController.listarPorAsignatura(asignaturaId) : null;

    // Obtener el resultado seleccionado para filtrar criterios
    String resultadoParam = request.getParameter("resultadoId");
    int resultadoId = 0;
    if (resultadoParam != null && resultadoParam.matches("\\d+")) {
        resultadoId = Integer.parseInt(resultadoParam);
    }

    // Obtener los criterios filtrados (si se selecciona un resultado)
    List<CriterioEvaluacion> criterios;
    if (resultadoId > 0) {
        criterios = CriterioController.listarPorResultado(resultadoId);
    } else {
        // Si no hay filtro de resultado, mostrar todos los criterios de la asignatura seleccionada
        if (asignaturaId > 0) {
            criterios = CriterioController.listarPorAsignatura(asignaturaId);
        } else {
            // Mostrar todos los criterios si no hay filtro
            criterios = CriterioController.listar();
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Criterios de Evaluación</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="../header.jsp" %>
        <div class="main-container centered mt-30">
            <h1>Criterios de Evaluación</h1>
            <a href="nuevaCriterio.jsp" class="btn-custom mb-30">Nuevo Criterio</a>

            <!-- Filtro por asignatura -->
            <form action="criterios.jsp" method="GET" class="mb-30 mt-30">
                <label for="asignaturaId">Selecciona una Asignatura:</label>
                <select name="asignaturaId" id="asignaturaId" class="form-control" onchange="this.form.submit()">
                    <option value="">-- Seleccione --</option>
                    <% for (Asignatura asig : asignaturas) {%>
                    <option value="<%= asig.getId()%>" <%= (asignaturaId == asig.getId()) ? "selected" : ""%>>
                        <%= asig.getNombre()%>
                    </option>
                    <% } %>
                </select>
            </form>

            <!-- Filtro por resultado de aprendizaje -->
            <% if (asignaturaId > 0 && resultados != null) {%>
            <form action="criterios.jsp" method="GET" class="mb-30">
                <input type="hidden" name="asignaturaId" value="<%= asignaturaId%>">
                <label for="resultadoId">Selecciona un Resultado de Aprendizaje:</label>
                <select name="resultadoId" id="resultadoId" class="form-control" onchange="this.form.submit()">
                    <option value="">-- Seleccione --</option>
                    <% for (ResultadoAprendizaje r : resultados) {%>
                    <option value="<%= r.getId()%>" <%= (resultadoId == r.getId()) ? "selected" : ""%>>
                        <%= r.getDescripcion()%>
                    </option>
                    <% } %>
                </select>
            </form>
            <% } %>

            <!-- Tabla de Criterios -->
            <div class="table-container">
                <table class="styled-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (criterios != null && !criterios.isEmpty()) {
                            for (CriterioEvaluacion c : criterios) {%>
                        <tr>
                            <td><%= c.getId()%></td>
                            <td><%= c.getDescripcion()%></td>
                            <td>
                                <div class="btn-container">
                                    <a href="editarCriterio.jsp?id=<%= c.getId()%>" class="btn-custom btn-edit">Editar</a>
                                    <a href="eliminarCriterio.jsp?id=<%= c.getId()%>" class="btn-custom btn-delete" onclick="return confirm('¿Eliminar este criterio?');">Eliminar</a>
                                </div>
                            </td>
                        </tr>
                        <% }
                    } else { %>
                        <tr><td colspan="3">No se encontraron criterios para el resultado seleccionado.</td></tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <a href="../index.jsp" class="btn-custom mt-30">Volver al Inicio</a>
        </div>
        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>
