<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>                    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> server </title>
</head>
<body>

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
        
        String xmlStr = "";
        xmlStr += "<general>";
        
        while(rs.next()) {
            xmlStr += "<person>";
            
            xmlStr += "<name>" + rs.getString("NAME") + "</name>";
            xmlStr += "<email>" + rs.getString("EMAIL") + "</email>";
            xmlStr += "<password>" + rs.getString("PASSWORD") + "</password>";
            xmlStr += "<studentphone>" + rs.getString("STUDENTPHONE") + "</studentphone>";
            xmlStr += "<parentphone>" + rs.getString("PARENTPHONE") + "</parentphone>";
            
            xmlStr += "</person>";
        }
        xmlStr += "</general>";
        
        out.write(xmlStr);

    } catch (Exception e) { 
        out.println("error : " + e);
    } 
   
%>
</body>
</html>

