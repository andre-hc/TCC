<%@page import="modelo.Receita"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReceitaDAO"%>

<!DOCTYPE HTML>
<!--
        Front-end: html5up.net | André Huber | Ícaro Crespo 
        Back-end: André Huber | Ícaro Crespo
-->
<%
    ReceitaDAO dao = new ReceitaDAO();
    List<Receita> lista;

    if (request.getParameter("id") != null) {
        Receita obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
        dao.excluir(obj);
    }
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }
%>
<%@include file="../cabecalho.jsp"%>

<!-- Main -->
<div id="main">

    <!-- Portfolio -->
    <section id="portfolio" class="two">
        <div class="container">
            <header>
                <h2>Receita</h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <a  href="add.jsp" class="btn btn-primary btn-sm fa fa-plus-square-o">Nova receita</a>
    <section id="about" class="three">
        <div class="container">
            <div class="panel panel-default">
                <form action="#" method="post">
                    <div class="form-group input-group">
                        <input type="text" class="form-control" name="txtFiltro" placeholder="faça sua pesquisa aqui">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </form>
            </div> 
            <!-- Tavble-->
            <table class="default thead">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Imagem</th>
                        <th>Nome</th>
                        <th>Usuário</th>
                        <th>Cat.</th>
                        <th>SubCat</th>
                        <th>TempoP.</th>
                        <th>Serve</th>
                        <th>Acesso</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Receita item : lista) {
                    %>
                    <tr>
                        <td><%=item.getId()%></td>
                        <td><a href="#" data-toggle="modal" data-target="#login-modal">Ver Imagens</a></td>
                        <td><%=item.getUsuario().getNome()%></td>
                        <td><%=item.getCategoria().getNome()%></td>
                        <td><%=item.getSubcategoria().getNome()%></td>
                        <td><%=item.getTempoPreparo()%></td>
                        <td><%=item.getServe()%></td>
                        <td><%=item.getAcesso()%></td>
                        <td>
                            <form action="upd.jsp?id=<%=item.getId()%>" method="post">
                                <button class="btn btn-primary btn-sm">Alterar</button>
                            </form>
                            <form action="index.jsp?id=<%=item.getId()%>" method="post">
                                <button class="btn btn-danger btn-sm" type="submit">Excluir</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </section>
</div>
<%@include file="../modalexcluir.jsp"%>
<%@include file="../rodape.jsp"%>