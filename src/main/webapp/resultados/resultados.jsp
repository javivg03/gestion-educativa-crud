<%@ page import="java.util.List, models.ResultadoAprendizaje, controller.ResultadoController" %>
<%
    List<ResultadoAprendizaje> list = ResultadoController.listar();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Resultados de Aprendizaje</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="main-container centered mt-30">
            <h1>Resultados de Aprendizaje</h1>
            <a href="nuevaRA.jsp" class="btn-custom mb-30">Nuevo Resultado</a>

            <div class="row g-4">
                <% for (models.ResultadoAprendizaje r : list) {%>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">ID: <%= r.getId()%></div>
                        <div class="card-body">
                            <p><strong>Descripción:</strong> <%= r.getDescripcion()%></p>
                            <p><strong>ID Asignatura:</strong> <%= r.getAsignaturaId()%></p>
                        </div>
                        <div class="card-footer centered">
                            <a href="editarRA.jsp?id=<%= r.getId()%>" class="btn-custom" style="margin-right:5px;">Editar</a>
                            <a href="eliminarRA.jsp?id=<%= r.getId()%>" class="btn-custom" style="background-color:#d9534f;" onclick="return confirm('¿Está seguro de eliminar este resultado?');">Eliminar</a>
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
