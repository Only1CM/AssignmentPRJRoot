/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext {

    public Map<Integer, Categories> getAllCategories() {
        Map<Integer, Categories> list = new HashMap<>();
        try {
            String sql = "Select * from Categories";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Categories c = new Categories();
                c.setCategory_id(rs.getInt("category_id"));
                c.setCategory_name(rs.getString("category_name"));
                
                list.put(c.getCategory_id(), c);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void add(Categories category) {

        try {
            String sql = "INSERT INTO Categories (category_name) VALUES (?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, category.getCategory_name());
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeCategory(Categories category,int cate_id) {

        try {
            String sql = "UPDATE Categories SET category_name = ? WHERE category_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, category.getCategory_name());
            ps.setInt(2, cate_id);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int category_id) {
        try {
            String sql = "DELETE FROM Categories WHERE category_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, category_id);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//    public static void main(String[] args) {
//        CategoryDAO uDAO = new CategoryDAO();
//        Map<Integer, Categories> x = uDAO.getAllCategories();
//        for (int u : x.keySet()) {
//            System.out.println(x.get(u).getCategory_id() + ", " + x.get(u).getCategory_name());
//        }
//    }
}
