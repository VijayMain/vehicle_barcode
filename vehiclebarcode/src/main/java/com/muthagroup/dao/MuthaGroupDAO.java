package com.muthagroup.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.muthagroup.connection.ConnectionModel;
import com.muthagroup.vo.MuthaGroupVO;

public class MuthaGroupDAO {
	Connection con=ConnectionModel.getConnection2();
	String sql =null;
	PreparedStatement ps=null;
	ResultSet rs =null;
	public boolean validateUser(MuthaGroupVO vo){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con2=null;
				con2 = DriverManager.getConnection("jdbc:mysql://192.168.0.7/complaintzilla", "root","root");
			sql = "select * from user_tbl where Login_Name='"+vo.getUserName()+"' and Login_Password='"+vo.getPassword()+"'";
			ps = con2.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next())
			{	
				return true;
			}
			return false;
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			return false;
		}
      	
        
}

