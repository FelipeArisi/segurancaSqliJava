<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%@ page import="java.sql.*" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

        <title>JSP Page</title>
    </head>
    <body>
        <%
        /*try{
           /* String driver = "oracle.jdbc.driver.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
            String user = "c##felipe";
            String senha = "arisi";

            //Class.forName(driver);
            Class.forName("oracle.jdbc.driver.OracleDriver");  

            Connection conn = DriverManager.getConnection(url, user, senha);
            out.println("Driver Carregando");
            
            //Teste de INSERT - verificar se a conexão está okay
            /*String sql = "INSERT INTO TRABALHOFINAL (NAME, PASSWORD, LOGIN) VALUES ('teste', '123', 'logint')";
            Statement statement = conn.createStatement();
            int rows = statement.executeUpdate(sql);

            if(rows > 0 ){
                out.println("A row has been inserted");
            }
            String sql = "SELECT name FROM TRABALHOFINAL";
            Statement statement = conn.createStatement();
            ResultSet result = statement.executeQuery(sql);
            
            /*while (result.next()){
                String name = result.getString("NAME");
                out.println(name);
            }
            conn.close();*
        }catch(ClassNotFoundException e){
            out.println("Erro ao carregar Drive "+e);
        }*/
        
    %>
    





    <form name="frmLogin" type="post">
        <table>
            <tr>
                <td>Username</td>
                <td><input type="text" id="login" name="login"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" id="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2">
                 <INPUT TYPE="HIDDEN" NAME="buttonName">
                <button id="sendMailBtn" type="submit">Login</button></td>
            </tr>
        </table>
    </form>
    <p style="color: red" >
    <% 
        if(request.getParameter("buttonName") != null) {
            String login = request.getParameter("login");
            String password = request.getParameter("password"); 

            String driver = "oracle.jdbc.driver.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
            String user = "c##felipe";
            String senha = "arisi";

            //Class.forName(driver);
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");  
                
            }catch(ClassNotFoundException e){
                out.println("Erro ao carregar Drive "+e);
            }
            
            Connection conn = DriverManager.getConnection(url, user, senha);

            String sql = "SELECT name FROM TRABALHOFINAL WHERE login = '"+login+"' AND password = '"+password+"' ";
            Statement statement = conn.createStatement();
            
            ResultSet result = statement.executeQuery(sql);

            /*String name = result.getString("NAME");*/
            while (result.next()){
                String name = result.getString("NAME");
                out.println(name);
            }

            conn.close();
        }
    %>
    </p>
    </body>
</html>
