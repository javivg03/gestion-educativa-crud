<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nuevo Criterio de Evaluación</title>
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
        <h1>Nuevo Criterio de Evaluación</h1>
        <div class="card shadow-sm">
            <div class="card-body">
                <% 
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String descripcion = request.getParameter("descripcion");
                        int resultadoId = Integer.parseInt(request.getParameter("resultadoId"));
                        controller.CriterioController.insertar(descripcion, resultadoId);
                        response.sendRedirect("criterios.jsp");
                        return;
                    }
                %>
                <form action="nuevaCriterio.jsp" method="post">
                    <div class="mb-3">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                    </div>
                    <div class="mb-3">
                        <label for="resultadoId" class="form-label">ID Resultado</label>
                        <input type="number" class="form-control" id="resultadoId" name="resultadoId" required>
                    </div>
                    <button type="submit" class="btn btn-success">Guardar</button>
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
