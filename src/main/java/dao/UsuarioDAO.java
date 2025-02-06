package dao;

import models.Usuario;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {

    private Connection conexion;

    public UsuarioDAO(Connection conexion) {
        this.conexion = conexion;
    }

    // Método para registrar un usuario con contraseña cifrada
    public boolean registrarUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nombre, email, password, rol) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, BCrypt.hashpw(usuario.getPassword(), BCrypt.gensalt())); // 🔐 Encriptar contraseña
            stmt.setString(4, usuario.getRol());

            return stmt.executeUpdate() > 0; // Retorna true si el usuario se insertó
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para autenticar usuario comparando la contraseña encriptada
    public Usuario autenticarUsuario(String email, String password) {
        String sql = "SELECT * FROM usuarios WHERE email = ?";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setString(1, email);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                if (BCrypt.checkpw(password, hashedPassword)) { // 🔐 Comparación segura
                    return new Usuario(
                            rs.getString("nombre"),
                            rs.getString("email"),
                            hashedPassword,
                            rs.getString("rol") // Aquí obtienes el rol
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Usuario no encontrado o credenciales incorrectas
    }

}
