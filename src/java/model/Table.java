/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Table {
    private int table_number;
    private int num_people;
    private String status;

    public Table() {
    }

    public Table(int table_number, int num_people, String status) {
        this.table_number = table_number;
        this.num_people = num_people;
        this.status = status;
    }

    public int getTable_number() {
        return table_number;
    }

    public void setTable_number(int table_number) {
        this.table_number = table_number;
    }

    public int getCapacity() {
        return num_people;
    }

    public void setCapacity(int num_people) {
        this.num_people = num_people;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
}
