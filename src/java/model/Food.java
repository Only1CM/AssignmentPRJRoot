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
    private String food_name;
    private String food_description;
    private String food_img;
    private double food_price;
    private int cateID;

    public Food() {
    }

    public Food(int food_id, String food_name, String food_description, String food_img, double food_price, int cateID) {
        this.food_id = food_id;
        this.food_name = food_name;
        this.food_description = food_description;
        this.food_img = food_img;
        this.food_price = food_price;
        this.cateID = cateID;
    }

    public Food(String food_name, String food_description, String food_img, double food_price, int cateID) {
        this.food_name = food_name;
        this.food_description = food_description;
        this.food_img = food_img;
        this.food_price = food_price;
        this.cateID = cateID;
    }

    public int getFood_id() {
        return food_id;
    }

    public void setFood_id(int food_id) {
        this.food_id = food_id;
    }

    public String getFood_name() {
        return food_name;
    }

    public void setFood_name(String food_name) {
        this.food_name = food_name;
    }

    public String getFood_description() {
        return food_description;
    }

    public void setFood_description(String food_description) {
        this.food_description = food_description;
    }

    public String getFood_img() {
        return food_img;
    }

    public void setFood_img(String food_img) {
        this.food_img = food_img;
    }

    public double getFood_price() {
        return food_price;
    }

    public void setFood_price(double food_price) {
        this.food_price = food_price;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

}
