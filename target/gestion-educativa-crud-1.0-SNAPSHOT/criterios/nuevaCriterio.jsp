<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, models.Asignatura, models.ResultadoAprendizaje, controller.ResultadoController, controller.AsignaturaController" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Nuevo Criterio de Evaluación</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="../header.jsp" %>
        <div class="main-container centered mt-30">
            <h1>Nuevo Criterio de Evaluación</h1>

            <%
                // Obtener la lista de Resultados de Aprendizaje
                List<ResultadoAprendizaje> resultados = null;
                // Obtener lista de asignaturas para el filtro
                List<Asignatura> asignaturas = AsignaturaController.listar();

                // Si se selecciona una asignatura, filtrar los resultados de aprendizaje
                String asignaturaIdParam = request.getParameter("asignaturaId");
                if (asignaturaIdParam != null && !asignaturaIdParam.isEmpty()) {
                    int asignaturaId = Integer.parseInt(asignaturaIdParam);
                    resultados = ResultadoController.listarPorAsignatura(asignaturaId); // Filtrar por asignatura
                } else {
                    resultados = ResultadoController.listar(); // Si no se filtra, mostrar todos los resultados
                }

                // Lógica para procesar el formulario cuando se envía (POST)
                String descripcion = request.getParameter("descripcion");
                String resultadoIdParam = request.getParameter("resultadoId");
                if (descripcion != null && resultadoIdParam != null && !descripcion.isEmpty() && !resultadoIdParam.isEmpty()) {
                    int resultadoId = Integer.parseInt(resultadoIdParam);
                    controller.CriterioController.insertar(descripcion, resultadoId);
                    response.sendRedirect("criterios.jsp"); // Redirige después de insertar
                    return; // Sale del bloque JSP para evitar continuar con la página
                }
            %>

            <!-- Formulario para agregar Criterio -->
            <form action="nuevaCriterio.jsp" method="post">
                <!-- Campo de Descripción primero -->
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripción</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                </div>

                <!-- Filtro de Asignaturas -->
                <div class="mb-3">
                    <label for="asignaturaId" class="form-label">Seleccionar Asignatura</label>
                    <select class="form-select" id="asignaturaId" name="asignaturaId" onchange="this.form.submit()">
                        <option value="">-- Seleccione una asignatura --</option>
                        <% 
                            // Iterar sobre las asignaturas para crear las opciones del filtro
                            for (Asignatura a : asignaturas) { 
                                String selected = (asignaturaIdParam != null && asignaturaIdParam.equals(String.valueOf(a.getId()))) ? "selected" : "";
                        %>
                            <option value="<%= a.getId() %>" <%= selected %>><%= a.getNombre() %></option>
                        <% } %>
                    </select>
                </div>

                <!-- Filtro de Resultados de Aprendizaje -->
                <div class="mb-3">
                    <label for="resultadoId" class="form-label">Resultado de Aprendizaje</label>
                    <select class="form-select" id="resultadoId" name="resultadoId" required>
                        <option value="">-- Seleccione un resultado --</option>
                        <% 
                            // Iterar sobre los resultados filtrados por asignatura
                            for (ResultadoAprendizaje r : resultados) { 
                        %>
                            <option value="<%= r.getId() %>"><%= r.getDescripcion() %></option>
                        <% } %>
                    </select>
                </div>

                <button type="submit" class="btn-custom">Guardar</button>
                <a href="criterios.jsp" class="btn-outline" style="margin-left:10px;">Cancelar</a>
            </form>
        </div>

        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>
