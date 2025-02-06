<%@ page import="java.util.List, models.ResultadoAprendizaje, controller.ResultadoController, controller.AsignaturaController" %>
<%
    // Instanciamos el controlador de asignaturas
    AsignaturaController asignaturaController = new AsignaturaController();
    // Obtenemos todas las asignaturas disponibles
    List<models.Asignatura> asignaturas = asignaturaController.listar();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Resultados de Aprendizaje</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <script src="../js/jquery.min.js"></script>
        <script>
            $(document).ready(function() {
                // Cuando se cambie la asignatura
                $('#asignaturaSelect').change(function() {
                    var asignaturaId = $(this).val(); // Obtenemos el ID de la asignatura seleccionada
                    
                    // Realizamos una petición AJAX para obtener los resultados de la asignatura seleccionada
                    $.ajax({
                        url: 'obtenerResultados.jsp', // Página que procesará la solicitud
                        method: 'GET',
                        data: { asignaturaId: asignaturaId },
                        success: function(response) {
                            $('#resultadoSelect').html(response); // Actualizamos el desplegable de resultados
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <%@ include file="../header.jsp" %>

        <div class="main-container centered mt-30">
            <h1>Resultados de Aprendizaje</h1>
            <a href="nuevaRA.jsp" class="btn-custom mb-30">Nuevo Resultado</a>

            <!-- Filtro de Asignatura -->
            <div class="mb-30">
                <label for="asignaturaSelect">Selecciona una Asignatura:</label>
                <select id="asignaturaSelect" class="form-control">
                    <option value="">Seleccione una asignatura</option>
                    <% for (models.Asignatura asignatura : asignaturas) { %>
                        <option value="<%= asignatura.getId() %>"><%= asignatura.getNombre() %></option>
                    <% } %>
                </select>
            </div>

            <!-- Filtro de Resultados -->
            <div class="mb-30">
                <label for="resultadoSelect">Selecciona un Resultado de Aprendizaje:</label>
                <select id="resultadoSelect" class="form-control">
                    <option value="">Seleccione un resultado</option>
                </select>
            </div>

            <!-- Tabla de Resultados -->
            <div class="table-container">
                <table class="styled-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Asignatura</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            // Mostramos los resultados de aprendizaje según la asignatura seleccionada (esto será manejado por AJAX)
                        %>
                    </tbody>
                </table>
            </div>

            <a href="../index.jsp" class="btn-custom mt-30">Volver al Inicio</a>
        </div>

        <script src="../js/bootstrap.min.js"></script>
        <%@ include file="../footer.jsp" %>
    </body>
</html>
