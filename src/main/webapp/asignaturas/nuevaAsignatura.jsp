<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Nueva Asignatura</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
    </head>
    <body>  
        <div class="main-container centered mt-30">
            <h1>Nueva Asignatura</h1>
            <%
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String nombre = request.getParameter("nombre");
                    controller.AsignaturaController.insertar(nombre);
                    response.sendRedirect("asignaturas.jsp");
                    return;
                }
            %>
            <form action="nuevaAsignatura.jsp" method="post">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                <button type="submit" class="btn-custom">Guardar</button>
                <a href="asignaturas.jsp" class="btn-outline" style="margin-left:10px;">Cancelar</a>
            </form>
        </div>

        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>
