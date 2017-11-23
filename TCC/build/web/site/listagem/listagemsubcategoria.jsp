<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Subcategoria"%>
<%@page import="dao.SubcategoriaDAO"%>
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

    if (session.getAttribute("usuario") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
    }

    SubcategoriaDAO subcatDAO = new SubcategoriaDAO();
    CategoriaDAO catDAO = new CategoriaDAO();

    Subcategoria subcatObj = new Subcategoria();
    Categoria catObj;

    List<Subcategoria> subcatListCat = new ArrayList();
    List<Subcategoria> subcatListAcesso = new ArrayList();

    String msg = "";
    int filtro = 0;
    try {
        if (request.getParameter("idcat") != null) {           
            catObj = catDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("idcat")));            
            subcatListCat = subcatDAO.listarSubCategoriaCategoria(request.getParameter("idcat"));
            msg = catObj.getNome();
            filtro = 1;
            if (subcatListCat.size()==0){
                msg = "Oops! Está vazio!";
            }
        } else {
            subcatListAcesso = subcatDAO.listarMaisAcessado();
            msg = "Mais acessadas";
            filtro = 2;
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
                        <!--                        <ul class="icons">
                                                    <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                                                    <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                                                </ul>-->
                    </header>




                    <section>
                        <header class="major">
                            <h2>Subcategorias - <%=msg%></h2>
                        </header>
                        <div class="posts">

                            <%
                                if (filtro == 1) {
                                    for (Subcategoria item : subcatListCat) {
                            %>
                            <article>
                                <a href="../detalhe/subcategoria.jsp?id=<%=item.getId()%>" class="image"><img src="../fotos/<%=item.getFoto()%>" alt="<%=item.getNome()%>" height="300" width="50" /></a>
                                <h3><%=item.getNome()%></h3>
                                <p><%=item.getDescricao()%></p>
                                <ul class="actions">
                                    <li><a href="../detalhe/subcategoria.jsp?id=<%=item.getId()%>" class="button">Ir para</a></li>
                                </ul>
                            </article>
                            <%
                                    }
                                }
                                if (filtro == 2) {
                                    for (Subcategoria item : subcatListAcesso) { %>
                            <article>
                                <a href="../detalhe/subcategoria.jsp?id=<%=item.getId()%>" class="image"><img src="../fotos/<%=item.getFoto()%>" alt="<%=item.getNome()%>" height="300" width="50" /></a>
                                <h3><%=item.getNome()%></h3>
                                <p><%=item.getDescricao()%></p>
                                <ul class="actions">
                                    <li><a href="../detalhe/subcategoria.jsp?id=<%=item.getId()%>" class="button">Ir para</a></li>
                                </ul>
                            </article>
                            <%}
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