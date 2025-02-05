package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.Asignatura;
import util.Database;

public class AsignaturaDAO {

    // Lista todas las asignaturas de la tabla 'asignaturas'
    public List<Asignatura> listarAsignaturas() {
        List<Asignatura> list = new ArrayList<>();
        String sql = "SELECT * FROM asignaturas";
        try (Connection con = Database.conectar(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Asignatura a = new Asignatura(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("descripcion") 
                );
                list.add(a);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    // Inserta una nueva asignatura en la tabla
    public void insertarAsignatura(Asignatura a) {
        String sql = "INSERT INTO asignaturas (nombre, descripcion) VALUES (?, ?)";
        try (Connection con = Database.conectar(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, a.getNombre());
            ps.setString(2, a.getDescripcion()); 
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Actualiza una asignatura existente
    public void actualizarAsignatura(Asignatura a) {
        String sql = "UPDATE asignaturas SET nombre = ?, descripcion = ? WHERE id = ?";
        try (Connection con = Database.conectar(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, a.getNombre());
            ps.setString(2, a.getDescripcion()); 
            ps.setInt(3, a.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Elimina una asignatura por su id
    public void eliminarAsignatura(int id) {
        String sql = "DELETE FROM asignaturas WHERE id = ?";
        try (Connection con = Database.conectar(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Obtiene una asignatura por su id
    public Asignatura obtenerAsignaturaPorId(int id) {
        Asignatura a = null;
        String sql = "SELECT * FROM asignaturas WHERE id = ?";
        try (Connection con = Database.conectar(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    a = new Asignatura(
                            rs.getInt("id"),
                            rs.getString("nombre"),
                            rs.getString("descripcion") 
                    );
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return a;
    }
}
