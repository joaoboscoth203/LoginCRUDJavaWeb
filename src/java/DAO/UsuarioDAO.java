/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import CrudBean.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joaobosco
 */
public class UsuarioDAO {
    
    public static Connection getConnection() {
        Connection con = null;
        
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/login", "postgres", "postgres");
        } catch (Exception e) {
            System.out.println("Erro de conexão");
        }
        return con;
        
    }
    
    public static int salvarUsuario(Usuario u) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO usuario (nome, senha, email, sexo, pais) VALUES (?,?,?,?,?)");
            ps.setString(1, u.getNome());
            ps.setString(2, u.getSenha());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getSexo());
            ps.setString(5, u.getPais());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println("e");
        }
        return status;
    } 
    
    
    public static Usuario getRegistroById(int id) {
        Usuario usuario = null;
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            con.close();
            
            while(rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSexo(rs.getString("sexo"));
                usuario.setPais(rs.getString("pais"));                       
            }
            
        } catch(Exception e) {
            System.out.println("e");
        }
        return usuario;
    }
    
    public static int updateUsuario(Usuario u) {
        int status = 0;
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE usuario SET nome=?, senha=?, email=?, sexo=?, pais=? WHERE id=?");
            con.close();
            
            ps.setString(1, u.getNome());
            ps.setString(2, u.getSenha());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getSexo());
            ps.setString(5, u.getPais());
            ps.setInt(6, u.getId());
            status = ps.executeUpdate();         
            
        } catch (Exception e) {
                System.out.println("e");
                }
            return status;           
        }
    
    
    public static List<Usuario> getAllUsuario(){
        List<Usuario> list = new ArrayList<Usuario>();
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario");
            ResultSet rs = ps.executeQuery();
            con.close();
            
            while(rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSexo(rs.getString("sexo"));
                usuario.setPais(rs.getString("pais"));
                list.add(usuario);
                
                
            }
        } catch (Exception e) {
            System.out.println("e");            
        } 
        return list;
    }

}
