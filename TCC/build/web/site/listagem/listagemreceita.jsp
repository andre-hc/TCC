<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Subcategoria"%>
<%@page import="dao.SubcategoriaDAO"%>
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
    CategoriaDAO catDAO = new CategoriaDAO();
    ReceitaDAO recDAO = new ReceitaDAO();
    SubcategoriaDAO subcatDAO = new SubcategoriaDAO();
    IngredienteDAO ingDAO = new IngredienteDAO();

    Usuario usuario = new Usuario();
    Receita recObj = new Receita();
    Categoria catObj;
    Subcategoria subcatObj;
    Ingrediente ingObj;

    List<Receita> recListCategoria = new ArrayList();
    List<Receita> recListSubCategoria = new ArrayList();
    List<Receita> recListIngrediente = new ArrayList();
    List<Receita> recListAcesso = new ArrayList();

    if (session.getAttribute("usuario") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
    }
    int filtro = 0;
    String msg = "";
    try {
        if (request.getParameter("idcat") != null) {
            catObj = new Categoria();
            catObj = catDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
            filtro = 1;
            msg = catObj.getNome();
            recListCategoria = recDAO.listarReceitaCategoria(request.getParameter("idcat"));
        } else if (request.getParameter("idsubcat") != null) {
            subcatObj = new Subcategoria();
            subcatObj = subcatDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
            filtro = 2;
            msg = subcatObj.getNome();
            recListSubCategoria = recDAO.listarReceitaSubCategoria(request.getParameter("idsubcat"));
        } else if (request.getParameter("iding") != null) {
            ingObj = new Ingrediente();
            ingObj = ingDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
            filtro = 3;
            msg = ingObj.getNome();
            recListIngrediente = recDAO.listarIngredienteReceita(request.getParameter("iding"));
        } else {
            filtro = 4;
            recListAcesso = recDAO.listarMaisAcessado();
            msg = "Mais acessadas";
        }
    } catch (Exception e) {
        response.sendRedirect("#");
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

                    <section>
                        <header class="major">

                            <h2>Receitas - <%=msg%></h2>
                        </header>
                        <div class="posts">

                            <%
                                if (filtro == 1) {
                                    for (Receita item : recListCategoria) {
                            %>
                            <article>
                                <a href="../detalhe/receita.jsp?id=<%=item.getId()%>" class="image"><img src="../fotos/<%=item.getImagem1()%>" alt="<%=item.getNome()%>" height="300" width="50" /></a>
                                <h3><%=item.getNome()%></h3>
                                <p><%=item.getDescricao()%></p>
                                <ul class="actions">
                                    <li><a href="../detalhe/receita.jsp?id=<%=item.getId()%>" class="button">Ir para</a></li>
                                </ul>
                            </article>
                            <% }
                            } else if (filtro == 2) {
                                for (Receita item : recListSubCategoria) {%>
                            <article>
                                <a href="../detalhe/receita.jsp?id=<%=item.getId()%>" class="image"><img src="../fotos/<%=item.getImagem1()%>" alt="<%=item.getNome()%>" height="300" width="50" /></a>
                                <h3><%=item.getNome()%></h3>
                                <p><%=item.getDescricao()%></p>
                                <ul class="actions">
                                    <li><a href="../detalhe/receita.jsp?id=<%=item.getId()%>" class="button">Ir para</a></li>
                                </ul>
                            </article>
                            <%}
                            } else if (filtro == 3) {
                                for (Receita item : recListIngrediente) {%>
                            <article>
                                <a href="../detalhe/receita.jsp?id=<%=item.getId()%>" class="image"><img src="../fotos/<%=item.getImagem1()%>" alt="<%=item.getNome()%>" height="300" width="50" /></a>
                                <h3><%=item.getNome()%></h3>
                                <p><%=item.getDescricao()%></p>
                                <ul class="actions">
                                    <li><a href="../detalhe/receita.jsp?id=<%=item.getId()%>" class="button">Ir para</a></li>
                                </ul>
                            </article>      
                            <%}
                            } else if (filtro == 4) {
                                for (Receita item : recListAcesso) {%>
                            <article>
                                <a href="../detalhe/receita.jsp?id=<%=item.getId()%>" class="image"><img src="../fotos/<%=item.getImagem1()%>" alt="<%=item.getNome()%>" height="300" width="50" /></a>
                                <h3><%=item.getNome()%></h3>
                                <p><%=item.getDescricao()%></p>
                                <ul class="actions">
                                    <li><a href="../detalhe/receita.jsp?id=<%=item.getId()%>" class="button">Ir para</a></li>
                                </ul>
                            </article>
                            <%}
                                }%>


                        </div>
                    </section>
                </div>
            </div>

            <!-- Sidebar -->
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