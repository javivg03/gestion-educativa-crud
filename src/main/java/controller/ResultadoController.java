package controller;

import java.util.List;
import models.ResultadoAprendizaje;
import dao.ResultadoAprendizajeDAO;

public class ResultadoController {

    private static ResultadoAprendizajeDAO resultadoDAO = new ResultadoAprendizajeDAO();

    // Devuelve la lista de resultados
    public static List<ResultadoAprendizaje> listar() {
        return resultadoDAO.listarResultados();
    }

    // Inserta un nuevo resultado de aprendizaje
    public static void insertar(String descripcion, int asignaturaId) {
        ResultadoAprendizaje r = new ResultadoAprendizaje(descripcion, asignaturaId);
        resultadoDAO.insertarResultado(r);
    }

    // Elimina un resultado por id
    public static void eliminar(int id) {
        resultadoDAO.eliminarResultado(id);
    }

    // Devuelve un resultado por id
    public static ResultadoAprendizaje obtenerPorId(int id) {
        return resultadoDAO.obtenerResultadoPorId(id);
    }

    // Actualiza un resultado de aprendizaje
    public static void actualizar(int id, String descripcion, int asignaturaId) {
        ResultadoAprendizaje r = new ResultadoAprendizaje(id, descripcion, asignaturaId);
        resultadoDAO.actualizarResultado(r);
    }
}
