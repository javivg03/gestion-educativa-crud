<%@ page import="java.util.List, models.ResultadoAprendizaje, controller.ResultadoController, controller.AsignaturaController" %>
<%
    List<ResultadoAprendizaje> list = ResultadoController.listar();
    AsignaturaController asignaturaController = new AsignaturaController(); // Instanciamos el controlador
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
        <%@ include file="../header.jsp" %>
        <div class="main-container centered mt-30">
            <h1>Resultados de Aprendizaje</h1>
            <a href="nuevaRA.jsp" class="btn-custom mb-30">Nuevo Resultado</a>

            <!-- Tabla de Resultados -->
            <div class="table-container">
                <table class="styled-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Asignatura</th> <!-- Mostrar nombre de asignatura -->
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (models.ResultadoAprendizaje r : list) {
                                // Obtenemos el nombre de la asignatura usando el ID del resultado
                                models.Asignatura asignatura = asignaturaController.obtenerPorId(r.getAsignaturaId());
                        %>
                        <tr>
                            <td><%= r.getId()%></td>
                            <td><%= r.getDescripcion()%></td>
                            <td><%= asignatura != null ? asignatura.getNombre() : "No asignada"%></td> <!-- Mostramos el nombre de la asignatura -->
                            <td>
                                <a href="editarRA.jsp?id=<%= r.getId()%>" class="btn-custom btn-edit">Editar</a>
                                <a href="eliminarRA.jsp?id=<%= r.getId()%>" class="btn-custom btn-delete" style="background-color:#d9534f;" onclick="return confirm('¿Está seguro de eliminar este resultado?');">Eliminar</a>
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
