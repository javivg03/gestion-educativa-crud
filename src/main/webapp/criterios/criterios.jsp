<%@ page import="java.util.List, models.CriterioEvaluacion, controller.CriterioController" %>
<%
    List<models.CriterioEvaluacion> list = CriterioController.listar();
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
        <div class="main-container centered mt-30">
            <h1>Criterios de Evaluación</h1>
            <a href="nuevaCriterio.jsp" class="btn-custom mb-30">Nuevo Criterio</a>

            <div class="row g-4">
                <% for (models.CriterioEvaluacion c : list) {%>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">ID: <%= c.getId()%></div>
                        <div class="card-body">
                            <p><strong>Descripción:</strong> <%= c.getDescripcion()%></p>
                            <p><strong>ID Resultado:</strong> <%= c.getResultadoId()%></p>
                        </div>
                        <div class="card-footer centered">
                            <a href="editarCriterio.jsp?id=<%= c.getId()%>" class="btn-custom" style="margin-right:5px;">Editar</a>
                            <a href="eliminarCriterio.jsp?id=<%= c.getId()%>" class="btn-custom" style="background-color:#d9534f;" onclick="return confirm('¿Está seguro de eliminar este criterio?');">Eliminar</a>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>

            <a href="../index.jsp" class="btn-custom mt-30">Volver al Inicio</a>
        </div>

        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>
