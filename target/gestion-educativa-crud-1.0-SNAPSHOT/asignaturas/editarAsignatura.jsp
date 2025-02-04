<%@ page import="models.Asignatura, controller.AsignaturaController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Editar Asignatura</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="main-container centered mt-30">
            <h1>Editar Asignatura</h1>
            <%
                int id = Integer.parseInt(request.getParameter("id"));
                Asignatura a = AsignaturaController.obtenerPorId(id);
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String nombre = request.getParameter("nombre");
                    AsignaturaController.actualizar(id, nombre);
                    response.sendRedirect("asignaturas.jsp");
                    return;
                }
            %>
            <form action="editarAsignatura.jsp?id=<%= a.getId()%>" method="post">
                <input type="hidden" name="id" value="<%= a.getId()%>">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="<%= a.getNombre()%>" required>
                </div>
                <button type="submit" class="btn-custom">Actualizar</button>
                <a href="asignaturas.jsp" class="btn-outline" style="margin-left:10px;">Cancelar</a>
            </form>
        </div>

        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>
