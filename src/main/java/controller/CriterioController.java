package controller;

import java.util.List;
import models.CriterioEvaluacion;
import dao.CriterioEvaluacionDAO;

public class CriterioController {

    private static CriterioEvaluacionDAO criterioDAO = new CriterioEvaluacionDAO();

    // Devuelve la lista de criterios
    public static List<CriterioEvaluacion> listar() {
        return criterioDAO.listarCriterios();
    }

    // Inserta un nuevo criterio
    public static void insertar(String descripcion, int resultadoId) {
        CriterioEvaluacion c = new CriterioEvaluacion(descripcion, resultadoId);
        criterioDAO.insertarCriterio(c);
    }

    // Elimina un criterio por id
    public static void eliminar(int id) {
        criterioDAO.eliminarCriterio(id);
    }

    // Devuelve un criterio por id
    public static CriterioEvaluacion obtenerPorId(int id) {
        return criterioDAO.obtenerCriterioPorId(id);
    }

    // Actualiza un criterio
    public static void actualizar(int id, String descripcion, int resultadoId) {
        CriterioEvaluacion c = new CriterioEvaluacion(id, descripcion, resultadoId);
        criterioDAO.actualizarCriterio(c);
    }


    public static List<CriterioEvaluacion> listarPorResultado(int resultadoId) {
        return CriterioEvaluacionDAO.obtenerPorResultado(resultadoId);
    }
}
