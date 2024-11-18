<%-- 
    Document   : delete
    Created on : 18-Nov-2024, 5:49:17 PM
    Author     : Rahul
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String userId = request.getParameter("userId");
            Connection con = null;
            try {
                //loading drivers
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                //establishing connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
                
                //preparing query
                PreparedStatement pstmt = con.prepareStatement("DELETE FROM data WHERE id = ?");
                pstmt.setString(1, userId);
                int rowInserted = pstmt.executeUpdate();
                
                if (rowInserted > 0) {
                    // Redirect to viewData page after successful insertion
                    response.sendRedirect("viewData.jsp");
                } else {
                    out.print("failed deleting data!");
                }
            } catch (SQLException ex){
                out.print(ex.getMessage());
            }
        %>
    </body>
</html>
