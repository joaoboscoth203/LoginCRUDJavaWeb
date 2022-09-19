
package DAO;

import CrudBean.Employee;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
    
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
    
    public static Employee getRegistroById(int emp_id) {
        Employee employee = null;
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM employee WHERE emp_id=?");
            ps.setInt(1, emp_id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                employee = new Employee();
                employee.setEmp_id(rs.getInt("emp_id"));
                employee.setFirst_name(rs.getString("first_name"));
                employee.setLast_name(rs.getString("last_name"));
                employee.setBirth_date(rs.getString("birth_date"));
                employee.setSex(rs.getString("sex"));
                employee.setSalary(rs.getInt("salary"));
                employee.setSuper_id(rs.getInt("super_id")); 
                employee.setBranch_id(rs.getInt("branch_id")); 
            }
            
        } catch(Exception e) {
            System.out.println("e");
        }
        return employee;
    }
    
    public static int updateEmployee(Employee emp) {
        int status = 0;
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE employee SET first_name=?, last_name=?, birth_date=?, sex=?, salary=?, super_id, branch_id WHERE emp_id=?");
            
            ps.setInt(1, emp.getEmp_id());
            ps.setString(2, emp.getFirst_name());
            ps.setString(3, emp.getLast_name());
            ps.setString(4, emp.getBirth_date());
            ps.setString(5, emp.getSex());
            ps.setInt(6, emp.getSalary());
            ps.setInt(6, emp.getSuper_id());
            ps.setInt(6, emp.getBranch_id());
            status = ps.executeUpdate();         
            
        } catch (Exception e) {
                System.out.println("e");
                }
            return status;
        }
    
    
    public static List<Employee> getAllEmployee(){
        List<Employee> list2 = new ArrayList<Employee>();
        
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM employee");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                Employee employee = new Employee();
                employee.setEmp_id(rs.getInt("emp_id"));
                employee.setFirst_name(rs.getString("first_name"));
                employee.setLast_name(rs.getString("last_name"));
                employee.setBirth_date(rs.getString("birth_date"));
                employee.setSex(rs.getString("sex"));
                employee.setSalary(rs.getInt("salary"));
                employee.setSuper_id(rs.getInt("super_id"));
                employee.setBranch_id(rs.getInt("branch_id"));
                list2.add(employee);
                
                
            }
        } catch (Exception e) {
            System.out.println("e");
        }
        return list2;
    }
}
