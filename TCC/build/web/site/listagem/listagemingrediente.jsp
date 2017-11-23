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
    List<Categoria> catListAleat = catDAO.listarAleatorio();
    List<Categoria> catListAcesso = catDAO.listarMaisAcessado();
    List<Categoria> catList = catDAO.listar();

    ReceitaDAO recDAO = new ReceitaDAO();
    List<Receita> recListAleat = recDAO.listarAleatorio();
    List<Receita> recListaAcesso = recDAO.listarMaisAcessado();

    IngredienteDAO ingDAO = new IngredienteDAO();
    List<Ingrediente> ingList = ingDAO.listar();

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
        <title>O que vamos preparar hoje</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="../assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
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
                        <!--                        <ul class="icons">
                                                    <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                                                    <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                                                </ul>-->
                    </header>

                    <!-- Banner -->
                    <section id="banner">
                        <div class="content">
                            <header>
                                <h1>O que vamos preparar hoje?</h1>
                                <p> Um jeito novo de praticar a arte da culinária</p>
                            </header>
                            <p align="justify">Não é um expert na cozinha? Sabe a receita que a sua vó deixou de herança? Tem poucas coisas em casa e bateu aquela fome? Clique nos botões ao lado e descubra o que o nosso site pode fazer por você!</p>
                            <!--                            <ul class="actions">
                                                            <li><a href="#" class="button big">Learn More</a></li>
                                                        </ul>-->
                        </div>
                        <span class="image object">
                            <img src="images/andre%20avoado.jpg" alt="André avoado" />
                        </span>
                    </section>

                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>Receitas mais acessadas</h2>
                        </header>
                        <div class="features">
                            <%
                                for (Receita item : recListaAcesso) {
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
                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>Categorias mais acessadas</h2>
                        </header>
                        <div class="posts">

                            <%
                                for (Categoria item : catListAcesso) {
                            %>
                            <article>
                                <a href="" class="image"><img src="<%=item.getFoto()%>" alt="" /></a>
                                <h3><%=item.getNome()%></h3>
                                <p>Clique para acessar receitas desta categoria!.</p>
                                <ul class="actions">
                                    <li><a href="#" class="button">More</a></li>
                                </ul>
                            </article>
                            <%
                                }
                            %>
                        </div>
                    </section>
                </div>
            </div>

            <!-- Sidebar -->
            <%@include file="../includes/cabecalho.jsp"%>
        </div>
        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>
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