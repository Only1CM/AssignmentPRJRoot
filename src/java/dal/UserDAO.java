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
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public Map<Integer, User> getAllUsers() {
        Map<Integer, User> list = new HashMap<>();
        try {
            String sql = "Select * from Users";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setFirst_name(rs.getString("firstname"));
                u.setLast_name(rs.getString("lastname"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                
                list.put(u.getUser_id(), u);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public User getByUsernamePassword(String username, String password) {
        try {
            String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirst_name(rs.getString("firstname"));
                user.setLast_name(rs.getString("lastname"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                return user;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getByUsername(String username) {
        try {
            String sql = "SELECT * FROM Users WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            //Username là độc nhất nên không cần lặp
            if (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirst_name(rs.getString("firstname"));
                user.setLast_name(rs.getString("lastname"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                return user;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void add(User user) {

        try {
            String sql = "INSERT INTO Users (username, firstname, lastname, password,  role, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getFirst_name());
            ps.setString(3, user.getLast_name());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getRole());
            ps.setString(6, user.getPhone());
            ps.setString(7, user.getEmail());
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changePassword(User user, String password) {

        try {
            String sql = "UPDATE Users SET username = ?, password = ?, role = ? WHERE user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, password);
            ps.setString(3, user.getRole());
            ps.setInt(4, user.getUser_id());
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<User> getAll() {
        try {
            String sql = "Select * from Users";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<User> list = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirst_name(rs.getString("firstname"));
                user.setLast_name(rs.getString("lastname"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));

                list.add(user);
            }
            rs.close();
            ps.close();
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(int user_id, String firstname, String lastname, String username, String password, String role, String phone, String email) {
        try {
            String sql = "UPDATE Users SET firstname = ?, lastname = ?, username = ?, password = ?, role = ?, phone = ?, email = ?  WHERE user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, role);
            ps.setString(6, phone);
            ps.setString(7, email);
            ps.setInt(8, user_id);
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int id) {
        try {
            String sql = "DELETE FROM Users WHERE user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//    public static void main(String[] args) {
//        UserDAO uDAO = new UserDAO();
//        ArrayList<User> list = uDAO.getAll();
//        for (User u : list) {
//            System.out.println(u.getUsername() + ", " + u.getPassword() + ", " + u.getRole());
//        }
//    }
}
