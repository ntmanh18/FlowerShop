/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.FlowerDTO;
import dto.OrderDTO;
import dto.ordDetailDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mylib.DBUtils;

/**
 *
 * @author ntmanh
 */
public class OrderDAO {
    public static int inserOrder(Integer status,int accID,double total, HashMap<FlowerDTO,Integer> cart ) throws Exception{
        int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if(cn!=null){
            cn.setAutoCommit(false);
            String sql ="insert [dbo].[Orders]([OrdDate],[status],[AccID],[Total]) values (?,?,?,?)";
            Date d = new Date(System.currentTimeMillis());
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setDate(1, d);
            pst.setInt(2, status);
            pst.setInt(3, accID);
            pst.setDouble(4, total);
            rs = pst.executeUpdate();
            if(rs>0){
                sql = "select top 1 [OrderID] from [dbo].[Orders] order by [OrderID] desc";
                pst = cn.prepareStatement(sql);
                ResultSet table = pst.executeQuery();
                
                if(table!=null && table.next()){
                    int ordrid = table.getInt("OrderID");
                    for(FlowerDTO item : cart.keySet()  ){
                        int itemId = item.getFlowID();
                        int quantity = cart.get(item);
                        int price = item.getPrice();
                        sql = "insert [dbo].[OrderDetails] ([OrderID],[Price],[quantity],[FlowID]) values (?,?,?,?)";
                        pst=cn.prepareStatement(sql);
                        pst.setInt(1,ordrid);
                        pst.setInt(2, price);
                        pst.setInt(3,quantity );
                        pst.setInt(4, itemId);
                        pst.executeUpdate();
                    }
                }
            }
            
             cn.commit();// ket thuc transession
            cn.setAutoCommit(true);
        }
        return rs;
    }
    
    public static List<OrderDTO> Order(int AccID,int status) throws Exception{
        ArrayList<OrderDTO> orders = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if(cn!=null){
            if(AccID == 0){
            }else{
            if(status==0){
                 String sql="select [OrderID], [status], [OrdDate], [Total] from [dbo].[Orders] where  [AccID] =?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, AccID);
            
            ResultSet rs = pst.executeQuery();
            if(rs!=null){
                while(rs.next()){
                    int state = rs.getInt("status");
                    int ordId = rs.getInt("OrderID");
            Date ordDate=rs.getDate("OrdDate");
            int total = rs.getInt("Total");
            OrderDTO ord = new OrderDTO(ordId, ordDate.toString(), "", state, AccID, total);
            orders.add(ord);
                }
            }
            }
            else{
                String sql="select [OrderID], [OrdDate],[status], [Total] from [dbo].[Orders] where [status]=? and [AccID] =?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setInt(2, AccID);
            ResultSet rs = pst.executeQuery();
            if(rs!=null){
                while(rs.next()){
                     int state = rs.getInt("status");
                    int ordId = rs.getInt("OrderID");
            Date ordDate=rs.getDate("OrdDate");
            int total = rs.getInt("Total");
            OrderDTO ord = new OrderDTO(ordId, ordDate.toString(), "", state, AccID, total);
            orders.add(ord);
                }
            } 
            }
        }
            
            cn.close();
        }
        return orders;
    }
    
