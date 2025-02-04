<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Inicio - Gestión Académica</title>
  <!-- Referencias a Bootstrap y estilo común -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <style>
    /* Ajustamos el Hero Section para que use un gradiente en vez de imagen */
    .hero {
      background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
      height: 450px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
    }
    .hero-text {
      text-align: center;
      padding: 0 20px;
    }
  </style>
</head>
<body>
  <!-- Hero Section -->
  <div class="hero">
    <div class="hero-text">
      <h1 class="display-4 fw-bold">Bienvenido a la Gestión Académica</h1>
      <p class="lead">Administra tus asignaturas, resultados y criterios de evaluación de forma moderna.</p>
      <a href="asignaturas/asignaturas.jsp" class="btn btn-primary btn-lg">Comienza Ahora</a>
    </div>
  </div>
  
  <!-- Sección de Opciones con Cards -->
  <div class="container my-5">
    <div class="row g-4">
      <div class="col-md-4">
        <div class="card border-0 shadow">
          <div class="card-body">
            <h5 class="card-title">Asignaturas</h5>
            <p class="card-text">Gestiona tus asignaturas de forma eficiente.</p>
            <a href="asignaturas/asignaturas.jsp" class="btn btn-outline-primary">Ver Asignaturas</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card border-0 shadow">
          <div class="card-body">
            <h5 class="card-title">Resultados</h5>
            <p class="card-text">Consulta y administra los resultados de aprendizaje.</p>
            <a href="resultados/resultados.jsp" class="btn btn-outline-primary">Ver Resultados</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card border-0 shadow">
          <div class="card-body">
            <h5 class="card-title">Criterios</h5>
            <p class="card-text">Administra los criterios de evaluación.</p>
            <a href="criterios/criterios.jsp" class="btn btn-outline-primary">Ver Criterios</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Footer -->
  <footer class="bg-dark text-light py-3">
    <div class="container text-center">
      <p class="mb-0">&copy; 2025 Gestión Académica. Todos los derechos reservados.</p>
    </div>
  </footer>
  
  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="js/script.js"></script>
</body>
</html>
