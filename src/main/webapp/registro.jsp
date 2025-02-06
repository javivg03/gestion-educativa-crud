<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, dao.UsuarioDAO, models.Usuario, util.Database" %>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rol = request.getParameter("rol");

        if (nombre != null && email != null && password != null && rol != null) {
            Connection conexion = Database.conectar();
            UsuarioDAO usuarioDAO = new UsuarioDAO(conexion);
            Usuario usuario = new Usuario(nombre, email, password, rol);

            if (usuarioDAO.registrarUsuario(usuario)) {
                response.sendRedirect("login.jsp"); // Redirigir al login tras registro exitoso
                return;
            } else {
                request.setAttribute("error", "Error al registrar usuario.");
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="register-container">
        <div class="hero-register">
            <h1>¡Crea tu Cuenta!</h1>
            <p>Regístrate para acceder a la plataforma y gestionar tus procesos.</p>
        </div>
        <div class="register-form">
            <% if (request.getAttribute("error") != null) { %>
                <p class="error-message"><%= request.getAttribute("error") %></p>
            <% } %>

            <form method="POST">
                <input type="text" name="nombre" placeholder="Nombre completo" required>
                <input type="email" name="email" placeholder="Correo electrónico" required>
                <input type="password" name="password" placeholder="Contraseña" required>
                <select name="rol" required>
                    <option value="admin">Administrador</option>
                    <option value="profesor">Profesor</option>
                    <option value="alumno">Alumno</option>
                </select>
                <button type="submit" class="btn-custom">Registrarse</button>
            </form>

            <p>¿Ya tienes una cuenta? <a href="login.jsp" class="btn-outline">Inicia sesión aquí</a></p>
        </div>
    </div>
</body>
</html>
