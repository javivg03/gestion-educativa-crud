package models;

public class Asignatura {

    private int id;
    private String nombre;
    private String codigo;

    // Constructor sin id (para inserciones)
    public Asignatura(String nombre) {
        this.nombre = nombre;
    }

    // Constructor con id (para consultas)
    public Asignatura(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    // Getters y setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
