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
public class AccountDTO {
    private int accID;
    private String email;
    private String password;
    private String fullname;
    private String phone;
    private int status;
    //status = 1 -> active
    //status = 0 -> block
    private int role;
    //role=0 -> user
    //role=1 -> admin
    //role=2 -> shipper
    private String address;

    public AccountDTO(int accID, String email, String password, String fullname, String phone, int status, int role, String address) {
        this.accID = accID;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.status = status;
        this.role = role;
        this.address = address;
    }
    
    public AccountDTO(int accID, String email, String fullname, String phone, int status, int role, String address) {
        this.accID = accID;
        this.email = email;
        this.fullname = fullname;
        this.phone = phone;
        this.status = status;
        this.role = role;
        this.address = address;
    }

    public AccountDTO() {
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
    
}
