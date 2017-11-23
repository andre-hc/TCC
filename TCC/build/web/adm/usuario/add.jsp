<%@page import="util.Criptografia"%>
<%@page import="java.lang.Exception"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cabecalho.jsp"%>

<!DOCTYPE HTML>
<!--
        Front-end: html5up.net | André Huber | Ícaro Crespo 
        Back-end: André Huber | Ícaro Crespo
-->
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
            UsuarioDAO dao = new UsuarioDAO();
            Usuario obj = new Usuario();

            try {
                obj.setNome(up.getForm().get("nome").toString());
                obj.setEmail(up.getForm().get("email").toString());
                obj.setSenha(Criptografia.convertPasswordToMD5(up.getForm().get("senha").toString()));
                obj.setTelefone(up.getForm().get("telefone").toString());

                if (up.getForm().get("uf").toString() != null) {
                    if (up.getForm().get("uf").toString().equals("1")) {
                        obj.setUf("AC");
                    } else if (up.getForm().get("uf").toString().equals("2")) {
                        obj.setUf("AL");
                    } else if (up.getForm().get("uf").toString().equals("3")) {
                        obj.setUf("AP");
                    } else if (up.getForm().get("uf").toString().equals("4")) {
                        obj.setUf("AM");
                    } else if (up.getForm().get("uf").toString().equals("5")) {
                        obj.setUf("BA");
                    } else if (up.getForm().get("uf").toString().equals("6")) {
                        obj.setUf("CE");
                    } else if (up.getForm().get("uf").toString().equals("7")) {
                        obj.setUf("DF");
                    } else if (up.getForm().get("uf").toString().equals("8")) {
                        obj.setUf("ES");
                    } else if (up.getForm().get("uf").toString().equals("9")) {
                        obj.setUf("GO");
                    } else if (up.getForm().get("uf").toString().equals("10")) {
                        obj.setUf("MA");
                    } else if (up.getForm().get("uf").toString().equals("11")) {
                        obj.setUf("MT");
                    } else if (up.getForm().get("uf").toString().equals("12")) {
                        obj.setUf("MS");
                    } else if (up.getForm().get("uf").toString().equals("13")) {
                        obj.setUf("MG");
                    } else if (up.getForm().get("uf").toString().equals("14")) {
                        obj.setUf("PA");
                    } else if (up.getForm().get("uf").toString().equals("15")) {
                        obj.setUf("PB");
                    } else if (up.getForm().get("uf").toString().equals("16")) {
                        obj.setUf("PR");
                    } else if (up.getForm().get("uf").toString().equals("17")) {
                        obj.setUf("PE");
                    } else if (up.getForm().get("uf").toString().equals("18")) {
                        obj.setUf("PI");
                    } else if (up.getForm().get("uf").toString().equals("19")) {
                        obj.setUf("RJ");
                    } else if (up.getForm().get("uf").toString().equals("20")) {
                        obj.setUf("RN");
                    } else if (up.getForm().get("uf").toString().equals("21")) {
                        obj.setUf("RS");
                    } else if (up.getForm().get("uf").toString().equals("22")) {
                        obj.setUf("RO");
                    } else if (up.getForm().get("uf").toString().equals("23")) {
                        obj.setUf("RR");
                    } else if (up.getForm().get("uf").toString().equals("24")) {
                        obj.setUf("SC");
                    } else if (up.getForm().get("uf").toString().equals("25")) {
                        obj.setUf("SP");
                    } else if (up.getForm().get("uf").toString().equals("26")) {
                        obj.setUf("SE");
                    } else if (up.getForm().get("uf").toString().equals("27")) {
                        obj.setUf("TO");
                    }
                }
                if (up.getForm().get("adm").toString().equals("nao")) {
                    obj.setAdm(false);
                } else {
                    obj.setAdm(true);
                }

                obj.setFoto(up.getFiles().get(0));
                dao.incluir(obj);
                response.sendRedirect("index.jsp?erro=0");
            } catch (Exception e) {

            }
        }
