<%@ page import="java.util.List, models.ResultadoAprendizaje, controller.ResultadoController" %>
<%
    List<ResultadoAprendizaje> list = ResultadoController.listar();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Resultados de Aprendizaje</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <style>
      .card-header {
          background-color: #007bff;
          color: #fff;
          font-weight: bold;
      }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <div class="container">
        <a class="navbar-brand" href="../index.jsp">Gestión Académica</a>
      </div>
    </nav>
    
    <div class="container mt-5">
        <h1 class="mb-4">Resultados de Aprendizaje</h1>
        <a href="nuevaRA.jsp" class="btn btn-success mb-4">Nuevo Resultado</a>
        
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <% for (ResultadoAprendizaje r : list) { %>
            <div class="col">
                <div class="card h-100 shadow-sm">
                    <div class="card-header">
                        ID: <%= r.getId() %>
                    </div>
                    <div class="card-body">
                        <p class="card-text"><strong>Descripción:</strong> <%= r.getDescripcion() %></p>
                        <p class="card-text"><strong>ID Asignatura:</strong> <%= r.getAsignaturaId() %></p>
                    </div>
                    <div class="card-footer">
                        <a href="editarRA.jsp?id=<%= r.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="eliminarRA.jsp?id=<%= r.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Está seguro de eliminar este resultado?');">Eliminar</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        
        <div class="mt-5">
            <a href="../index.jsp" class="btn btn-secondary">Volver al Inicio</a>
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="bg-dark text-light py-3 mt-5">
      <div class="container text-center">
        <p class="mb-0">&copy; 2025 Gestión Académica. Todos los derechos reservados.</p>
      </div>
    </footer>
    
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/script.js"></script>
</body>
</html>
