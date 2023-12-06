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
public class ordDetailDTO {
    private int detailID;
    private int ordID;
    private int flowID;
    private int quantity;
    private int price;

    public ordDetailDTO(int detailID, int ordID, int flowID, int quantity, int pricae) {
        this.detailID = detailID;
        this.ordID = ordID;
        this.flowID = flowID;
        this.quantity = quantity;
        this.price = pricae;
    }

    public ordDetailDTO() {
    }

    public ordDetailDTO(int orderID, int flowID, int quantity, int price) {
         this.ordID = ordID;
        this.flowID = flowID;
        this.quantity = quantity;
        this.price = price;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getOrdID() {
        return ordID;
    }

    public void setOrdID(int ordID) {
        this.ordID = ordID;
    }

    public int getFlowID() {
        return flowID;
    }

    public void setFlowID(int flowID) {
        this.flowID = flowID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int pricae) {
        this.price = pricae;
    }
    
    
}