//        else{
//            if (up.getForm().get("nome").toString() == null) {
//                response.sendRedirect("add.jsp?erro=1");
//                return;
//            }
//            if (up.getForm().get("nome").toString().isEmpty()) {
//                response.sendRedirect("add.jsp?erro=1");
//                return;
//            }
//            UsuarioDAO dao = new UsuarioDAO();
//            Usuario obj = new Usuario();
//
//            try {
//                obj.setNome(request.getParameter("nome"));
//                obj.setEmail(request.getParameter("email"));
//                obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("senha")));
//                obj.setTelefone(request.getParameter("telefone"));
//                if (up.getForm().get("uf").toString().equals("1")) {obj.setUf("AC");} 
//                else if (up.getForm().get("uf").toString().equals("2")) { obj.setUf("AL"); }
//                else if (up.getForm().get("uf").toString().equals("3")) { obj.setUf("AP"); }
//                else if (up.getForm().get("uf").toString().equals("4")) { obj.setUf("AM"); }
//                else if (up.getForm().get("uf").toString().equals("5")) { obj.setUf("BA"); }
//                else if (up.getForm().get("uf").toString().equals("6")) { obj.setUf("CE"); }
//                else if (up.getForm().get("uf").toString().equals("7")) { obj.setUf("DF"); }
//                else if (up.getForm().get("uf").toString().equals("8")) { obj.setUf("ES"); }
//                else if (up.getForm().get("uf").toString().equals("9")) { obj.setUf("GO"); }
//                else if (up.getForm().get("uf").toString().equals("10")){ obj.setUf("MA"); }
//                else if (up.getForm().get("uf").toString().equals("11")){ obj.setUf("MT"); }
//                else if (up.getForm().get("uf").toString().equals("12")){ obj.setUf("MS"); }
//                else if (up.getForm().get("uf").toString().equals("13")){ obj.setUf("MG"); }
//                else if (up.getForm().get("uf").toString().equals("14")){ obj.setUf("PA"); }
//                else if (up.getForm().get("uf").toString().equals("15")){ obj.setUf("PB"); }
//                else if (up.getForm().get("uf").toString().equals("16")){ obj.setUf("PR"); }
//                else if (up.getForm().get("uf").toString().equals("17")){ obj.setUf("PE"); }
//                else if (up.getForm().get("uf").toString().equals("18")){ obj.setUf("PI"); }
//                else if (up.getForm().get("uf").toString().equals("19")){ obj.setUf("RJ"); }
//                else if (up.getForm().get("uf").toString().equals("20")){ obj.setUf("RN"); }
//                else if (up.getForm().get("uf").toString().equals("21")){ obj.setUf("RS"); }
//                else if (up.getForm().get("uf").toString().equals("22")){ obj.setUf("RO"); }
//                else if (up.getForm().get("uf").toString().equals("23")){ obj.setUf("RR"); }
//                else if (up.getForm().get("uf").toString().equals("24")){ obj.setUf("SC"); }
//                else if (up.getForm().get("uf").toString().equals("25")){ obj.setUf("SP"); }
//                else if (up.getForm().get("uf").toString().equals("26")){ obj.setUf("SE"); }
//                else if (up.getForm().get("uf").toString().equals("27")){ obj.setUf("TO"); }
//                
//                if (up.getForm().get("adm").toString().equals("sim")) {obj.setAdm(true);}
//                else if (up.getForm().get("adm").toString().equals("nao")){obj.setAdm(false);}
//                
//                obj.setFoto(up.getFiles().get(0));
//                dao.incluir(obj);
//                response.sendRedirect("index.jsp?erro=0");
//            } catch (Exception e) {
//
//            }
//        }
    }
%>

<!-- Main -->
<div id="main">

    <!-- Portfolio -->
    <section id="portfolio" class="two">
        <div class="container">
            <header>
                <h2>Adicionar um novo <u>Usuário</u></h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <section id="about" class="three">
        <div class="container">
            <form action="add.jsp" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="6u">Nome:<input type="text" name="nome" required/></div>
                    <div class="6u">E-mail:<input type="text" name="email" required/></div>
                    <div class="6u">Senha:<input minlength="6" type="password" name="senha" required/></div>
                    <div class="6u">Telefone:<input type="text" name="telefone"/></div>
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