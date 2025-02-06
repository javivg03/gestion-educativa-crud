<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="models.Usuario" %>

<%
    // Recuperamos el usuario de la sesión
    Usuario usuario = (Usuario) session.getAttribute("usuario");

    // Verificamos si el usuario está autenticado
    if (usuario != null) {
        String rol = usuario.getRol();  // Obtenemos el rol del usuario

        if ("profesor".equals(rol)) {
            // Redirigimos automáticamente a 'index.jsp' si el rol es profesor
            response.sendRedirect("index.jsp");
            return; // Detenemos la ejecución del resto del código
        }
%>
        <h1>Bienvenido, <%= usuario.getNombre() %>!</h1>

        <% if ("admin".equals(rol)) { %>
            <!-- Contenido exclusivo para administradores -->
            <p><a href="gestionarUsuarios.jsp">Gestionar Usuarios</a></p>
            <p><a href="gestionarAsignaturas.jsp">Gestionar Asignaturas</a></p>
        <% } %>

        <% if ("alumno".equals(rol)) { %>
            <!-- Contenido exclusivo para alumnos -->
            <p><a href="misResultados.jsp">Mis Resultados</a></p>
            <p><a href="misAsignaturas.jsp">Mis Asignaturas</a></p>
        <% } %>
        
        <!-- Enlace para cerrar sesión -->
        <p><a href="logout.jsp">Cerrar sesión</a></p>
<%
    } else {
        // Si el usuario no está logueado, redirigimos al login
        response.sendRedirect("auth/login.jsp");
    }
%>
