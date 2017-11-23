<%@page import="java.lang.Exception"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%
    CategoriaDAO catDAO = new CategoriaDAO();
    Categoria catObj = new Categoria();

    Upload up = new Upload();
    up.setFolderUpload("fotos");
    if (request.getMethod().equals("POST")) {
        if (up.formProcess(getServletContext(), request)) {
            try {
                catObj.setId(Integer.parseInt(up.getForm().get("id").toString()));
                catObj.setNome(up.getForm().get("nome").toString());
                catObj.setDescricao(up.getForm().get("descricao").toString());
                catObj.setFoto(up.getFiles().get(0));
                catDAO.alterar(catObj);
                response.sendRedirect("index.jsp?erro=0");
            } catch (Exception e) {

            }
        } else if (request.getParameter("id") != null) {
            catObj = catDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
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
                <h2>Alterar uma <u>Categoria</u></h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <section id="about" class="three">
        <div class="container">
            <form action="upd.jsp" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="6u">Id:<input type="text" name="id" value="<%=catObj.getId()%>" readonly /></div>
                    <div class="6u">Nome:<input type="text" name="nome" value="<%=catObj.getNome()%>" /></div>
                    <div class="6u">Descrição:<input type="text" name="descricao" value="<%=catObj.getDescricao()%>"/></div>
                    <div class="6u">Escolher Foto:<br><input type="file" name="foto" /></div>
                    <div class="12u"><input type="submit" value="Enviar" /></div>
                </div>
            </form>
        </div>
    </section>
</div>
<%@include file="../rodape.jsp"%>