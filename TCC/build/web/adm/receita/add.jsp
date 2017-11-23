<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Subcategoria"%>
<%@page import="dao.SubcategoriaDAO"%>
<%@page import="modelo.Comentario"%>
<%@page import="dao.ComentarioDAO"%>
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
        } else if (request.getParameter("erro").equals("4")) {
            msg = "Por favor selecione uma  SubCategoria referente.";
        } else if (request.getParameter("erro").equals("1")) {
            msg = "Algo deu errado!";
        }
    }

    UsuarioDAO usuDAO = new UsuarioDAO();
    List<Usuario> usuList = usuDAO.listar();

    CategoriaDAO catDAO = new CategoriaDAO();
    List<Categoria> catList = catDAO.listar();

    SubcategoriaDAO subCatDAO = new SubcategoriaDAO();
    List<Subcategoria> subCatList = subCatDAO.listar();

    if (request.getMethod().equals("POST")) {
        Upload up = new Upload();
        up.setFolderUpload("fotos");
        if (up.formProcess(getServletContext(), request)) {
            if (up.getForm().get("nome").toString() == null) {
                response.sendRedirect("add.jsp?erro=1");
                return;
            }
            if (up.getForm().get("nome").toString().isEmpty()) {
                response.sendRedirect("add.jsp?erro=1");
                return;
            }
            if (up.getForm().get("usuario") != null) {
                if (up.getForm().get("usuario").toString().equals("selecione")) {
                    response.sendRedirect("add.jsp?erro=3");
                    return;
                }
            }
            if (up.getForm().get("receita") != null) {
                if (up.getForm().get("receita").toString().equals("selecione")) {
                    response.sendRedirect("add.jsp?erro=2");
                    return;
                }
            }
            if (up.getForm().get("subCategoria") != null) {
                if (up.getForm().get("subCategoria").toString().equals("selecione")) {
                    response.sendRedirect("add.jsp?erro=4");
                    return;
                }
            }
            ReceitaDAO dao = new ReceitaDAO();
            Receita obj = new Receita();

            try {
                Usuario usuario = new Usuario();
                Categoria categoria = new Categoria();
                Subcategoria subCategoria = new Subcategoria();
                Date d = new Date();

                usuario.setId(Integer.parseInt(up.getForm().get("usuario").toString()));
                categoria.setId(Integer.parseInt(up.getForm().get("categoria").toString()));
                subCategoria.setId(Integer.parseInt(up.getForm().get("subCategoria").toString()));
                d.parse(up.getForm().get("tempoPreparo").toString());

                if (!up.getFiles().isEmpty()) {
                    if (up.getFiles().size() > 0) {
                        obj.setImagem1(up.getFiles().get(0));
                        if (up.getFiles().size() > 1) {
                            obj.setImagem2(up.getFiles().get(1));
                            if (up.getFiles().size() > 2) {
                                obj.setImagem3(up.getFiles().get(2));
                                if (up.getFiles().size() > 3) {
                                    obj.setImagem4(up.getFiles().get(3));
                                    if (up.getFiles().size() > 4) {
                                        obj.setImagem5(up.getFiles().get(4));
                                    }
                                }
                            }
                        }
                    }
                }

                obj.setNome(up.getForm().get("nome").toString());
                obj.setDescricao(up.getForm().get("descricao").toString());
                obj.setServe(Integer.parseInt(up.getForm().get("serve").toString()));
                obj.setTempoPreparo(d);
                obj.setAcesso(0);
                obj.setUsuario(usuario);
                obj.setCategoria(categoria);
                obj.setSubcategoria(subCategoria);

                dao.incluir(obj);
                response.sendRedirect("index.jsp?erro=0");
            } catch (Exception e) {

            }
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
                <h2>Adicionar uma nova <u>Receita</u></h2>
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
            <form action="add.jsp" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="12u">Nome:<input type="text" name="nome" placeholder="nome de sua receita aqui..." /></div>
                    <div class="12u">Descrição:<textarea name="descricao" placeholder="descrição de sua receita aqui..." ></textarea></div>
                    <div class="2u">Serve:<br><input type="number" name="serve" /></div>
                    <div class="4u">Tempo de preparo:<br><input type="time" name="tempoPreparo" /></div>

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
                    <div class="6u">Categoria:
                        <select name="categoria" required>
                            <option value="selecione">Selecione</option>
                            <%
                                for (Categoria item : catList) {
                            %>
                            <option value="<%=item.getId()%>"><%=item.getNome()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="6u">Subcategoria:
                        <select name="subCategoria" required>
                            <option value="selecione">Selecione</option>
                            <%
                                for (Subcategoria item : subCatList) {
                            %>
                            <option value="<%=item.getId()%>"><%=item.getNome()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="12u">Imagem 1:<br><input type="file" name="imagem1" required /></div>
                    <div class="12u">Imagem 2:<br><input type="file" name="imagem2" required /></div>
                    <div class="12u">Imagem 3:<br><input type="file" name="imagem3" required /></div>
                    <div class="12u">Imagem 4:<br><input type="file" name="imagem4" /></div>
                    <div class="12u">Imagem 5:<br><input type="file" name="imagem5" /></div>
                    <div class="12u"><input type="submit" value="Enviar" /></div>
                </div>
            </form>
        </div>
    </section>
</div>
<%@include file="../rodape.jsp"%>