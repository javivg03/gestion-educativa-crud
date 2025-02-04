<%@ page import="java.util.List, models.Asignatura, controller.AsignaturaController" %>
<%
    List<Asignatura> list = AsignaturaController.listar();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Asignaturas</title>
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
        <h1 class="mb-4">Asignaturas</h1>
        <a href="nuevaAsignatura.jsp" class="btn btn-success mb-4">Agregar Nueva Asignatura</a>
        
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <% for (Asignatura a : list) { %>
            <div class="col">
                <div class="card h-100 shadow-sm">
                    <div class="card-header">
                        ID: <%= a.getId() %>
                    </div>
                    <div class="card-body">
                        <p class="card-text"><strong>Nombre:</strong> <%= a.getNombre() %></p>
                    </div>
                    <div class="card-footer">
                        <a href="editarAsignatura.jsp?id=<%= a.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="eliminarAsignatura.jsp?id=<%= a.getId() %>" class="btn btn-danger btn-sm"
                           onclick="return confirm('¿Está seguro de eliminar esta asignatura?');">Eliminar</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        
        <div class="mt-5">
            <a href="../index.jsp" class="btn btn-secondary">Volver al Inicio</a>
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
