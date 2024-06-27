/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Food {
    private int food_id;
    private String name;
    private String description;
    private String food_img;
    private double price;
    private int cateID;

    public String getFood_img() {
        return food_img;
    }

    public void setFood_img(String food_img) {
        this.food_img = food_img;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public Food() {
    }

    public Food(int food_id, String name, String description, String food_img, double price, int cateID) {
        this.food_id = food_id;
        this.name = name;
        this.description = description;
        this.food_img = food_img;
        this.price = price;
        this.cateID = cateID;
    }

    public Food(String name, String description, double price) {
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public Food(int food_id, String name, String description, double price) {
        this.food_id = food_id;
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public int getFood_id() {
        return food_id;
    }

    public void setFood_id(int food_id) {
        this.food_id = food_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