     public static List<OrderDTO> AllOrder(int status) throws Exception{
        ArrayList<OrderDTO> orders = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if(cn!=null){
            
            if(status==0){
                 String sql="select [OrderID],[OrdDate],[shipdate],[status],[AccID],[Total] from [dbo].[Orders]";
            PreparedStatement pst = cn.prepareStatement(sql);
            
            
            ResultSet rs = pst.executeQuery();
            if(rs!=null){
                while(rs.next()){
                    int state = rs.getInt("status");
                    int ordId = rs.getInt("OrderID");
                    Date ordDate=rs.getDate("OrdDate");
                    String shipDate =" ";
                    try{
                   shipDate = rs.getDate("shipdate").toString();
                    }
                    catch(Exception e){}
                    Integer accID = rs.getInt("AccID");      
                    int total = rs.getInt("Total");
            OrderDTO ord = new OrderDTO(ordId,ordDate.toString(),shipDate,state,accID,total);
            orders.add(ord);
                }
            }
            }
            else{
                String sql="select [OrderID],[OrdDate],[shipdate],[status],[AccID],[Total] from [dbo].[Orders] where [status]=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            
            ResultSet rs = pst.executeQuery();
            if(rs!=null){
              while(rs.next()){
                    
                    int ordId = rs.getInt("OrderID");
                    Date ordDate=rs.getDate("OrdDate");
                     String shipDate =" ";
                   try{
                   shipDate = rs.getDate("shipdate").toString();
                    }
                    catch(Exception e){}
                    Integer accID = rs.getInt("AccID");      
                    int total = rs.getInt("Total");
            OrderDTO ord = new OrderDTO(ordId,ordDate.toString(),shipDate,status,accID,total);
            orders.add(ord);
                }
            } 
            }
        }
        
        return orders;
    }
    
    
    public static OrderDTO lastOrd(int AccID) throws Exception{
         Connection cn = DBUtils.makeConnection();
         OrderDTO ord = null; 
         if(cn!=null){
             String sql = "select top 1 [OrderID],[OrdDate],[shipdate],[status],[AccID],[Total] from [dbo].[Orders] where [AccID] =? order by [OrderID] desc";
             PreparedStatement   pst = cn.prepareStatement(sql);
             pst.setInt(1, AccID);
             ResultSet rs = pst.executeQuery();
              if(rs!=null & rs.next()){
                  
                  
                   Integer ordId = rs.getInt("OrderID");
                   String ordDate =rs.getDate("OrdDate").toString();
                   
                   String shipDate2 = " ";
                   
                   Integer status = rs.getInt("status");
                   Integer total = rs.getInt("Total");
                   Integer accID = rs.getInt("AccID");
                 
                   ord = new OrderDTO(ordId,ordDate,shipDate2,status,accID,total);
                  
                   

               }
             cn.close();
         }
         return ord;
    }
    public static List<ordDetailDTO>  orderDetail(String ordID) throws Exception{
         ArrayList<ordDetailDTO> details = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if(cn!=null){
            String sql = "select [OrderID], [Price],[quantity], [FlowID] from [dbo].[OrderDetails] where [OrderID]=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, ordID);
            ResultSet rs = pst.executeQuery();
            if(rs!=null){
                while(rs.next()){
                    
                    int orderID = rs.getInt("OrderID");
                    int flowID = rs.getInt("FlowID");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("Price");
                    ordDetailDTO deltail = new ordDetailDTO( orderID, flowID, quantity, price);
                    details.add(deltail);
                }
            }
        }
        return details;
    }
    
    public static OrderDTO getOrderByID(String id) {
        OrderDTO result = null;
         Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         if(cn!=null){
            try {
                String sql = "select [OrderID],[OrdDate],[shipdate],[status],[AccID],[Total] from [dbo].[Orders] where [OrderID]=?";
                PreparedStatement pst = null;
                try {
                    pst = cn.prepareStatement(sql);
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
                pst.setString(1, id);
                ResultSet rs=pst.executeQuery();
                if(rs!=null & rs.next()){
                    try{
                        
                        Integer ordId = rs.getInt("OrderID");
                        String ordDate =rs.getDate("OrdDate").toString();
                        Date shipDate = rs.getDate("shipdate");
                        String shipDate2 = " ";
                        Integer status = rs.getInt("status");
                        Integer total = rs.getInt("Total");
                        Integer accID = rs.getInt("AccID");
                        if(shipDate == null){
                            result = new OrderDTO(ordId,ordDate,shipDate2,status,accID,total);
                        }
                        else{
                            result = new OrderDTO(ordId,ordDate,shipDate.toString(),status,accID,total);
                        }}
                    catch(SQLException ex){}
                    
                    
                }
                cn.close();
                
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
               
        }
        return result;
    }
    
    public static int deleteOrder(String id) throws Exception{
         int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if(cn!=null){
        String sql ="update [dbo].[Orders] set [status] = 3 where [OrderID] =?";
         PreparedStatement pst = cn.prepareStatement(sql);
         pst.setString(1, id);
          rs = pst.executeUpdate();
        }
        return rs;
    }
    public static int updateOrder(String status, String ordDate, String shipDate, String id) throws Exception{
        int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if(cn!=null){
        String sql ="update [dbo].[Orders] set [status] =? , [OrdDate]=?,[shipdate]=? where [OrderID]=?";
         PreparedStatement pst = cn.prepareStatement(sql);
          pst.setString(1, status);
          pst.setString(2, ordDate);
          pst.setString(3, shipDate);
          pst.setString(4, id);
          rs = pst.executeUpdate();
        }
        return rs;
    }
    }

