<%-- 
    Document   : cabecalho
    Created on : Nov 19, 2017, 6:42:59 PM
    Author     : André
--%>
<%@page import="modelo.Ingrediente"%>
<%@page import="dao.IngredienteDAO"%>
<%@page import="modelo.Receita"%>
<%@page import="dao.ReceitaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%
    UsuarioDAO cabecalho_usuarioDAO = new UsuarioDAO();
    Usuario cabecalho_usuario = new Usuario();

    CategoriaDAO cabecalho_catDAO = new CategoriaDAO();
    List<Categoria> cabecalho_catListAleat = cabecalho_catDAO.listarAleatorio();
    List<Categoria> cabecalho_catListAcesso = cabecalho_catDAO.listarMaisAcessado();
    List<Categoria> cabecalho_catList = cabecalho_catDAO.listar();

    ReceitaDAO cabecalho_recDAO = new ReceitaDAO();
    List<Receita> cabecalho_recListAleat = cabecalho_recDAO.listarAleatorio();
    List<Receita> cabecalho_recListaAcesso = cabecalho_recDAO.listarMaisAcessado();

    IngredienteDAO cabecalho_ingDAO = new IngredienteDAO();
    List<Ingrediente> cabecalho_ingList = cabecalho_ingDAO.listar();

    if (session.getAttribute("usuario") != null) {
        cabecalho_usuario = (Usuario) session.getAttribute("usuario");
    }
//    if (request.getParameter("sair").equals("true")) {
//        session.removeAttribute("usuario");
//        response.sendRedirect("index.jsp");
//        return;
//    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<div id="sidebar">
    <div class="inner">
        <!-- Search -->
        <section id="search" class="alt">
            <form method="post" name="pesquisa" action="#">
                <input type="text" name="txtFiltro" id="query" placeholder="Pesquise aqui" />
            </form>
        </section>

        <!-- Menu -->
        <nav id="menu">
            <ul>
                <%
                    if (cabecalho_usuario.getFoto() == null) {
                %>
                <li>
                <center>
                    <a href="../minhaconta.jsp">cabecalho</a>
                    <a href="../minhaconta.jsp"><img src="../images/user.png" width="100" height="100" alt="Minha conta"></a><br>
                </center>
                </li>
                <%
                    }
                    if (cabecalho_usuario.getFoto() != null) {
                %>
                <li>
                <center>
                    <a href="../minhaconta.jsp">cabecalho</a>
                    <a href="../minhaconta.jsp"><img src="<%=cabecalho_usuario.getFoto()%>" width="100" height="100" alt="Minha conta"></a>
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
                <li><a href="../geral/index.jsp">Home</a></li>
                <li><a href="../listagem/listagemreceita.jsp">Receitas</a></li>

                <li>
                    <span class="opener">Categorias</span>
                    <ul>
                        <%
                            int num_categoria = 0;
                            for (Categoria item : cabecalho_catList) {
                                if (num_categoria <= 2) {
                        %>
                        <li><a href="#"><%=item.getNome()%></a></li>
                            <%
                                    }
                                    num_categoria++;
                                }
                            %>
                        <li><a href="../listagem/listagemcategoria.jsp" >Ver todas</a></li>
                    </ul>
                </li>
                <li><a href="../minhaconta.jsp">Seus Pratos</a></li>
                <li>
                    <span class="opener">Ingredientes mais usados</span>
                    <ul>
                        <%
                            int num_ingrediente = 0;
                            for (Ingrediente item : cabecalho_ingList) {
                                if (num_ingrediente <= 2) {
                        %>
                        <li><a href="../detalhe/ingrediente.jsp"><%=item.getNome()%></a></li>
                            <%
                                    }
                                    num_ingrediente++;
                                }
                            %>
                    </ul>
                </li>
                <li><a href="../minhaconta.jsp">Favoritos</a></li>
            </ul>
        </nav>

        <!-- Section -->
        <section>
            <header class="major">
                <h2>Algumas receitas do nosso site</h2>
            </header>
            <div class="mini-posts">
                <%
                    for (Receita item : cabecalho_recListAleat) {
                %>
                <article>
                    <a href="../detalhe/receita.jsp?id=<%=item.getId()%>" class="image"><img src="" alt="<%=item.getNome()%>" /></a>
                    <p><%=item.getDescricao()%></p>
                </article>
                <%
                    }
                %>
            </div>
            <ul class="actions">
                <li><a href="../listagem/listagemreceita.jsp" class="button">Mostrar mais</a></li>
            </ul>
        </section>

        <section>
            <header class="major">
                <h2>Algumas categorias do nosso site</h2>
            </header>
            <div class="mini-posts">
                <%
                    for (Categoria item : cabecalho_catListAleat) {
                %>
                <article>
                    <a href="../detalhe/categoria.jsp?id=<%=item.getId()%>" class="image"><img src="../../fotos/<%=item.getFoto()%>" alt="<%=item.getNome()%>" /></a>
                    <p><%=item.getNome()%></p>
                </article>
                <%
                    }
                %>
            </div>
            <ul class="actions">
                <li><a href="../listagem/listagemcategoria.jsp" class="button">mostrar mais</a></li>
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
