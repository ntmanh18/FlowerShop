/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.AccountDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import mylib.DBUtils;

/**
 *
 * @author Tuan Hung
 */
public class AccountDAO {

    public static AccountDTO getAccount(String ac, String ps) throws Exception {
        AccountDTO kq = null;
        Connection cn = mylib.DBUtils.makeConnection();
        if (cn != null) {
            String s = "SELECT accID, email, password, fullname, phone, status, role, address "
                    + "FROM Accounts "
                    + "WHERE email = ? AND password = ? COLLATE Latin1_General_CS_AI";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, ac);
            pst.setString(2, ps);
            ResultSet rs = rs = pst.executeQuery();

            try {
                
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("accID");
                        String email = rs.getString("email");
                        String password = rs.getString("password");
                        String fullname = rs.getString("fullname");
                        String phone = rs.getString("phone");
                        int status = rs.getInt("status");
                        int role = rs.getInt("role");
                        String address = rs.getString("address");
                        kq = new AccountDTO(id, email, password, fullname, phone, status, role, address);
                    }
                }
            } finally {
                if (rs != null) {
                    rs.close();
                }
                cn.close();
            }
        }
        return kq;
    }
}
