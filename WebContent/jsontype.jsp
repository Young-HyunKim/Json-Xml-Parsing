<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>                    
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>

<% 
	try {
        String driver = "oracle.jdbc.driver.OracleDriver";
        Class.forName(driver);
        
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        String id = "temp1";
        String pw = "1234";
        
        Connection conn = DriverManager.getConnection(url, id, pw); 
        
        Statement st = conn.createStatement();
        String sql = "SELECT NAME, EMAIL, PASSWORD, STUDENTPHONE, PARENTPHONE FROM MEMBER";
        st.executeUpdate(sql);
        ResultSet rs = st.executeQuery(sql);
        
 		JSONArray jsonArray = new JSONArray();			
 		
 		while(rs.next()){								
 			JSONObject member = new JSONObject();		
 	 		
 			// DB데이터를 JSON객체에 담기
 	 		member.put("name", rs.getString("NAME"));
 	 		member.put("email", rs.getString("EMAIL"));
 	 		member.put("password", rs.getString("PASSWORD"));
 	 		member.put("studentPhone", rs.getString("STUDENTPHONE"));
 	 		member.put("parentPhone", rs.getString("PARENTPHONE"));
 	 		
 	 		
 	 		jsonArray.add(member);
 		}

 		out.print(jsonArray);

    } catch (Exception e) { 
        out.println("error : " + e);
    } 
   
%>
