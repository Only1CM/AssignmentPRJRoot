/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Order {
    private int order_id;
    private int user_id;
    private int table_number;
    private String status;
    private Date create_date;
    private Date serve_date;
    private double total_price;

    public Order() {
    }

    public Order(int order_id, int user_id, int table_number, String status, Date create_date, Date serve_date, double total_price) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.table_number = table_number;
        this.status = status;
        this.create_date = create_date;
        this.serve_date = serve_date;
        this.total_price = total_price;
    }

    public Order(int user_id, int table_number, String status, Date create_date, Date serve_date, double total_price) {
        this.user_id = user_id;
        this.table_number = table_number;
        this.status = status;
        this.create_date = create_date;
        this.serve_date = serve_date;
        this.total_price = total_price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTable_number() {
        return table_number;
    }

    public void setTable_number(int table_number) {
        this.table_number = table_number;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getServe_date() {
        return serve_date;
    }

    public void setServe_date(Date serve_date) {
        this.serve_date = serve_date;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }
    
    
}
