package controller;

import java.util.List;
import models.Asignatura;
import dao.AsignaturaDAO;

public class AsignaturaController {

    private static AsignaturaDAO asignaturaDAO = new AsignaturaDAO();

    // Devuelve la lista de asignaturas
    public static List<Asignatura> listar() {
        return asignaturaDAO.listarAsignaturas();
    }

    // Inserta una nueva asignatura
    public static void insertar(String nombre, String descripcion) {
        Asignatura a = new Asignatura(nombre, descripcion);
        asignaturaDAO.insertarAsignatura(a);
    }

    // Elimina una asignatura por id
    public static void eliminar(int id) {
        asignaturaDAO.eliminarAsignatura(id);
    }

    // Devuelve una asignatura por id
    public static Asignatura obtenerPorId(int id) {
        return asignaturaDAO.obtenerAsignaturaPorId(id);
    }

    // Actualiza una asignatura
    public static void actualizar(int id, String nombre, String descripcion) {
        Asignatura a = new Asignatura(id, nombre, descripcion);
        asignaturaDAO.actualizarAsignatura(a);
    }
}
