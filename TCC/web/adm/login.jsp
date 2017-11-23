<%@page import="util.Criptografia"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista = dao.listar();
    String msg = "";
    if (request.getParameter("email") != null) {
        for (Usuario u : lista) {
            if (request.getParameter("email").equals(u.getEmail()) && Criptografia.convertPasswordToMD5(request.getParameter("senha")).equals(u.getSenha()) && u.getAdm()) {
                session.setAttribute("usuarioAdm", u);
                response.sendRedirect("index.jsp");
            }
        }
    }
    if (request.getParameter("email") != null) {
        if (request.getParameter("email").equals("0")) {
            msg = "Para acessar esta seção por favor efetue seu login abaixo";
        }
    }
%>
<html>
    <head>
        <title>Login</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="assetsLogin/css/animate.css">
        <!-- Custom Stylesheet -->
        <link rel="stylesheet" href="assetsLogin/css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="top">
                <h1 id="title">Área Administrativa</h1>
            </div>
            <div class="login-box animated fadeInUp">
                <div class="box-header">
                    <h2>Login</h2>
                </div>
                <form name ="login" action="#" method="post">
                    <label for="email">E-mail</label><br/>
                    <input type="text" id="username" name="email" required><br />
                    <label for="senha">Senha</label><br />
                    <input type="password" id="password" name="senha" required><br />
                    <button type="submit">Enviar</button>
                </form><br />
                <!--<a href=""><p class="small">Registrar-se</p></a>-->
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('#logo').addClass('animated fadeInDown');
                $("input:text:visible:first").focus();
            });
            $('#email').focus(function () {
                $('label[for="email"]').addClass('selected');
            });
            $('#email').blur(function () {
                $('label[for="username"]').removeClass('selected');
            });
            $('#senha').focus(function () {
                $('label[for="senha"]').addClass('selected');
            });
            $('#senha').blur(function () {
                $('label[for="senha"]').removeClass('selected');
            });
        </script>
    </body>
</html>
