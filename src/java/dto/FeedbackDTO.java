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
public class FeedbackDTO {
    private int fdID;
    private int ordID;
    private int accID;
    private String date;
    private String  content;

    public FeedbackDTO() {
    }

    public FeedbackDTO(int fdID, int ordID, int accID, String date, String content) {
        this.fdID = fdID;
        this.ordID = ordID;
        this.accID = accID;
        this.date = date;
        this.content = content;
    }

    public int getFdID() {
        return fdID;
    }

    public void setFdID(int fdID) {
        this.fdID = fdID;
    }

    public int getOrdID() {
        return ordID;
    }

    public void setOrdID(int ordID) {
        this.ordID = ordID;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
}
