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
</head>
<body>
    <h2>Iniciar Sesión</h2>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>

    <form method="POST">
        <input type="email" name="email" placeholder="Correo electrónico" required>
        <input type="password" name="password" placeholder="Contraseña" required>
        <button type="submit">Ingresar</button>
    </form>

    <p>¿No tienes cuenta? <a href="registro.jsp">Regístrate aquí</a></p>
</body>
</html>
