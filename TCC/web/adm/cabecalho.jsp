<%@page import="modelo.Usuario"%>
<%
    Usuario u = new Usuario();
    if (session.getAttribute("usuarioAdm") == null) {
        response.sendRedirect("../login.jsp?login=0");
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
        <link rel="stylesheet" href="../assets/css/main.css" />
<!--        <link rel="stylesheet" href="../assets/css/ie8.css" />
        <link rel="stylesheet" href="../assets/css/ie9.css" />-->
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../assets/css/font-awesome.min.css" />
        <link rel="stylesheet" href="../carrossel-receita/css/owl.carousel.css" type='text/css'>
        <script src="../carrossel-receita/js/respond.min.js"></script>

    </head>
    <body>
        <!-- Header -->
        <div id="header">
            <div class="top">

                <!-- Logo -->
                <div id="logo">
                    <span class="image avatar48"><img src="../../fotos/fotosPerfil/<%=u.getFoto()%>" alt="" /></span>
                    <a href="../sair.jsp?logout=true">Sair da conta</a>
                    <h1 id="title"><%=u.getNome()%></h1>
                    <p><%=u.getEmail()%></p>
                </div>

                <!-- Nav -->
                <nav id="nav">
                    <ul>
                        <li><a href="../receita/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Receita</span></a></li>
                        <li><a href="../categoria/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Categoria</span></a></li>
                        <li><a href="../subcategoria/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Subcategoria</span></a></li>
                        <li><a href="../medida/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Medida</span></a></li>
                        <li><a href="../ingrediente/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Ingrediente</span></a></li>
                        <li><a href="../medidaingrediente/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Medida-Ingrediente</span></a></li>
                        <li><a href="../comentario/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Comentário</span></a></li>
                        <li><a href="../favorito/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Favorito</span></a></li>
                        <li><a href="../usuario/" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Usuário</span></a></li>
                    </ul>
                </nav>
            </div>
        </div>