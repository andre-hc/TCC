<%
    if (request.getParameter("logout") != null) {
        if (request.getParameter("logout").equals("true")) {
            session.removeAttribute("usuarioAdm");
            response.sendRedirect("login.jsp?logout=success");
        }
    }else{
        response.sendRedirect("index.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saindo</title>
    </head>
    <body>
    </body>
</html>
