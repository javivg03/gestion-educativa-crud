package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.CriterioEvaluacion;
import util.Database;

public class CriterioEvaluacionDAO {

    // Lista todos los criterios de evaluación de la tabla 'criterios_evaluacion'
    public List<CriterioEvaluacion> listarCriterios() {
        List<CriterioEvaluacion> list = new ArrayList<>();
        String sql = "SELECT * FROM criterios_evaluacion";
        try (Connection con = Database.conectar();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                CriterioEvaluacion c = new CriterioEvaluacion(
                        rs.getInt("id"),
                        rs.getString("descripcion"),
                        rs.getInt("resultado_id")
                );
                list.add(c);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    // Inserta un nuevo criterio de evaluación en la tabla
    public void insertarCriterio(CriterioEvaluacion c) {
        String sql = "INSERT INTO criterios_evaluacion (descripcion, resultado_id) VALUES (?, ?)";
        try (Connection con = Database.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, c.getDescripcion());
            ps.setInt(2, c.getResultadoId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Actualiza un criterio de evaluación existente
    public void actualizarCriterio(CriterioEvaluacion c) {
        String sql = "UPDATE criterios_evaluacion SET descripcion = ?, resultado_id = ? WHERE id = ?";
        try (Connection con = Database.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, c.getDescripcion());
            ps.setInt(2, c.getResultadoId());
            ps.setInt(3, c.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Elimina un criterio de evaluación por su id
    public void eliminarCriterio(int id) {
        String sql = "DELETE FROM criterios_evaluacion WHERE id = ?";
        try (Connection con = Database.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Obtiene un criterio de evaluación por su id
    public CriterioEvaluacion obtenerCriterioPorId(int id) {
        CriterioEvaluacion c = null;
        String sql = "SELECT * FROM criterios_evaluacion WHERE id = ?";
        try (Connection con = Database.conectar();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    c = new CriterioEvaluacion(
                            rs.getInt("id"),
                            rs.getString("descripcion"),
                            rs.getInt("resultado_id")
                    );
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return c;
    }
}
