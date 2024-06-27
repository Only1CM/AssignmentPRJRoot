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
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Food;
import model.User;

/**
 *
 * @author Nhat Anh
 */
public class FoodDAO extends DBContext{
    
    public ArrayList<Food> getAllFoods() {
        ArrayList<Food> list = new ArrayList();
        try {
            String sql = "Select * from Foods";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Food u = new Food();
                u.setFood_id(rs.getInt("Food_id"));
                u.setName(rs.getString("food_name"));
                u.setCateID(rs.getInt("cateID"));
                u.setDescription(rs.getString("food_description"));
                u.setFood_img(rs.getString("food_image"));
                u.setPrice(rs.getInt("food_price"));
                
                list.add( u);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public void CreateFoods(Food food) {       
        try {
            String sql = "INSERT INTO Foods (food_name, food_image, food_price, food_description, cateID) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, food.getName());
            ps.setString(2, food.getFood_img());
            ps.setDouble(3, food.getPrice());
            ps.setString(4, food.getDescription());
            ps.setInt(5, food.getCateID());
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
       
    public Food Detail(String food_name) {
         try {
            String sql = "SELECT * FROM Foods WHERE food_name = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, food_name);
            ResultSet rs = ps.executeQuery();

            //Username là độc nhất nên không cần lặp
            if (rs.next()) {
                Food u = new Food();
                u.setFood_id(rs.getInt("Food_id"));
                u.setName(rs.getString("food_name"));
                u.setCateID(rs.getInt("cateID"));
                u.setDescription(rs.getString("food_description"));
                u.setFood_img(rs.getString("food_image"));
                u.setPrice(rs.getInt("food_price"));
              return u;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(Food food) {
        try {
            String sql = "UPDATE Foods SET food_name = ?, cateID = ?, food_description = ?, food_image = ?, food_price = ? WHERE Food_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, food.getName());
            ps.setString(2, food.getFood_img());
            ps.setDouble(3, food.getPrice());
            ps.setString(4, food.getDescription());
            ps.setInt(5, food.getCateID());
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public void delete(int id) {
        try {
            String sql = "DELETE FROM Foods WHERE Food_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
