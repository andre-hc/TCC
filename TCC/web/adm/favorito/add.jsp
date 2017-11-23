<%@page import="modelo.Favorito"%>
<%@page import="dao.FavoritoDAO"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Receita"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.ReceitaDAO"%>
<%@page import="java.lang.Exception"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg = "0";
    if (request.getParameter("erro") != null) {
        if (request.getParameter("erro").equals("2")) {
            msg = "Por favor selecione uma Receita referente.";
        } else if (request.getParameter("erro").equals("3")) {
            msg = "Por favor selecione um Usuário referente.";
        }
    }

    ReceitaDAO recDAO = new ReceitaDAO();
    List<Receita> recList = recDAO.listar();

    UsuarioDAO usuDAO = new UsuarioDAO();
    List<Usuario> usuList = usuDAO.listar();

    if (request.getMethod().equals("POST")) {
        if (request.getParameter("usuario").equals("selecione")) {
            response.sendRedirect("add.jsp?erro=3");
            return;
        } else if (request.getParameter("receita").equals("selecione")) {
            response.sendRedirect("add.jsp?erro=2");
            return;
        }
        FavoritoDAO dao = new FavoritoDAO();
        Favorito obj = new Favorito();

        try {
            Usuario usuario = new Usuario();
            Receita receita = new Receita();

            usuario.setId(Integer.parseInt(request.getParameter("usuario")));
            receita.setId(Integer.parseInt(request.getParameter("receita")));
            obj.setUsuario(usuario);
            obj.setReceita(receita);
            dao.incluir(obj);
            response.sendRedirect("index.jsp?erro=0");
        } catch (Exception e) {

        }
    }
%>
<style>
    #show-message{
        color: #ff0011;
    }
</style>
<!-- Main -->
<div id="main">

    <!-- Portfolio -->
    <section id="portfolio" class="two">
        <div class="container">
            <header>
                <h2>Adicionar um novo <u>Favorito</u></h2>
            </header>
        </div>
        <%
            if (!msg.equals("0")) {
        %>
        <p align="center" id="show-message"><%=msg%></p>
        <%
            }
        %>
    </section>

    <!-- About Me -->
    <section id="about" class="three">
        <div class="container">
            <form action="add.jsp" method="post">
                <div class="row">
                    <div class="6u">Usuário:
                        <select name="usuario" required>
                            <option value="selecione">Selecione</option>
                            <%
                                for (Usuario item : usuList) {
                            %>
                            <option value="<%=item.getId()%>"><%=item.getNome()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="6u">Receita:
                        <select name="receita" required>
                            <option value="selecione">Selecione</option>
                            <%
                                for (Receita item : recList) {
                            %>
                            <option value="<%=item.getId()%>"><%=item.getNome()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="12u"><input type="submit" value="Enviar" /></div>
                </div>
            </form>
        </div>
    </section>
</div>
<%@include file="../rodape.jsp"%>