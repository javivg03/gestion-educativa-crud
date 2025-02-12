<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Inicio - Gestión Académica</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body> 
        <%@ include file="header.jsp" %>
        <!-- Contenedor principal -->
        <div class="main-container">
            <!-- Hero Section Reducida -->
            <div class="hero">
                <div class="hero-text">
                    <h1>Bienvenido a la Gestión Académica</h1>
                    <p>Administra tus asignaturas, resultados de aprendizaje y criterios de evaluación en un único sitio.</p>
                </div>
            </div>

            <!-- Sección de Opciones en Cards, centradas -->
            <div class="centered mb-30">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div class="row row-cols-1 row-cols-md-3 g-4 mb-30">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-header">Asignaturas</h5>
                                    <p class="card-text mb-3">Gestiona tus asignaturas de forma sencilla.</p>
                                    <a href="asignaturas/asignaturas.jsp" class="btn-outline">Ver Asignaturas</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-header">Resultados</h5>
                                    <p class="card-text mb-3">Consulta y administra los resultados de aprendizaje.</p>
                                    <a href="resultados/resultados.jsp" class="btn-outline">Ver Resultados</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-header">Criterios</h5>
                                    <p class="card-text mb-3">Administra los criterios de evaluación.</p>
                                    <a href="criterios/criterios.jsp" class="btn-outline">Ver Criterios</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="js/bootstrap.min.js"></script>
                </body>
                <%@ include file="../footer.jsp" %>
                </html>