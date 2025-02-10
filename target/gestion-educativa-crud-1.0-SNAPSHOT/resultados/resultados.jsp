<%@ page import="java.util.List, models.Asignatura, controller.AsignaturaController, models.ResultadoAprendizaje, controller.ResultadoController" %>
<%
    List<Asignatura> asignaturas = AsignaturaController.listar();
    String asignaturaParam = request.getParameter("asignaturaId");
    int asignaturaId = (asignaturaParam != null && !asignaturaParam.isEmpty()) ? Integer.parseInt(asignaturaParam) : 0;

    List<ResultadoAprendizaje> resultados = asignaturaId > 0 ? ResultadoController.listarPorAsignatura(asignaturaId) : ResultadoController.listar();
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

            <form action="resultados.jsp" method="GET" class="mb-30">
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
                        <% for (ResultadoAprendizaje r : resultados) {
                            Asignatura a = AsignaturaController.obtenerPorId(r.getAsignaturaId());%>
                        <tr>
                            <td><%= r.getId()%></td>
                            <td><%= r.getDescripcion()%></td>
                            <td><%= a != null ? a.getNombre() : "No asignada"%></td>
                            <td>
                                <a href="editarRA.jsp?id=<%= r.getId()%>" class="btn-custom btn-edit">Editar</a>
                                <a href="eliminarRA.jsp?id=<%= r.getId()%>" class="btn-custom btn-delete" onclick="return confirm('¿Eliminar este resultado?');">Eliminar</a>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <a href="../index.jsp" class="btn-custom mt-30">Volver al Inicio</a>

        </div>
    </body>
</html>
