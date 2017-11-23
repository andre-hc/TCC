<%@page import="util.Criptografia"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%   
    if (request.getMethod().equals("POST")) {
        UsuarioDAO dao = new UsuarioDAO();
        List<Usuario> usuario = dao.listar();
        
        for (Usuario item : usuario) {
            if (request.getParameter("txtEmail").equals(item.getEmail()) && Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")).equals(item.getSenha())) {
               session.setAttribute("usuario", item);
               response.sendRedirect("index.jsp");
            }
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
