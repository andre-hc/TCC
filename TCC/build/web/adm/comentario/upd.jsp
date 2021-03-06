<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.ReceitaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Receita"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.lang.Exception"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Comentario"%>
<%@page import="dao.ComentarioDAO"%>
<%
    ComentarioDAO comDAO = new ComentarioDAO();
    Comentario comObj = new Comentario();

    ReceitaDAO recDAO = new ReceitaDAO();
    List<Receita> recList = recDAO.listar();

    UsuarioDAO usuDAO = new UsuarioDAO();
    List<Usuario> usuList = usuDAO.listar();
    
    String msg = "0";
    if (request.getParameter("erro") != null) {
        if (request.getParameter("erro").equals("2")) {
            msg = "Por favor selecione uma Receita referente.";
        } else if (request.getParameter("erro").equals("3")) {
            msg = "Por favor selecione um Usu�rio referente.";
        }
    }
    
    if (request.getMethod().equals("POST")) {
        if (request.getParameter("usuario").equals("selecione")) {
            response.sendRedirect("upd.jsp?erro=3");
            return;
        } else if (request.getParameter("receita").equals("selecione")) {
            response.sendRedirect("upd.jsp?erro=2");
            return;
        }
        if (request.getParameter("id") != null && request.getParameter("texto") != null) {
            try {
                Usuario usuario = new Usuario();
                Receita receita = new Receita();

                usuario.setId(Integer.parseInt(request.getParameter("usuario")));
                receita.setId(Integer.parseInt(request.getParameter("receita")));
                comObj.setId(Integer.parseInt(request.getParameter("id")));
                comObj.setTexto(request.getParameter("texto"));
                comObj.setUsuario(usuario);
                comObj.setReceita(receita);
                comDAO.alterar(comObj);
                response.sendRedirect("index.jsp?erro=0");
            } catch (Exception e) {

            }
        }
        if (request.getParameter("id") != null) {
            comObj = comDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
        } else {
            response.sendRedirect("index.jsp?erro=1");
            return;
        }
    } else {
        response.sendRedirect("index.jsp?erro=1");
        return;
    }
%>
<%@include file="../cabecalho.jsp"%>

<!-- Main -->
<div id="main">

    <!-- Portfolio -->
    <section id="portfolio" class="two">
        <div class="container">
            <header>
                <h2>Alterar um <u>Coment�rio</u></h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <section id="about" class="three">
        <div class="container">
            <form action="upd.jsp" method="post">
                <div class="row">
                    <div class="6u">Id:<input type="text" name="id" value="<%=comObj.getId()%>" readonly /></div>
                    <div class="6u">Usu�rio:
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
                    <div class="12u">Texto<input type="text" name="texto" /></div>
                    <div class="12u"><input type="submit" value="Enviar" /></div>
                </div>
            </form>
        </div>
    </section>
</div>
<%@include file="../rodape.jsp"%>