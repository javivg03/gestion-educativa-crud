<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, dao.UsuarioDAO, models.Usuario, util.Database" %>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Establecer conexión con la base de datos
        Connection conexion = Database.conectar();
        UsuarioDAO usuarioDAO = new UsuarioDAO(conexion);
        Usuario usuario = usuarioDAO.autenticarUsuario(email, password);

        if (usuario != null) {
            // Si el usuario se autentica, se guarda en la sesión
            session.setAttribute("usuario", usuario);
            response.sendRedirect("dashboard.jsp"); // Redirige al dashboard
            return;
        } else {
            // Si las credenciales son incorrectas
            request.setAttribute("error", "Credenciales incorrectas.");
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="login-container">
        <div class="hero-login">
            <h1>Bienvenido a la Gestión Académica</h1>
            <p>Accede a tu cuenta para gestionar tus asignaturas y resultados.</p>
        </div>
        <div class="login-form">
            <% if (request.getAttribute("error") != null) { %>
                <p class="error-message"><%= request.getAttribute("error") %></p>
            <% } %>

            <form method="POST">
                <input type="email" name="email" placeholder="Correo electrónico" required>
                <input type="password" name="password" placeholder="Contraseña" required>
                <button type="submit" class="btn-custom">Ingresar</button>
            </form>

            <p>¿No tienes cuenta? <a href="registro.jsp" class="btn-outline">Regístrate aquí</a></p>
        </div>
    </div>
</body>
</html>
