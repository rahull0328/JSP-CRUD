<%-- 
    Document   : insert
    Created on : 16-Nov-2024, 4:09:44 PM
    Author     : Rahul
--%>

<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            Connection con = null;
            
            try{
                //loading drivers
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                //establishing connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
                
                //preparing query
                PreparedStatement pstmt = con.prepareStatement("INSERT INTO data(name, email, mobile) VALUES(?, ?, ?)");
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, mobile);
                int rowInserted = pstmt.executeUpdate();
                
                if (rowInserted > 0) {
                    // Redirect to viewData page after successful insertion
                    response.sendRedirect("viewData.jsp");
                } else {
                    out.print("Data insertion failed!");
                }
            } catch (SQLException ex) {
               out.print(ex.getMessage());
          }
        %>
    </body>
</html>
