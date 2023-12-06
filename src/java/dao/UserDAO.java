/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.AccountDTO;
import dto.OrderDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author ACER
 */
public class UserDAO {
     public static ArrayList<AccountDTO> getAllAccount() throws Exception {
        ArrayList<AccountDTO> kq = new ArrayList<>();
         Connection cn = DBUtils.makeConnection();
         if(cn!=null){
      String sql = "SELECT [accID],[email],[fullname],[phone],[status],[role],[address] FROM [FlowerShop].[dbo].[Accounts]";
              PreparedStatement pst=cn.prepareStatement(sql);
             
              ResultSet rs=pst.executeQuery();
               while(rs.next()){
                   Integer accId = rs.getInt("accID");
                   String email =rs.getString("email");
                   String name = rs.getString("fullname");
                   String phone = rs.getString("phone");
                   int status = rs.getInt("status");
                   String address = rs.getString("address");
                   int role = rs.getInt("role");
                 AccountDTO user = new AccountDTO(accId, email,name, phone, status, role, address);
                 kq.add(user);

               }
               cn.close();
               
        }
        return kq ;
    }
    
    public static boolean InsertUser(String newEmail, String newPassword,String newName,String newPhone,int newStatus,String newRole,String newAddress) throws Exception{
        Connection cnn=null;
        PreparedStatement prs=null;
        try{
            cnn=DBUtils.makeConnection();
            if (cnn !=null) {
                String sql="INSERT INTO Accounts(email,password,fullname,phone,status,role,address) values(?, ?, ?, ?, ?, ?, ?)";
                prs =cnn.prepareStatement(sql);
                prs.setString(1, newEmail);
                prs.setString(2, newPassword);
                prs.setString(3, newName);
                prs.setString(4, newPhone);
                prs.setInt(5, newStatus);
                prs.setString(6, newRole);
                prs.setString(7, newAddress);
                int rowAffected=prs.executeUpdate();
                return rowAffected >0;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            try{
                if (prs !=null) {
                    prs.close();
                }
                if (cnn !=null) {
                    cnn.close();
                }
            }
            catch(SQLException e){
                e.printStackTrace();
            }
        }
        return false;
    }
    public static int UpdateUser(String email, String pwd, String name, String add, String phone,String id) throws Exception{
         int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if(cn!=null){
            String sql ="update [dbo].[Accounts] set [email]=?,[password]=?,[fullname]=?,[phone]=?,[address]=? where [accID]=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, pwd);
            pst.setString(3, name);
            pst.setString(4, phone);
            pst.setString(5, add);
            pst.setString(6, id);

            rs = pst.executeUpdate();
            cn.close();
        }
        
        
        return rs;
    }
    
      public static int deleteUser(String id,String status) throws SQLException, Exception{
        int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if(cn!=null){
            String sql ="update [dbo].[Accounts] set [status] =? where [accID]=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, status);
            pst.setString(2, id);
            rs = pst.executeUpdate();
        }
        return rs;
    }
}
