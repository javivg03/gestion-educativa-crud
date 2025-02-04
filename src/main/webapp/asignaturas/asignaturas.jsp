<%@ page import="java.util.List, models.Asignatura, controller.AsignaturaController" %>
<%
    List<Asignatura> list = AsignaturaController.listar();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Asignaturas</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
    <div class="main-container mt-30 centered">
        <h1>Asignaturas</h1>
        <a href="nuevaAsignatura.jsp" class="btn-custom mb-30">Agregar Nueva Asignatura</a>

        <div class="row row-cols-1 row-cols-md-3 g-4">
            <% for (Asignatura a : list) { %>
            <div class="col">
                <div class="card">
                    <div class="card-header">ID: <%= a.getId() %></div>
                    <div class="card-body">
                        <p><strong>Nombre:</strong> <%= a.getNombre() %></p>
                    </div>
                    <div class="card-footer centered">
                        <a href="editarAsignatura.jsp?id=<%= a.getId() %>" class="btn-custom me-2">Editar</a>
                        <a href="eliminarAsignatura.jsp?id=<%= a.getId() %>" class="btn-custom" style="background-color:#d9534f;" onclick="return confirm('¿Está seguro de eliminar esta asignatura?');">Eliminar</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

        <a href="../index.jsp" class="btn-custom mt-30">Volver al Inicio</a>
    </div>

    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
