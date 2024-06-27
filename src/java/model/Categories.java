/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author 84777
 */
public class Categories {
    private int cate_id;
    private int cate_name;

    public Categories() {
    }

    public Categories(int cate_id, int cate_name) {
        this.cate_id = cate_id;
        this.cate_name = cate_name;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public int getCate_name() {
        return cate_name;
    }

    public void setCate_name(int cate_name) {
        this.cate_name = cate_name;
    }
    
}
