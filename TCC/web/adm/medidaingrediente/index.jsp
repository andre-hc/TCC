<%@page import="modelo.Medidaingrediente"%>
<%@page import="java.util.List"%>
<%@page import="dao.MedidaingredienteDAO"%>

<!DOCTYPE HTML>
<!--
        Front-end: html5up.net | André Huber | Ícaro Crespo 
        Back-end: André Huber | Ícaro Crespo
-->
<%
    MedidaingredienteDAO dao = new MedidaingredienteDAO();
    List<Medidaingrediente> lista;

    if (request.getParameter("id") != null) {
        Medidaingrediente obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
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
                <h2>Medida-Ingrediente</h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <a  href="add.jsp" class="btn btn-primary btn-sm fa fa-plus-square-o">Nova Medida-Ingrendiente (testes)</a>
    
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
                        <th>Id</th>
                        <th>Quantidade</th>
                        <th>Receita</th>
                        <th>Medida</th>
                        <th>Ingrediente</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Medidaingrediente item : lista) {
                    %>
                    <tr>
                        <td><%=item.getId()%></td>
                        <td><%=item.getQuantidade()%></td>
                        <td><%=item.getReceita().getNome()%></td>
                        <td><%=item.getMedida().getNome()%></td>
                        <td><%=item.getIngrediente().getNome()%></td>
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