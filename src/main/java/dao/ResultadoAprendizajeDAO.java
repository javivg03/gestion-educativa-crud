package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.ResultadoAprendizaje;
import util.Database;

public class ResultadoAprendizajeDAO {

    // Lista todos los resultados de aprendizaje de la tabla 'resultados_aprendizaje'
    public List<ResultadoAprendizaje> listarResultados() {
        List<ResultadoAprendizaje> list = new ArrayList<>();
        String sql = "SELECT * FROM resultados_aprendizaje";
        try (Connection con = Database.conectar();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                ResultadoAprendizaje r = new ResultadoAprendizaje(
                        rs.getInt("id"),
                        rs.getString("descripcion"),
                        rs.getInt("asignatura_id")
                );
                list.add(r);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    // Inserta un nuevo resultado de aprendizaje en la tabla
    public void insertarResultado(ResultadoAprendizaje r) {
        String sql = "INSERT INTO resultados_aprendizaje (descripcion, asignatura_id) VALUES (?, ?)";
        try (Connection con = Database.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, r.getDescripcion());
            ps.setInt(2, r.getAsignaturaId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Actualiza un resultado de aprendizaje existente
    public void actualizarResultado(ResultadoAprendizaje r) {
        String sql = "UPDATE resultados_aprendizaje SET descripcion = ?, asignatura_id = ? WHERE id = ?";
        try (Connection con = Database.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, r.getDescripcion());
            ps.setInt(2, r.getAsignaturaId());
            ps.setInt(3, r.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Elimina un resultado de aprendizaje por su id
    public void eliminarResultado(int id) {
        String sql = "DELETE FROM resultados_aprendizaje WHERE id = ?";
        try (Connection con = Database.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Obtiene un resultado de aprendizaje por su id
    public ResultadoAprendizaje obtenerResultadoPorId(int id) {
        ResultadoAprendizaje r = null;
        String sql = "SELECT * FROM resultados_aprendizaje WHERE id = ?";
        try (Connection con = Database.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    r = new ResultadoAprendizaje(
                            rs.getInt("id"),
                            rs.getString("descripcion"),
                            rs.getInt("asignatura_id")
                    );
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return r;
    }
}
