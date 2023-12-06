/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;

/**
 *
 * @author Tuan Hung
 */
public class FlowerDTO implements Serializable {

    private int flowID;
    private String flowName;
    private int price;
    private String imgPath;
    private String description;
    private int status;
    private int cateid;
    private String catename;
  

    public FlowerDTO(int ID, String FlowName, int price, String imgPath, String description, int status, int cateId) {
        
         this.flowID = ID;
        this.flowName = FlowName;
        this.price = price;
        this.imgPath = imgPath;
        this.description = description;
        this.status = status;
        this.cateid = cateId;
        
    }
    


    public FlowerDTO(int flowID, String flowName, int price, String imgPath, String description, int status, int cateid, String catename) {
        this.flowID = flowID;
        this.flowName = flowName;
        this.price = price;
        this.imgPath = imgPath;
        this.description = description;
        this.status = status;
        this.cateid = cateid;
        this.catename = catename;
    }

    public int getFlowID() {
        return flowID;
    }

    public void setFlowID(int flowID) {
        this.flowID = flowID;
    }

    public String getFlowName() {
        return flowName;
    }

    public void setFlowName(String flowName) {
        this.flowName = flowName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

}
