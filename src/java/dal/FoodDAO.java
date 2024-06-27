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
public class FoodDAO extends DBContext {

    public Map<Integer, Food> getAllFoods() {
        Map<Integer, Food> list = new HashMap<>();
        try {
            String sql = "Select * from Foods";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Food f = new Food();
                f.setFood_id(rs.getInt("food_id"));
                f.setFood_name(rs.getString("food_name"));
                f.setFood_img(rs.getString("food_image"));
                f.setFood_price(rs.getDouble("food_price"));
                f.setFood_description(rs.getString("food_description"));
                f.setCateID(rs.getInt("cateID"));

                list.put(f.getFood_id(), f);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void add(Food food) {

        try {
            String sql = "INSERT INTO Foods (food_name, food_image, food_price, food_description, cateID) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, food.getFood_name());
            ps.setString(2, food.getFood_img());
            ps.setDouble(3, food.getFood_price());
            ps.setString(4, food.getFood_description());
            ps.setInt(5, food.getCateID());
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Food getFoodByID(int food_id) {
        Food newFood = new Food();
        try {
            String sql = "Select * from Foods WHERE food_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, food_id);
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                newFood.setFood_id(rs.getInt("food_id"));
                newFood.setFood_name(rs.getString("food_name"));
                newFood.setFood_img(rs.getString("food_image"));
                newFood.setFood_price(rs.getDouble("food_price"));
                newFood.setFood_description(rs.getString("food_description"));
                newFood.setCateID(rs.getInt("cateID"));
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newFood;
    }

    public ArrayList<Food> getFoodByCateID(int cateID) {
        ArrayList<Food> list = new ArrayList<>();
        try {
            String sql = "Select * from Foods WHERE cateID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cateID);
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Food newFood = new Food();
                newFood.setFood_id(rs.getInt("food_id"));
                newFood.setFood_name(rs.getString("food_name"));
                newFood.setFood_img(rs.getString("food_image"));
                newFood.setFood_price(rs.getDouble("food_price"));
                newFood.setFood_description(rs.getString("food_description"));
                newFood.setCateID(rs.getInt("cateID"));
                list.add(newFood);
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void delete(int food_id) {
        try {
            String sql = "DELETE FROM Foods WHERE food_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, food_id);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//
//    public static void main(String[] args) {
//        FoodDAO uDAO = new FoodDAO();
//        Map<Integer, Food> x = uDAO.getAllFoods();
//        for (int u : x.keySet()) {
//            System.out.println(x.get(u).getFood_id() + ", " + x.get(u).getFood_name());
//        }
//    }
}
