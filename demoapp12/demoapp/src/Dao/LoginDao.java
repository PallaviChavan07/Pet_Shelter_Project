package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.PetCategory;
import model.UserAccount;

public class LoginDao {

	public boolean checkCredentials(Connection conn, String username, String password) {
		//String sql = "select username, pass from login where username = ? and pass = ?";
		String sql = "Select person_id, person_password from userLogin_vw " + " where person_id = ? and person_password = ?";
 
        PreparedStatement pstm;
		try {
			pstm = conn.prepareStatement(sql);
			 pstm.setString(1, username);
		        pstm.setString(2, password);
		        ResultSet rs = pstm.executeQuery();
		 
		        if (rs.next()) {
		        	System.out.println("credential query has value should return true");
		            return true;
		        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		String sql = "Select person_id, person_password from userLogin_vw " + " where person_id = "+ username+"and person_password = "+password;
//		try {
//            Statement statement = conn.createStatement();
//            ResultSet result = statement.executeQuery(sql);
//                      
//				while (result.next()) {
//					System.out.println("credential query has value should return true");
//					return true;
//				}
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
       
		System.out.println("credential query Do NOT have value=====>> Returning false");
		return false;
	}
}
