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
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <div class="container">
        <a class="navbar-brand" href="../index.jsp">Gestión Académica</a>
      </div>
    </nav>
    
    <div class="container mt-5">
        <h1>Editar Asignatura</h1>
        <div class="card shadow-sm">
            <div class="card-body">
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
                <form action="editarAsignatura.jsp?id=<%= a.getId() %>" method="post">
                    <input type="hidden" name="id" value="<%= a.getId() %>">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%= a.getNombre() %>" required>
                    </div>
                    <button type="submit" class="btn btn-success">Actualizar</button>
                    <a href="asignaturas.jsp" class="btn btn-secondary">Cancelar</a>
                </form>
            </div>
        </div>
    </div>
    
    <footer class="bg-dark text-light py-3 mt-5">
      <div class="container text-center">
        <p class="mb-0">&copy; 2025 Gestión Académica. Todos los derechos reservados.</p>
      </div>
    </footer>
    
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/script.js"></script>
</body>
</html>
