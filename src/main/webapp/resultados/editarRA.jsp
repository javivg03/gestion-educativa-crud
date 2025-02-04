<%@ page import="models.ResultadoAprendizaje, controller.ResultadoController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Resultado de Aprendizaje</title>
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
        <h1>Editar Resultado de Aprendizaje</h1>
        <div class="card shadow-sm">
            <div class="card-body">
                <% 
                    int id = Integer.parseInt(request.getParameter("id"));
                    ResultadoAprendizaje r = ResultadoController.obtenerPorId(id);
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String descripcion = request.getParameter("descripcion");
                        int asignaturaId = Integer.parseInt(request.getParameter("asignaturaId"));
                        ResultadoController.actualizar(id, descripcion, asignaturaId);
                        response.sendRedirect("resultados.jsp");
                        return;
                    }
                %>
                <form action="editarRA.jsp?id=<%= r.getId() %>" method="post">
                    <input type="hidden" name="id" value="<%= r.getId() %>">
                    <div class="mb-3">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" value="<%= r.getDescripcion() %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="asignaturaId" class="form-label">ID Asignatura</label>
                        <input type="number" class="form-control" id="asignaturaId" name="asignaturaId" value="<%= r.getAsignaturaId() %>" required>
                    </div>
                    <button type="submit" class="btn btn-success">Actualizar</button>
                    <a href="resultados.jsp" class="btn btn-secondary">Cancelar</a>
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
