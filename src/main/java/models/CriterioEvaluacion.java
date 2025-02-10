package models;

public class CriterioEvaluacion {

    private int id;
    private String descripcion;
    private int resultadoId; // Clave foránea para relacionar con ResultadoAprendizaje

    // Constructor sin id para inserciones
    public CriterioEvaluacion(String descripcion, int resultadoId) {
        this.descripcion = descripcion;
        this.resultadoId = resultadoId;
    }

    // Constructor con id para consultas
    public CriterioEvaluacion(int id, String descripcion, int resultadoId) {
        this.id = id;
        this.descripcion = descripcion;
        this.resultadoId = resultadoId;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getResultadoId() {
        return resultadoId;
    }

    public void setResultadoId(int resultadoId) {
        this.resultadoId = resultadoId;
    }
}