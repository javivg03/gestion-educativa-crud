<!-- header.jsp -->
<nav class="navbar navbar-expand-lg navbar-dark bg-teal">
    <div class="container-fluid"> <!-- Cambi� container por container-fluid -->
        <a class="navbar-brand" href="/gestion-educativa-crud/index.jsp">Gesti�n Acad�mica</a>

        <div class="collapse navbar-collapse" id="navbarNav">
            <div class="navbar-nav ms-auto">
                <button class="btn btn-custom me-2" onclick="window.location.href = '/gestion-educativa-crud/asignaturas/asignaturas.jsp'">Asignaturas</button>
                <button class="btn btn-custom me-2" onclick="window.location.href = '/gestion-educativa-crud/resultados/resultados.jsp'">Resultados</button>
                <button class="btn btn-custom me-2" onclick="window.location.href = '/gestion-educativa-crud/criterios/criterios.jsp'">Criterios</button>
                <button class="btn btn-custom me-2" onclick="window.location.href = '/gestion-educativa-crud/logout.jsp'">Cerrar sesi�n</button>

            </div>
        </div>
    </div>
</nav>
