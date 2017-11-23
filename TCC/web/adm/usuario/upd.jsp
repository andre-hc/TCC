<%@page import="util.Criptografia"%>
<%@page import="java.lang.Exception"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%
    UsuarioDAO usuDAO = new UsuarioDAO();
    Usuario usuObj = new Usuario();

    Upload up = new Upload();
    up.setFolderUpload("adm/fotosPerfil");
    if (request.getMethod().equals("POST")) {
        if (up.formProcess(getServletContext(), request)) {
            try {
                usuObj.setId(Integer.parseInt(up.getForm().get("id").toString()));
                usuObj.setNome(up.getForm().get("nome").toString());
                usuObj.setEmail(up.getForm().get("email").toString());
                usuObj.setSenha(Criptografia.convertPasswordToMD5(up.getForm().get("senha").toString()));
                usuObj.setTelefone(up.getForm().get("telefone").toString());
                if (up.getForm().get("uf").toString().equals("1")) {usuObj.setUf("AC");} 
                else if (up.getForm().get("uf").toString().equals("2")) { usuObj.setUf("AL"); }
                else if (up.getForm().get("uf").toString().equals("3")) { usuObj.setUf("AP"); }
                else if (up.getForm().get("uf").toString().equals("4")) { usuObj.setUf("AM"); }
                else if (up.getForm().get("uf").toString().equals("5")) { usuObj.setUf("BA"); }
                else if (up.getForm().get("uf").toString().equals("6")) { usuObj.setUf("CE"); }
                else if (up.getForm().get("uf").toString().equals("7")) { usuObj.setUf("DF"); }
                else if (up.getForm().get("uf").toString().equals("8")) { usuObj.setUf("ES"); }
                else if (up.getForm().get("uf").toString().equals("9")) { usuObj.setUf("GO"); }
                else if (up.getForm().get("uf").toString().equals("10")){ usuObj.setUf("MA"); }
                else if (up.getForm().get("uf").toString().equals("11")){ usuObj.setUf("MT"); }
                else if (up.getForm().get("uf").toString().equals("12")){ usuObj.setUf("MS"); }
                else if (up.getForm().get("uf").toString().equals("13")){ usuObj.setUf("MG"); }
                else if (up.getForm().get("uf").toString().equals("14")){ usuObj.setUf("PA"); }
                else if (up.getForm().get("uf").toString().equals("15")){ usuObj.setUf("PB"); }
                else if (up.getForm().get("uf").toString().equals("16")){ usuObj.setUf("PR"); }
                else if (up.getForm().get("uf").toString().equals("17")){ usuObj.setUf("PE"); }
                else if (up.getForm().get("uf").toString().equals("18")){ usuObj.setUf("PI"); }
                else if (up.getForm().get("uf").toString().equals("19")){ usuObj.setUf("RJ"); }
                else if (up.getForm().get("uf").toString().equals("20")){ usuObj.setUf("RN"); }
                else if (up.getForm().get("uf").toString().equals("21")){ usuObj.setUf("RS"); }
                else if (up.getForm().get("uf").toString().equals("22")){ usuObj.setUf("RO"); }
                else if (up.getForm().get("uf").toString().equals("23")){ usuObj.setUf("RR"); }
                else if (up.getForm().get("uf").toString().equals("24")){ usuObj.setUf("SC"); }
                else if (up.getForm().get("uf").toString().equals("25")){ usuObj.setUf("SP"); }
                else if (up.getForm().get("uf").toString().equals("26")){ usuObj.setUf("SE"); }
                else if (up.getForm().get("uf").toString().equals("27")){ usuObj.setUf("TO"); }
                
                if (up.getForm().get("adm").toString().equals("nao")){
                    usuObj.setAdm(false);
                } else{
                    usuObj.setAdm(true);
                }
                usuObj.setFoto(up.getFiles().get(0));
                usuDAO.alterar(usuObj);
                response.sendRedirect("index.jsp?erro=0");
            } catch (Exception e) {

            }
        } else if (request.getParameter("id") != null) {
            usuObj = usuDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
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
                <h2>Alterar um <u>Usuário</u> exisente</h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <section id="about" class="three">
        <div class="container">
            <form action="upd.jsp" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="6u">Id:<input type="text" name="id" value="<%=usuObj.getId()%>" readonly/></div>
                    <div class="6u">Nome:<input type="text" name="nome" value="<%=usuObj.getNome()%>" required/></div>
                    <div class="6u">E-mail:<input type="text" name="email" value="<%=usuObj.getEmail()%>" required/></div>
                    <div class="6u">Senha:<input type="password" name="senha" required/></div>
                    <div class="6u">Telefone:<input type="text" name="telefone" value="<%=usuObj.getTelefone()%>"/></div>
                    <div class="2u">UF:<select name="uf">
                            <option value="1">AC</option>
                            <option value="2">AL</option>
                            <option value="3">AP</option>
                            <option value="4">AM</option>
                            <option value="5">BA</option>
                            <option value="6">CE</option>
                            <option value="7">DF</option>
                            <option value="8">ES</option>
                            <option value="9">GO</option>
                            <option value="10">MA</option>
                            <option value="11">MT</option>
                            <option value="12">MS</option>
                            <option value="13">MG</option>
                            <option value="14">PA</option>
                            <option value="15">PB</option>
                            <option value="16">PR</option>
                            <option value="17">PE</option>
                            <option value="18">PI</option>
                            <option value="19">RJ</option>
                            <option value="20">RN</option>
                            <option value="21">RS</option>
                            <option value="22">RO</option>
                            <option value="23">RR</option>
                            <option value="24">SC</option>
                            <option value="25">SP</option>
                            <option value="26">SE</option>
                            <option value="27">TO</option>
                        </select>
                    </div>
                    <div class="2u">ADM:<select name="adm">
                            <option value="nao">Não</option>
                            <option value="sim">Sim</option>
                        </select>
                    </div>
                    <div class="8u">Escolher foto:<br><input type="file" name="foto" required/></div>
                    <div class="12u"><input type="submit" value="Enviar" /></div>
                </div>
            </form>
        </div>
    </section>
</div>
<%@include file="../rodape.jsp"%>