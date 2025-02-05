<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, models.Asignatura, models.ResultadoAprendizaje, controller.AsignaturaController, controller.ResultadoController" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Editar Resultado de Aprendizaje</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="../header.jsp" %>
        <div class="main-container centered mt-30">
            <h1>Editar Resultado de Aprendizaje</h1>
            <%
                int id = Integer.parseInt(request.getParameter("id"));
                ResultadoAprendizaje r = ResultadoController.obtenerPorId(id);
                List<Asignatura> asignaturas = AsignaturaController.listar();
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String descripcion = request.getParameter("descripcion");
                    int asignaturaId = Integer.parseInt(request.getParameter("asignaturaId"));
                    ResultadoController.actualizar(id, descripcion, asignaturaId);
                    response.sendRedirect("resultados.jsp");
                    return;
                }
            %>
            <form action="editarRA.jsp?id=<%= r.getId()%>" method="post">
                <input type="hidden" name="id" value="<%= r.getId()%>">
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripción</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" value="<%= r.getDescripcion()%>" required>
                </div>
                <div class="mb-3">
                    <label for="asignaturaId" class="form-label">Asignatura</label>
                    <select class="form-select" id="asignaturaId" name="asignaturaId" required>
                        <option value="">-- Seleccione una asignatura --</option>
                        <% for (Asignatura a : asignaturas) {
                                String selected = (a.getId() == r.getAsignaturaId()) ? "selected" : "";
                        %>
                        <option value="<%= a.getId()%>" <%= selected%>><%= a.getNombre()%></option>
                        <% }%>
                    </select>
                </div>
                <button type="submit" class="btn-custom">Actualizar</button>
                <a href="resultados.jsp" class="btn-outline" style="margin-left:10px;">Cancelar</a>
            </form>
        </div>

        <script src="../js/bootstrap.min.js"></script>
        <%@ include file="../footer.jsp" %>
    </body>
</html>
