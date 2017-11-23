<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista = dao.listar();

    if (request.getParameter("txtLoginE") != null) {
        for (Usuario u : lista) {
            if (request.getParameter("login").equals(u.getEmail()) && request.getParameter("senha").equals(u.getSenha())) {
                session.setAttribute("usuario", u);
                response.sendRedirect("index.jsp");
            }
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="logincss.css" type="text/css" media="screen" />
    </head>
    <body>
        <div id="login">
            <h3>Entre Aqui</h3>
            <form action="login.jsp" method="post">
                <label>Login:</label>
                <input type="text" name="login" required><br>
                <label>Senha:</label>
                <input type="password" name="senha" required><br>
                <input type="submit" value="Entrar"/>
            </form>
        </div>
    </body>
</html>