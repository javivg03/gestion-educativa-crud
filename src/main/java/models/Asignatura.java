package models;

public class Asignatura {

    private int id;
    private String nombre;
    private String descripcion; 

    // Constructor sin id (para inserciones)
    public Asignatura(String nombre, String descripcion) {
        this.nombre = nombre;
        this.descripcion = descripcion; 
    }

    // Constructor con id (para consultas)
    public Asignatura(int id, String nombre, String descripcion) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;  
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

    public String getDescripcion() {
        return descripcion;  
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;  
    }
}
