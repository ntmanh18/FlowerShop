/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import dto.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author ntmanh
 */
public class CategoryDAO {
     public static ArrayList<CategoryDTO> getCategory() {
        ArrayList<CategoryDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [CateID], [CateName] from [dbo].[Categories] ";
               
                PreparedStatement stm = cn.prepareStatement(sql);
             
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    CategoryDTO cate = new CategoryDTO(rs.getInt(1),rs.getString(2));
                    list.add(cate);
                }
                return list;
            }
        } catch (Exception e) {

        }
        return null;

    }
    
}
