<%@page import="java.lang.Exception"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Ingrediente"%>
<%@page import="dao.IngredienteDAO"%>
<%
    IngredienteDAO ingDAO = new IngredienteDAO();
    Ingrediente ingObj = new Ingrediente();

    Upload up = new Upload();
    up.setFolderUpload("fotos");
    if (request.getMethod().equals("POST")) {
        if (up.formProcess(getServletContext(), request)) {
            try {
                ingObj.setId(Integer.parseInt(up.getForm().get("id").toString()));
                ingObj.setNome(up.getForm().get("nome").toString());
                ingObj.setFoto(up.getFiles().get(0));
                ingDAO.alterar(ingObj);
                response.sendRedirect("index.jsp?erro=0");
            } catch (Exception e) {

            }
        } else if (request.getParameter("id") != null) {
            ingObj = ingDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
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
                <h2>Alterar um <u>Ingrediente</u></h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <section id="about" class="three">
        <div class="container">
            <form action="upd.jsp" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="6u">Id:<input type="text" name="id" value="<%=ingObj.getId()%>" readonly /></div>
                    <div class="6u">Nome:<input type="text" name="nome" value="<%=ingObj.getNome()%>" /></div>
                    <div class="6u">Escolher Foto:<br><input type="file" name="foto" /></div>
                    <div class="12u"><input type="submit" value="Enviar" /></div>
                </div>
            </form>
        </div>
    </section>
</div>
<%@include file="../rodape.jsp"%>