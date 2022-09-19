
package DAO;

import CrudBean.Branch;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class BranchDAO {
    
     
    public static Connection getConnection() {
        Connection con = null;
        
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/company", "postgres", "postgres");
        } catch (Exception e) {
            System.out.println("Erro de conexão");
        }
        return con;
    }
    
    public static Branch getRegistroById(int branch_id) {
        Branch branch = null;
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM branc WHERE branch_id=?");
            ps.setInt(1, branch_id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                branch = new Branch();
                branch.setBranch_id(rs.getInt("branch_id"));
                branch.setBranch_name(rs.getString("branch_name"));
                branch.setMgr_id(rs.getInt("mgr_id"));
                branch.setMgr_start_date(rs.getString("mgr_start_date"));
             
            }
            
        } catch(Exception e) {
            System.out.println("e");
        }
        return branch;
    }
    
    public static int updateBranch(Branch bran) {
        int status = 0;
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE branch SET branch_id=?, branch_name=?, mgr_id=?, mgr_start_date WHERE branch_id=?");
            
            ps.setInt(1, bran.getBranch_id());
            ps.setString(2, bran.getBranch_name());
            ps.setInt(3, bran.getMgr_id());
            ps.setString(4, bran.getMgr_start_date());
           
            status = ps.executeUpdate();         
            
        } catch (Exception e) {
                System.out.println("e");
                }
            return status;
        }
    
    
    public static List<Branch> getAllbranch(){
        List<Branch> list3 = new ArrayList<Branch>();
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM branch");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                Branch branch = new Branch();
                branch.setBranch_id(rs.getInt("branch_id"));
                branch.setBranch_name(rs.getString("branch_name"));
                branch.setMgr_id(rs.getInt("mgr_id"));
                branch.setMgr_start_date(rs.getString("mgr_start_date"));
                
                list3.add(branch);
                
                
            }
        } catch (Exception e) {
            System.out.println("e");
        }
        return list3;
    }
    
}
