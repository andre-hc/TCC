<%@page import="modelo.Usuario"%>
<%
    Usuario u = new Usuario();
    if (session.getAttribute("usuarioAdm") == null) {
        response.sendRedirect("login.jsp?login=0");
          return;
    }else{
        u = (Usuario) session.getAttribute("usuarioAdm");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>O que vamos preparar hoje - Admin</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" href="assets/css/ie8.css" />
        <link rel="stylesheet" href="assets/css/ie9.css" />
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />

    </head>
    <body>
        <!-- Header -->
        <div id="header">
            <div class="top">

                <!-- Logo -->
                <div id="logo">
                    <span class="image avatar48"><img src="fotosPerfil/<%=u.getFoto()%>" alt="" /></span>
                    <a href="sair.jsp?logout=true">Sair da conta</a>
                    <h1 id="title"><%=u.getNome()%></h1>
                    <p><%=u.getEmail()%></p>
                </div>

                <!-- Nav -->
                <nav id="nav">
                    <ul>
                        <li><a href="receita/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Receita</span></a></li>
                        <li><a href="categoria/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Categoria</span></a></li>
                        <li><a href="subcategoria/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Subcategoria</span></a></li>
                        <li><a href="medida/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Medida</span></a></li>
                        <li><a href="ingrediente/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Ingrediente</span></a></li>
                        <li><a href="medidaingrediente/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Medida-Ingrediente</span></a></li>
                        <li><a href="comentario/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Comentário</span></a></li>
                        <li><a href="favorito/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Favorito</span></a></li>
                        <li><a href="usuario/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Usuário</span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- Main -->
        <div id="main">

            <!-- Portfolio -->
            <section id="portfolio" class="two">
                <div class="container">
                    <header>
                        <h2>Área Administrativa</h2>
                    </header>
                </div>
            </section>
        </div>

        <!-- Footer -->
        <div id="footer">

            <!-- Copyright -->
            <ul class="copyright">
                <li>&copy; Desenvolvido por André Huber e Ícaro Crespo | Design: HTML5 UP.</li>
            </ul>
        </div>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/jquery.scrollzer.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>
    </body>
</html>