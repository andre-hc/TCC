<%@page import="modelo.Ingrediente"%>
<%@page import="modelo.Medida"%>
<%@page import="dao.IngredienteDAO"%>
<%@page import="dao.MedidaDAO"%>
<%@page import="dao.ReceitaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Receita"%>
<%@page import="java.lang.Exception"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Medidaingrediente"%>
<%@page import="dao.MedidaingredienteDAO"%>
<%
    MedidaingredienteDAO medIngDAO = new MedidaingredienteDAO();
    Medidaingrediente medIngObj = new Medidaingrediente();

    ReceitaDAO recDAO = new ReceitaDAO();
    List<Receita> recList = recDAO.listar();

    MedidaDAO medDAO = new MedidaDAO();
    List<Medida> medList = medDAO.listar();

    IngredienteDAO ingDAO = new IngredienteDAO();
    List<Ingrediente> ingList = ingDAO.listar();

    String msg = "0";
    if (request.getParameter("erro") != null) {
        if (request.getParameter("erro").equals("2")) {
            msg = "Por favor selecione uma Receita referente.";
        } else if (request.getParameter("erro").equals("3")) {
            msg = "Por favor selecione uma Medida referente.";
        } else if (request.getParameter("erro").equals("4")) {
            msg = "Por favor selecione um Ingrediente referente.";
        }
    }

    if (request.getMethod().equals("POST")) {
        if (request.getParameter("usuario").equals("selecione")) {
            response.sendRedirect("upd.jsp?erro=3");
            return;
        } else if (request.getParameter("medida").equals("selecione")) {
            response.sendRedirect("upd.jsp?erro=2");
            return;
        } else if (request.getParameter("ingrediente").equals("selecione")) {
            response.sendRedirect("upd.jsp?erro=4");
            return;
        }
        if (request.getParameter("id") != null && request.getParameter("quantidade") != null) {
            try {
                Receita receita = new Receita();
                Medida medida = new Medida();
                Ingrediente ingrediente = new Ingrediente();

                receita.setId(Integer.parseInt(request.getParameter("receita")));
                medida.setId(Integer.parseInt(request.getParameter("medida")));
                ingrediente.setId(Integer.parseInt(request.getParameter("ingrediente")));
                medIngObj.setQuantidade(request.getParameter("quantidade"));
                medIngObj.setId(Integer.parseInt(request.getParameter("id")));
                medIngObj.setReceita(receita);
                medIngObj.setMedida(medida);
                medIngObj.setIngrediente(ingrediente);
                medIngDAO.alterar(medIngObj);
                response.sendRedirect("index.jsp?erro=0");
            } catch (Exception e) {

            }
        }
        if (request.getParameter("id") != null) {
            medIngObj = medIngDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
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
                <h2>Alterar uma <u>Medida-Ingrediente</u></h2>
            </header>
        </div>
    </section>

    <!-- About Me -->
    <section id="about" class="three">
        <div class="container">
            <form action="upd.jsp" method="post">
                <div class="row">
                    <div class="6u">Id:<input type="text" name="id" value="<%=medIngObj.getId()%>" readonly /></div>
                    <div class="4u">Quantidade:<input type="text" name="quantidade" value="<%=medIngObj.getQuantidade()%>" required/></div>
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
                    <div class="6u">Medida:
                        <select name="medida" required>
                            <option value="selecione">Selecione</option>
                            <%
                                for (Medida item : medList) {
                            %>
                            <option value="<%=item.getId()%>"><%=item.getNome()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="6u">Ingrediente:
                        <select name="ingrediente" required>
                            <option value="selecione">Selecione</option>
                            <%
                                for (Ingrediente item : ingList) {
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