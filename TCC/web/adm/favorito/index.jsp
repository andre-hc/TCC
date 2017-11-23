<%@page import="modelo.Favorito"%>
<%@page import="java.util.List"%>
<%@page import="dao.FavoritoDAO"%>

<!DOCTYPE HTML>
<!--
        Front-end: html5up.net | André Huber | Ícaro Crespo 
        Back-end: André Huber | Ícaro Crespo
-->
<%
    FavoritoDAO dao = new FavoritoDAO();
    List<Favorito> lista;

    if (request.getParameter("id") != null) {
        Favorito obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
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
                <h2>Favorito</h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <a  href="add.jsp" class="btn btn-primary btn-sm fa fa-plus-square-o">Novo favorito (testes)</a>
    
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
                        <th>Usuário</th>
                        <th>Receita</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Favorito item : lista) {
                    %>
                    <tr>
                        <td><%=item.getId()%></td>
                        <td><%=item.getUsuario().getNome()%></td>
                        <td><%=item.getReceita().getNome()%></td>
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