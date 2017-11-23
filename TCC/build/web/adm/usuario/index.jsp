<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>

<!DOCTYPE HTML>
<!--
        Front-end: html5up.net | André Huber | Ícaro Crespo 
        Back-end: André Huber | Ícaro Crespo
-->
<%
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista;
    String adm;
    if (request.getParameter("id") != null) {
        Usuario obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
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
                <h2>Usuário</h2>
            </header>
        </div>
    </section>
    <a  href="add.jsp" class="btn btn-primary btn-sm fa fa-plus-square-o">Novo usuário</a>

    <!-- About Me -->
    <section id="about" class="three">
        <div class="container">
            <div class="panel panel-default">
                <form action="#" method="post">
                    <div class="form-group input-group">
                        <input type="text" class="form-control" name="txtFiltro" placeholder="Faça sua pesquisa aqui">
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
                        <th>Foto</th>
                        <th>Nome</th>
                        <th>E-mail</th>
                        <th>Senha</th>
                        <th>UF</th>
                        <th>Telefone</th>
                        <th>ADM</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        for (Usuario item : lista) {
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
                        <td><%=item.getEmail()%></td>
                        <td>*********</td>
                        <td><%=item.getUf()%></td>
                        <td><%=item.getTelefone()%></td>

                        <%if (item.getAdm() == true) {
                                adm = "Sim";
                            } else {
                                adm = "Não";
                            }%>
                        <td><%=adm%></td>
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