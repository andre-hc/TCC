<%@page import="modelo.Receita"%>
<%@page import="dao.ReceitaDAO"%>
<%@page import="modelo.Ingrediente"%>
<%@page import="dao.IngredienteDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    Usuario usuario = new Usuario();

    CategoriaDAO catDAO = new CategoriaDAO();
    Categoria catObj = new Categoria();

    if (request.getParameter("id") != null) {
        catObj = catDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
    } else {
        response.sendRedirect("listagemcategoria.jsp?erro=1");
    }
    
    ReceitaDAO recDAO = new ReceitaDAO();
    List<Receita> recListCat = recDAO.listarReceitaCategoria(request.getParameter("id"));

    if (session.getAttribute("usuario") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
    }



%>

<!DOCTYPE HTML>
<!--
        Front-end: html5up.net | André Huber | Ícaro Crespo 
        Back-end: André Huber | Ícaro Crespo
-->
<html>
    <head>
        <title>O que vamos preparar hoje?</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="../assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="../assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="../assets/css/ie8.css" /><![endif]-->
    </head>
    <body>

        <!-- Wrapper -->
        <div id="wrapper">
            <!-- Main -->
            <div id="main">
                <div class="inner">

                    <!-- Header -->
                    <header id="header">
                        <a href="../geral/index.jsp" class="logo"><strong>O que vamos preparar hoje?</strong></a>
                        <!--<ul class="icons">
                                                    <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                                                    <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                                                </ul>-->
                    </header>

                    <!-- Banner -->
                    <section id="banner">
                        <div class="content">
                            <header>
                                <h1><%=catObj.getNome()%></h1>
                                <p> <%=catObj.getDescricao()%></p>
                            </header><br><br>
                            <center>
                                <ul class="actions">
                                    Subcategorias de <%=catObj.getNome()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    Receitas de <%=catObj.getNome()%><br>
                                    <li><a href="../listagem/listagemsubcategoria.jsp?idcat=<%=catObj.getId()%>" class="button big">Ir para</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                    <li><a href="../listagem/listagemreceita.jsp?idcat=<%=catObj.getId()%>" class="button big">Ir para</a></li>
                                </ul>
                            </center>
                        </div>
                        <span class="image object">
                            <img src="../fotos/<%=catObj.getFoto()%>" alt="<%=catObj.getNome()%>" />
                        </span>
                    </section>

                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>Receitas - <%=catObj.getNome()%></h2>
                        </header>
                        <div class="features">
                            <%
                                for (Receita item : recListCat) {
                            %>
                            <article>
                                <span class="icon fa-diamond"></span>
                                <div class="content">
                                    <h3><%=item.getNome()%></h3>
                                    <p><%=item.getDescricao()%>.</p>
                                </div>
                            </article>
                            <%
                                }
                            %>
                        </div>
                    </section>

                </div>
            </div>

            <%@include file="../includes/cabecalho.jsp"%>

        </div>
        <!-- Scripts -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/skel.min.js"></script>
        <script src="../assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="../assets/js/main.js"></script>
    </body>
</html>

<!-- Exemplo Função Javascript pesquisa -->

<!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  } );
  </script>
</head>
<body>
 
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags">
</div>-->