<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Exception"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Subcategoria"%>
<%@page import="dao.SubcategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    SubcategoriaDAO subCatDAO = new SubcategoriaDAO();
    Subcategoria subCatObj = new Subcategoria();

    CategoriaDAO catDAO = new CategoriaDAO();
    List<Categoria> catList = catDAO.listar();

    String msg = "0";
    if (request.getParameter("erro") != null) {
        if (request.getParameter("erro").equals("3")) {
            msg = "Por favor selecione uma CategoriaReceita referente.";
        }
    }

    if (request.getMethod().equals("POST")) {
        Upload up = new Upload();
        up.setFolderUpload("fotos");
        if (up.formProcess(getServletContext(), request)) {
            if (request.getParameter("categoria").equals("selecione")) {
                response.sendRedirect("upd.jsp?erro=3");
                return;
            }
            if (up.getForm().get("id").toString() != null && up.getForm().get("acesso").toString() != null) {
                try {
                    Categoria categoria = new Categoria();

                    categoria.setId(Integer.parseInt(up.getForm().get("categoria").toString()));
                    subCatObj.setId(Integer.parseInt(up.getForm().get("id").toString()));
                    subCatObj.setNome(up.getForm().get("nome").toString());
                    subCatObj.setAcesso(Integer.parseInt(up.getForm().get("acesso").toString()));
                    subCatObj.setCategoria(categoria);
                    subCatObj.setFoto(up.getFiles().get(0));
                    subCatDAO.alterar(subCatObj);
                    response.sendRedirect("index.jsp?erro=0");
                } catch (Exception e) {

                }
            }
            if (request.getParameter("id") != null) {
                subCatObj = subCatDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
            } else {
                response.sendRedirect("index.jsp?erro=1");
                return;
            }
        } else {
            response.sendRedirect("index.jsp?erro=1");
            return;
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
                <h2>Alterar uma <u>Subcategoria</u></h2>
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
            <form action="upd.jsp" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="6u">Id:<input type="text" name="id" value="<%=subCatObj.getId()%>" readonly /></div>
                    <div class="6u">Id:<input type="text" name="nome" value="<%=subCatObj.getNome()%>" /></div>
                    <div class="6u">Id:<input type="text" name="acesso" value="<%=subCatObj.getAcesso()%>" /></div>
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
                    <div class="12u">Foto:<input type="file" name="foto" /></div>
                    <div class="12u"><input type="submit" value="Enviar" /></div>
                </div>
            </form>
        </div>
    </section>
</div>
<%@include file="../rodape.jsp"%>