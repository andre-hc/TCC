<%@page import="modelo.Subcategoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.SubcategoriaDAO"%>

<!DOCTYPE HTML>
<!--
        Front-end: html5up.net | Andr� Huber | �caro Crespo 
        Back-end: Andr� Huber | �caro Crespo
-->
<%
    SubcategoriaDAO dao = new SubcategoriaDAO();
    List<Subcategoria> lista;

    if (request.getParameter("id") != null) {
        Subcategoria obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
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
                <h2>Subcategoria</h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <a  href="add.jsp" class="btn btn-primary btn-sm fa fa-plus-square-o">Nova Subcategoria</a>
    <section id="about" class="three">
        <div class="container">
<div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="txtFiltro" placeholder="fa�a sua pesquisa aqui">
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
                        <th>Id</th>
                        <th>Foto</th>
                        <th>Nome</th>
                        <th>Acesso</th>
                        <th>Categoria</th>
                        <th>A��es</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Subcategoria item : lista) {
                    %>
                    <tr>
                        <td><%=item.getId()%></td>
                         <%
                            if (item.getFoto() != null) {
                        %>
                        <td><img src="../../fotos/<%=item.getFoto()%>" width="50" height="50"/></td>
                            <%
                                }
                            %>
                        <td><%=item.getNome()%></td>
                       <%
                            if (item.getAcesso() == null) {
                        %>
                        <td>0</td>
                        <%
                        } else {
                        %>
                        <td><%=item.getAcesso()%></td>
                        <%
                            }
                        %>
                        <td><%=item.getCategoria().getNome()%></td>
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