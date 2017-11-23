<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.lang.Exception"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Subcategoria"%>
<%@page import="dao.SubcategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg = "0";
    if (request.getParameter("erro") != null) {
        if (request.getParameter("erro").equals("3")) {
            msg = "Por favor selecione uma Categoria referente.";
        } else if (request.getParameter("erro").equals("1")) {
            msg = "Por favor selecione um preencha os campos referente.";
        }
    }
    CategoriaDAO catDAO = new CategoriaDAO();
    List<Categoria> catList = catDAO.listar();

    if (request.getMethod().equals("POST")) {
        Upload up = new Upload();
        up.setFolderUpload("fotos");
        if (up.formProcess(getServletContext(), request)) {
//            if (up.getForm().get("nome").toString() == null) {
//                response.sendRedirect("add.jsp?erro=1");
//                return;
//            }
//            if (up.getForm().get("nome").toString().isEmpty()) {
//                response.sendRedirect("add.jsp?erro=1");
//                return;
//            }
//            if (request.getParameter("categoria").equals("selecione")) {
//                response.sendRedirect("add.jsp?erro=3");
//                return;
//            }
            SubcategoriaDAO dao = new SubcategoriaDAO();
            Subcategoria obj = new Subcategoria();

            try {
                Categoria categoria = new Categoria();

                categoria.setId(Integer.parseInt(up.getForm().get("categoria").toString()));
                obj.setNome(up.getForm().get("nome").toString());
                obj.setAcesso(0);
                obj.setDescricao(up.getForm().get("descricao").toString());
                obj.setFoto(up.getFiles().get(0));
                obj.setCategoria(categoria);
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
                <h2>Adicionar uma nova <u>Subcategoria</u></h2>
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
                    <div class="6u">Nome:<input type="text" name="nome" required/></div>
                    <div class="6u">Escolher Foto:<br><input type="file" name="foto" required/></div><br />
                    <div class="12u">Descrição:<input type="text" name="descricao" placeholder="digite a descrição da subcategoria" required/></div>
                    <div class="12u">Categoria:
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
                    <div class="12u"><input type="submit" value="Enviar" /></div>
                </div>
            </form>
        </div>
    </section>
</div>
<%@include file="../rodape.jsp"%>