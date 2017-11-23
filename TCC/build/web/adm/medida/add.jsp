<%@page import="java.lang.Exception"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Medida"%>
<%@page import="dao.MedidaDAO"%>
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
            MedidaDAO dao = new MedidaDAO();
            Medida obj = new Medida();

            try {
                obj.setNome(up.getForm().get("nome").toString());
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
                <h2>Adicionar uma nova <u>Medida</u></h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <section id="about" class="three">
        <div class="container">
            <form action="add.jsp" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="6u">Nome:<input type="text" name="nome" required/></div>
                    <div class="6u">Escolher foto:<br><input type="file" name="foto" required/></div>
                    <div class="12u"><input type="submit" value="Enviar" /></div>
                </div>
            </form>
        </div>
    </section>
</div>
<%@include file="../rodape.jsp"%>