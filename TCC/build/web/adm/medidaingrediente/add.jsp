<%@page import="dao.IngredienteDAO"%>
<%@page import="dao.MedidaDAO"%>
<%@page import="modelo.Ingrediente"%>
<%@page import="modelo.Medida"%>
<%@page import="modelo.Medidaingrediente"%>
<%@page import="dao.MedidaingredienteDAO"%>
<%@page import="modelo.Receita"%>
<%@page import="java.util.List"%>
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
            msg = "Por favor selecione uma Medida referente.";
        } else if (request.getParameter("erro").equals("4")) {
            msg = "Por favor selecione um Ingrediente referente.";
        }
    }

    ReceitaDAO recDAO = new ReceitaDAO();
    List<Receita> recList = recDAO.listar();

    MedidaDAO medDAO = new MedidaDAO();
    List<Medida> medList = medDAO.listar();

    IngredienteDAO ingDAO = new IngredienteDAO();
    List<Ingrediente> ingList = ingDAO.listar();

    if (request.getMethod().equals("POST")) {
        if (request.getParameter("quantidade") == null) {
            response.sendRedirect("add.jsp?erro=1");
            return;
        }
        if (request.getParameter("quantidade").isEmpty()) {
            response.sendRedirect("add.jsp?erro=1");
            return;
        }
        if (request.getParameter("usuario").equals("selecione")) {
            response.sendRedirect("add.jsp?erro=3");
            return;
        } else if (request.getParameter("medida").equals("selecione")) {
            response.sendRedirect("add.jsp?erro=2");
            return;
        } else if (request.getParameter("ingrediente").equals("selecione")){
            response.sendRedirect("add.jsp?erro=4");
            return;
        }
        MedidaingredienteDAO dao = new MedidaingredienteDAO();
        Medidaingrediente obj = new Medidaingrediente();

        try {
            Receita receita = new Receita();
            Medida medida = new Medida();
            Ingrediente ingrediente = new Ingrediente();

            receita.setId(Integer.parseInt(request.getParameter("receita")));
            medida.setId(Integer.parseInt(request.getParameter("medida")));
            ingrediente.setId(Integer.parseInt(request.getParameter("ingrediente")));
            obj.setQuantidade(request.getParameter("quantidade"));
            obj.setReceita(receita);
            obj.setMedida(medida);
            obj.setIngrediente(ingrediente);
            dao.incluir(obj);
            response.sendRedirect("index.jsp?erro=0");
        } catch (Exception e) {

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
                <h2>Adicionar uma nova <u>Medida-Ingrediente</u></h2>
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
            <form action="add.jsp" method="post">
                <div class="row">
                    <div class="6u">Quantidade:<input type="text" name="quantidade" required/></div>
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
                            <option value="<%=item.getId()%>"><%=item.getNome()%> &nbsp;&nbsp;&nbsp;&nbsp;<%=item.getId()%></option>
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