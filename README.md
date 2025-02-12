# Proyecto CRUD con JSP, MySQL y Bootstrap

## Descripción

Esta es una aplicación web de gestión académica que permite realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre tres entidades relacionadas: **Asignaturas**, **Resultados de Aprendizaje (RA)** y **Criterios de Evaluación**. La aplicación está desarrollada en Java utilizando JSP (Java Server Pages) para la lógica de presentación, MySQL para la base de datos, y Bootstrap 5 para el diseño de la interfaz de usuario.

## Funcionalidades

El proyecto gestiona tres entidades principales:

### 1. **Asignaturas**
- CRUD completo para las asignaturas.
- Crear, listar, editar y eliminar asignaturas.

### 2. **Resultados de Aprendizaje (RA)**
- CRUD completo para los resultados de aprendizaje.
- Los RA se pueden asociar a una asignatura específica.

### 3. **Criterios de Evaluación**
- CRUD completo para los criterios de evaluación.
- Los criterios se pueden asociar a un RA específico.

## Tecnologías Utilizadas

- **Java**: Lenguaje de programación principal.
- **JSP**: Para la generación dinámica de páginas web.
- **MySQL**: Base de datos para almacenar las asignaturas, RA y criterios.
- **Bootstrap 5**: Framework de diseño para crear una interfaz moderna y responsiva.
- **JDBC**: Para la conexión con la base de datos MySQL.
- **Tomcat**: Servidor de aplicaciones para la ejecución del proyecto.

## Estructura del Proyecto

### Directorios principales:

- **src/**: Contiene el código fuente Java (controladores y servicios).
- **WebContent/**: Archivos JSP, recursos estáticos y de interfaz.
  - **index.jsp**: Página principal con enlaces a las secciones.
  - **asignaturas.jsp**: CRUD para las asignaturas.
  - **resultados.jsp**: CRUD para los Resultados de Aprendizaje.
  - **criterios.jsp**: CRUD para los criterios de evaluación.
  - **css/**: Archivos de estilos (CSS).
  - **js/**: Archivos de scripts (JavaScript).

### Clases Java principales:

- **Modelos**: 
  - `Asignatura.java`: Modelo para la entidad Asignatura.
  - `ResultadoAprendizaje.java`: Modelo para la entidad Resultado de Aprendizaje.
  - `CriterioEvaluacion.java`: Modelo para la entidad Criterio de Evaluación.

- **DAO (Data Access Object)**:
  - `AsignaturaDAO.java`: Métodos para interactuar con la base de datos para las asignaturas.
  - `ResultadoAprendizajeDAO.java`: Métodos para interactuar con la base de datos para los RA.
  - `CriterioEvaluacionDAO.java`: Métodos para interactuar con la base de datos para los criterios de evaluación.

- **Controladores**:
  - **Controladores específicos** para manejar las solicitudes de las páginas JSP y realizar operaciones CRUD en cada entidad.

## Requisitos

### Pre-requisitos

1. **Tomcat**: Asegúrate de tener el servidor de aplicaciones Tomcat configurado correctamente.
2. **MySQL**: Instalar y configurar una base de datos MySQL.
3. **JDBC Connector**: Instalar el conector JDBC de MySQL para la conexión desde Java.
4. **Bootstrap**: Usar la versión 5 de Bootstrap para crear una interfaz de usuario moderna y responsiva.

### Conexión a la Base de Datos

1. Crear una base de datos llamada `gestion_academica` (o el nombre que prefieras) en MySQL.
2. Configura el archivo `Database.java` para establecer la conexión JDBC con la base de datos.

```java
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static final String URL = "jdbc:mysql://localhost:3306/crud_practica";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection conectar() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
```
## Entidades y Relaciones

1. **Asignaturas**: Tabla `asignaturas` con atributos como `id`, `nombre`, `descripcion`.
2. **Resultados de Aprendizaje**: Tabla `resultados_aprendizaje` con atributos como `id`, `descripcion`, y una relación con `asignaturas` (clave foránea).
3. **Criterios de Evaluación**: Tabla `criterios_evaluacion` con atributos como `id`, `descripcion`, y una relación con `resultados_aprendizaje` (clave foránea).

## Pasos para Ejecutar el Proyecto

1. **Configuración de Tomcat**: Asegúrate de que Tomcat esté instalado y configurado correctamente.
2. **Configuración de la base de datos**: Crea las tablas en MySQL utilizando las sentencias SQL proporcionadas en los scripts.
3. **Deploy en Tomcat**: Despliega la aplicación en el servidor Tomcat.
4. **Acceso a la aplicación**: Visita `http://localhost:8080/` para acceder al proyecto.

## Funcionalidades del Proyecto

### Página de Asignaturas
- Muestra una lista de asignaturas.
- Permite agregar, editar y eliminar asignaturas.

### Página de Resultados de Aprendizaje
- Muestra una lista de RA asociados a las asignaturas.
- Permite agregar, editar y eliminar RA.

### Página de Criterios de Evaluación
- Muestra una lista de criterios de evaluación asociados a los RA.
- Permite agregar, editar y eliminar criterios.

## Validaciones

### Cliente:
- Validación de formularios utilizando las clases de validación de Bootstrap 5.

### Servidor:
- Validación de entradas en el servidor con Java, para garantizar que los datos sean correctos antes de insertarlos en la base de datos.
- 

## Autor

Desarrollado por Javier Villaseñor García como parte de una práctica académica.
