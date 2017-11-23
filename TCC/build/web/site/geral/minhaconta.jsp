<%@page import="modelo.Favorito"%>
<%@page import="dao.FavoritoDAO"%>
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
    List<Categoria> catList = catDAO.listar();
    List<Categoria> catListAcesso = catDAO.listarMaisAcessado();

    ReceitaDAO recDAO = new ReceitaDAO();
    List<Receita> recListAleat = recDAO.listarAleatorio();
    List<Receita> recListMinhas;
    List<Receita> recListAcesso = recDAO.listarMaisAcessado();
    
    FavoritoDAO favDAO = new FavoritoDAO();
    List<Favorito> favList = favDAO.listar();
    
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
        <link rel="stylesheet" href="assets/css/main.css" />
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
                        <a href="index.jsp" class="logo"><strong>O que vamos preparar hoje?</strong></a>
                        <!--                        
                        <ul class="icons">
                        <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        </ul>
                        -->
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
                    <section id="#pratos">
                        <header class="major">
                            <h2>Seus pratos</h2>
                        </header>
                        <div class="features">
                            <%
                                if(usuario.getNome() != null){
                                    recListMinhas = recDAO.listarMinhasReceitas(usuario.getId().toString());
                                    for (Receita item : recListMinhas) {
                            %>
                            <article>
                                <span class="icon fa-diamond"></span>
                                <div class="content">
                                    <h3><%=item.getNome()%></h3>
                                    <p><%=item.getDescricao()%></p>
                                </div>
                            </article>
                            <%
                                    }
                                }else{
                            %>
                            <article>
                                <h2>Ops, parece que você não está logado. Logue-se para acessar os seus pratos!</h2>
                            </article>
                                <%
                                    }
                                %>
                        </div>
                    </section>
                    <!-- Section -->
                    <section id="#favorito">
                        <header class="major">
                            <h2>Seus favoritos</h2>
                        </header>
                        <div class="posts">

                            <%
                                if(usuario.getNome() != null){
                                    
                                    for (Favorito item : favList) {
                            %>
                            <article>
                                <a href="" class="image"><img src="<%=item.getReceita().getImagem1()%>" alt="" /></a>
                                <h3><%=item.getReceita().getNome()%></h3>
                                <p>Não funcionando!</p>
                                <ul class="actions">
                                    <li><a href="#" class="button">More</a></li>
                                </ul>
                            </article>
                            <%
                                    }
                                }else{
                            %>
                            <article>
                                <h2>Ops, parece que você não está logado. Logue-se para acessar os seus favoritos!</h2>
                            </article>
                            <%
                                }
                            %>
                        </div>
                    </section>
                </div>
            </div>

            <!-- Sidebar -->
            <div id="sidebar">
                <div class="inner">
                    <!-- Search -->
                    <section id="search" class="alt">
                        <form method="post" name="pesquisa" action="#">
                            <input type="text" name="txtFiltro" id="query" placeholder="pesquise aqui" />
                        </form>
                    </section>

                    <!-- Menu -->
                    <nav id="menu">
                        <ul>
                            <%
                                if (usuario.getFoto() == null) {
                            %>
                            <li>
                            <center>
                                <a href="minhaconta.jsp">Minha conta</a>
                                <a href="minhaconta.jsp"><img src="images/user.png" width="100" height="100" alt="Minha conta"></a><br>
                            </center>
                            </li>
                            <%
                                }
                                if (usuario.getFoto() != null) {
                            %>
                            <li>
                            <center>
                                <a href="minhaconta.jsp">Minha conta</a>
                                <a href="minhaconta.jsp"><img src="<%=usuario.getFoto()%>" width="100" height="100" alt="Minha conta"></a>
                            </center>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                        <header class="major">
                            <h2>Menu</h2>
                        </header>
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="receitas.jsp">Receitas</a></li>
                            <li><a href="categorias.jsp">Categorias</a></li>
                            <li>
                                <span class="opener">Categorias</span>
                                <ul>
                                    <%
                                        int num_categoria = 0;
                                        for (Categoria item : catList) {
                                            if (num_categoria <= 2) {
                                    %>
                                    <li><a href="#"><%=item.getNome()%></a></li>
                                        <%
                                                }
                                                num_categoria++;
                                            }
                                        %>
                                </ul>
                            </li>
                            <li><a href="minhaconta.jsp">Seus Pratos</a></li>
                            <li>
                                <span class="opener">Ingrendientes mais usados</span>
                                <ul>
                                    <%
                                        int num_ingrediente = 0;
                                        for (Ingrediente item : ingList) {
                                            if (num_ingrediente <= 2) {
                                    %>
                                    <li><a href="#"><%=item.getNome()%></a></li>
                                        <%
                                                }
                                                num_ingrediente++;
                                            }
                                        %>
                                </ul>
                            </li>
                            <li><a href="minhaconta.jsp">Favoritos</a></li>
                        </ul>
                    </nav>

                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>Algumas Receitas do nosso site</h2>
                        </header>
                        <div class="mini-posts">
                            <%
                                for (Receita item : recListAleat) {
                            %>
                            <article>
                                <a href="receitas.jsp" class="image"><img src="" alt="<%=item.getNome()%>" /></a>
                                <p><%=item.getDescricao()%>.</p>
                            </article>
                            <%
                                }
                            %>
                        </div>
                        <ul class="actions">
                            <li><a href="receitas.jsp" class="button">mostrar mais</a></li>
                        </ul>
                    </section>

                    <section>
                        <header class="major">
                            <h2>Algumas Categorias do nosso site</h2>
                        </header>
                        <div class="mini-posts">
                            <%
                                for (Categoria item : catListAleat) {
                            %>
                            <article>
                                <a href="categorias.jsp" class="image"><img src="" alt="<%=item.getNome()%>" /></a>
                                <p><%=item.getNome()%>.</p>
                            </article>
                            <%
                                }
                            %>
                        </div>
                        <ul class="actions">
                            <li><a href="categorias.jsp" class="button">mostrar mais</a></li>
                        </ul>
                    </section>

                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>Entre em contato</h2>
                        </header>
                        <p>Envie suas dúvidas pelo nosso e-mail abaixo, ou acesse a área para contato.</p>
                        <ul class="contact">
                            <li class="fa-envelope-o"><a href="#">icarocrespo@gmail.com</a></li>
                            <li class="fa-phone">53 99944-0212</li>
                            <li class="fa-home">Av. Leonel de Moura Brizola, 2501<br />
                                Bagé/RS</li>
                        </ul>
                    </section>

                    <!-- Footer -->
                    <footer id="footer">
                        <p class="copyright">&copy; Desenvolvido por André Huber e Ícaro Crespo | Design: HTML5 UP.</p>
                    </footer>
                </div>
            </div>
        </div>
        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>
    </body>
</html>
