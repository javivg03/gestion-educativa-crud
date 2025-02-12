<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, models.Asignatura, controller.AsignaturaController" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Nuevo Resultado de Aprendizaje</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="../header.jsp" %>
        <div class="main-container centered mt-30">
            <h1>Nuevo Resultado de Aprendizaje</h1>
            <%
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String descripcion = request.getParameter("descripcion");
                    int asignaturaId = Integer.parseInt(request.getParameter("asignaturaId"));
                    controller.ResultadoController.insertar(descripcion, asignaturaId);
                    response.sendRedirect("resultados.jsp");
                    return;
                }
                List<Asignatura> asignaturas = AsignaturaController.listar();
            %>
            <form action="nuevaRA.jsp" method="post">
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripción</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                </div>
                <div class="mb-3">
                    <label for="asignaturaId" class="form-label">Asignatura</label>
                    <select class="form-select" id="asignaturaId" name="asignaturaId" required>
                        <option value="">-- Seleccione una asignatura --</option>
                        <% for (Asignatura a : asignaturas) {%>
                        <option value="<%= a.getId()%>"><%= a.getNombre()%></option>
                        <% }%>
                    </select>
                </div>
                <button type="submit" class="btn-custom">Guardar</button>
                <a href="resultados.jsp" class="btn-outline" style="margin-left:10px;">Cancelar</a>
            </form>
        </div>

        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>
