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
        <style>
            #noAccount{
                font-size: 22px;
            }
            #withAccount{
                font-size: 15px;
            }
        </style>
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
                                <h2>Suas Informações</h2>
                                <%
                                    if(usuario.getId() != null){
                                %>
                                <p><a href="alterarconta.jsp">Atualizar Informações</a></p>
                            <%
                                }
                            %>
                            </header>
                                <%
                                    if(usuario.getId() != null){
                                %>
                                <p id="withAccount">Nome: <%=usuario.getNome()%></p>
                                <p id="withAccount">E-mail: <%=usuario.getEmail()%></p>
                                <p id="withAccount">Telefone: <%=usuario.getTelefone()%></p>
                                <p id="withAccount">Unidade Federativa: <%=usuario.getUf()%></p>
                                <span class="image object">
                                <img src="../images/carrossel-index/macarons%20index.jpg" alt="" />
                                </span>
                                <%
                                    }else{
                                %>
                                <br />
                                <p id="noAccount">Pelo visto você não possui uma conta, mas não se preocupe! Crie agora e aproveite o nosso site!</p>
                                <ul class="actions">
                                    <li><a href="novaconta.jsp" class="button big">Criar nova conta</a></li>
                                </ul>
                                <%
                                    }
                                %>
                            <!--
                                <ul class="actions">
                                <li><a href="#" class="button big">Learn More</a></li>
                                </ul>
                            -->
                        </div>
                    </section>

                    <!-- Section -->
                    <section id="#pratos">
                        <header class="major">
                            <h2>Seus pratos</h2>
                        </header>
                        <div class="features">
                            <%
                                if (usuario.getNome() != null) {
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
                            } else {
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
                                if (usuario.getNome() != null) {

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
                            } else {
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