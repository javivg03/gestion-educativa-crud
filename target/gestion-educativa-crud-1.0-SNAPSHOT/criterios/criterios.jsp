<%@ page import="java.util.List, models.CriterioEvaluacion, controller.CriterioController, controller.ResultadoController" %>
<%
    List<models.CriterioEvaluacion> list = CriterioController.listar();
    ResultadoController resultadoController = new ResultadoController(); // Instanciamos el controlador
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
        <div class="main-container mt-30 centered">
            <h1>Criterios de Evaluación</h1>
            <a href="nuevaCriterio.jsp" class="btn-custom mb-30">Nuevo Criterio</a>

            <!-- Tabla de Criterios -->
            <div class="table-container">
                <table class="styled-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Resultado de aprendizaje</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (models.CriterioEvaluacion c : list) {
                                // Obtenemos la descripción del resultado usando el ID del criterio
                                models.ResultadoAprendizaje resultado = resultadoController.obtenerPorId(c.getResultadoId());
                        %>
                        <tr>
                            <td><%= c.getId()%></td>
                            <td><%= c.getDescripcion()%></td>
                            <td><%= resultado != null ? resultado.getDescripcion() : "No asignado"%></td> <!-- Mostramos la descripción del resultado -->
                            <td>
                                <a href="editarCriterio.jsp?id=<%= c.getId()%>" class="btn-custom btn-edit">Editar</a>
                                <a href="eliminarCriterio.jsp?id=<%= c.getId()%>" class="btn-custom btn-delete" style="background-color:#d9534f;" onclick="return confirm('¿Está seguro de eliminar este criterio?');">Eliminar</a>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>

            <a href="../index.jsp" class="btn-custom mt-30">Volver al Inicio</a>
        </div>

        <script src="../js/bootstrap.min.js"></script>
        <%@ include file="../footer.jsp" %>
    </body>
</html>
