<%@ page import="models.CriterioEvaluacion, controller.CriterioController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Criterio de Evaluación</title>
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
        <h1>Editar Criterio de Evaluación</h1>
        <div class="card shadow-sm">
            <div class="card-body">
                <% 
                    int id = Integer.parseInt(request.getParameter("id"));
                    CriterioEvaluacion c = CriterioController.obtenerPorId(id);
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String descripcion = request.getParameter("descripcion");
                        int resultadoId = Integer.parseInt(request.getParameter("resultadoId"));
                        CriterioController.actualizar(id, descripcion, resultadoId);
                        response.sendRedirect("criterios.jsp");
                        return;
                    }
                %>
                <form action="editarCriterio.jsp?id=<%= c.getId() %>" method="post">
                    <input type="hidden" name="id" value="<%= c.getId() %>">
                    <div class="mb-3">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" value="<%= c.getDescripcion() %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="resultadoId" class="form-label">ID Resultado</label>
                        <input type="number" class="form-control" id="resultadoId" name="resultadoId" value="<%= c.getResultadoId() %>" required>
                    </div>
                    <button type="submit" class="btn btn-success">Actualizar</button>
                    <a href="criterios.jsp" class="btn btn-secondary">Cancelar</a>
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
