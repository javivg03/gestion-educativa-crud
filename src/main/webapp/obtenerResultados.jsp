<%@ page import="controller.ResultadoController, models.ResultadoAprendizaje" %>
<%
    // Obtenemos el ID de la asignatura desde la solicitud
    String asignaturaId = request.getParameter("asignaturaId");
    if (asignaturaId != null && !asignaturaId.isEmpty()) {
        // Instanciamos el controlador de resultados
        ResultadoController resultadoController = new ResultadoController();
        // Obtenemos los resultados de aprendizaje correspondientes a la asignatura
        List<ResultadoAprendizaje> resultados = resultadoController.obtenerPorAsignatura(Integer.parseInt(asignaturaId));

        // Generamos las opciones del desplegable
        if (resultados != null && !resultados.isEmpty()) {
            for (ResultadoAprendizaje resultado : resultados) {
%>
                <option value="<%= resultado.getId() %>"><%= resultado.getDescripcion() %></option>
<%
            }
        } else {
%>
            <option value="">No hay resultados disponibles</option>
<%
        }
    }
%>
