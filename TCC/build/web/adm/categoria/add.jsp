<%@page import="java.lang.Exception"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg;
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
            CategoriaDAO dao = new CategoriaDAO();
            Categoria obj = new Categoria();

            try {
                obj.setNome(up.getForm().get("nome").toString());
                obj.setDescricao(up.getForm().get("descricao").toString());
                obj.setAcesso(0);
                obj.setFoto(up.getFiles().get(0));
                dao.incluir(obj);
                response.sendRedirect("index.jsp?erro=0");
            } catch (Exception e) {

            }
        }
    }
%>

<!-- Main -->
<div id="main">

    <!-- Portfolio -->
    <section id="portfolio" class="two">
        <div class="container">
            <header>
                <h2>Adicionar uma nova <u>Categoria</u></h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <section id="about" class="three">
        <div class="container">
            <form action="add.jsp" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="6u">Nome:<input type="text" name="nome" required/></div>
                    <div class="6u">Escolher Foto:<br><input type="file" name="foto" required/></div>
                    <div class="12u">Descrição:<input type="text" name="descricao" required /></div>
                    <div class="12u"><input type="submit" value="Enviar" /></div>
                </div>
            </form>
        </div>
    </section>
</div>
<%@include file="../rodape.jsp"%>