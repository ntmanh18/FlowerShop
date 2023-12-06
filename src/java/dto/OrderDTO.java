/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ntmanh
 */
public class OrderDTO {
    private int ordID;
    private String ordDate;
    private String shipDate;
    private int ordStatus;
    private int accID;
    private  int total;

    public OrderDTO(int ordID, String ordDate, String shipDate, int ordStatus, int accID, int total) {
        this.ordID = ordID;
        this.ordDate = ordDate;
        this.shipDate = shipDate;
        this.ordStatus = ordStatus;
        this.accID = accID;
        this.total = total;
    }

    public OrderDTO() {
    }

    public OrderDTO(int ordID) {
        this.ordID = ordID;
    }

    public int getOrdID() {
        return ordID;
    }

    public void setOrdID(int ordID) {
        this.ordID = ordID;
    }

    public String getOrdDate() {
        return ordDate;
    }

    public void setOrdDate(String ordDate) {
        this.ordDate = ordDate;
    }

    public String getShipDate() {
        return shipDate;
    }

    public void setShipDate(String shipDate) {
        this.shipDate = shipDate;
    }

    public int getOrdStatus() {
        return ordStatus;
    }

    public void setOrdStatus(int ordStatus) {
        this.ordStatus = ordStatus;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    

   
    
    
}

