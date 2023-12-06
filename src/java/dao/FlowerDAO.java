/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.FlowerDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mylib.DBUtils;

/**
 *
 * @author Tuan Hung
 */
public class FlowerDAO {

    public static ArrayList<FlowerDTO> getFlowers(String keyword, String searchby) {
        ArrayList<FlowerDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && searchby != null) {
                String sql = "select  f.FlowID,f.FlowName,f.price,f.imgPath,f.description,f.status,f.CateID, c.CateName from Flower f, Categories c where f.CateID = c.CateID and";
                if (searchby.equalsIgnoreCase("byname")) {
                    sql += " f.FlowName like ?";
                } else {
                    sql += " c.CateName like ?";
                }
                PreparedStatement stm = cn.prepareStatement(sql);
                stm.setString(1, "%" + keyword + "%");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    FlowerDTO flower = new FlowerDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
                    list.add(flower);
                }
                return list;
            }
        } catch (Exception e) {

        }
        return null;

    }
    
    public static FlowerDTO getFlowerById(String id) throws Exception{
        FlowerDTO result = null;
        Connection cn=DBUtils.makeConnection();
        if(cn!=null){
      String sql = "select  f.FlowID,f.FlowName,f.price,f.imgPath,f.description,f.status,f.CateID,c.CateName from Flower f, Categories c where f.CateID = c.CateID and f.FlowID=?";
;
              PreparedStatement pst=cn.prepareStatement(sql);
              pst.setString(1, id);
              ResultSet rs=pst.executeQuery();
               if(rs!=null & rs.next()){
                   int ID = rs.getInt("FlowID");
                   String FlowName = rs.getString("FlowName");
                   int price = rs.getInt("price");
                   String imgPath = rs.getString("imgPath");
                   String description = rs.getString("description");
                   int status = rs.getInt("status");
                   int cateId = rs.getInt("CateID");
                   String cateName = rs.getString("CateName");
                  
                   result = new FlowerDTO(cateId, FlowName, price, imgPath, description, status, cateId,cateName );

               }
               cn.close();
               
        }
        return result;
    }
    
   
    
    public static int deleteFlower(String id,String status) throws SQLException, Exception{
        int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if(cn!=null){
            String sql ="update [dbo].[Flower] set [status] = ? where [FlowID] =?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, status);
            pst.setString(2, id);
            rs = pst.executeUpdate();
        }
        return rs;
    }
    
    public static int insertFlower(String name,String price, String img,String desc, String status, String cateID) throws Exception{
        int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if(cn!=null)
        {
        String sql="insert [dbo].[Flower]([FlowName],[price],[imgPath],[description],[status],[CateID]) values(?,?,?,?,?,?)";
        PreparedStatement pst = cn.prepareStatement(sql);
        
        pst.setString(1, name);
        pst.setString(2,price);
        pst.setString(3, img);
        pst.setString(4, desc);
        pst.setString(5,status);
        pst.setString(6,cateID);
        rs = pst.executeUpdate();
        }
        return  rs;
    }
    
    public static int update(String id,String name, String price) throws SQLException, Exception{
        int rs = 0;
        Connection cn = DBUtils.makeConnection();
        if(cn!=null){
            String sql ="update [dbo].[Flower] set [FlowName]=? , [price]=? where [FlowID]=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, price);
            pst.setString(3, id);
            rs = pst.executeUpdate();
        }
        return rs;
    }
    
}
