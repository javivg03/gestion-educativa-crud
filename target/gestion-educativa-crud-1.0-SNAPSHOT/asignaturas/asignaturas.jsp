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
        <%@ include file="../header.jsp" %>
        <div class="main-container mt-30 centered">
            <h1>Asignaturas</h1>
            <a href="nuevaAsignatura.jsp" class="btn-custom mb-30">Agregar Nueva Asignatura</a>

            <!-- Tabla de Asignaturas -->
            <div class="table-container">
                <table class="styled-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Asignatura a : list) {%>
                        <tr>
                            <td><%= a.getId()%></td>
                            <td><%= a.getNombre()%></td>
                            <td><%= a.getDescripcion()%></td> 
                            <td>
                                <a href="editarAsignatura.jsp?id=<%= a.getId()%>" class="btn-custom btn-edit">Editar</a>
                                <a href="eliminarAsignatura.jsp?id=<%= a.getId()%>" class="btn-custom btn-delete" style="background-color:#d9534f;" onclick="return confirm('¿Está seguro de eliminar esta asignatura?');">Eliminar</a>
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
