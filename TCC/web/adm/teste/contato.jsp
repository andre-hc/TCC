<%@include file="cabecalho.jsp" %>
<div id="all">

    <div id="content">
        <div class="container">

            <div class="col-md-12">
                <ul class="breadcrumb">
                    <li><a href="index.jsp">Início</a>
                    </li>
                    <li>Contato</li>
                </ul>

            </div>

            <div class="col-md-3">
                <div class="panel panel-default sidebar-menu">
                    <div class="panel-heading">
                        <h3 class="panel-title">Páginas</h3>
                    </div>

                    <div class="panel-body">
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <a href="text.html">Conta</a>
                            </li>
                            <li>
                                <a href="faq.jsp">FAQ</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- *** PAGES MENU END *** -->

                <div class="banner">
                    <a href="#">
                        <img src="img/banner.jpg" alt="sales 2014" class="img-responsive">
                    </a>
                </div>
            </div>

            <div class="col-md-9">

                <div class="box" id="contact">
                    <h1>Contato</h1>

                    <hr>

                    <form>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="firstname">Nome</label>
                                    <input type="text" class="form-control" id="firstname">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="lastname">Sobrenome</label>
                                    <input type="text" class="form-control" id="lastname">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" id="email">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="subject">Assunto</label>
                                    <input type="text" class="form-control" id="subject">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="message">Mensagem</label>
                                    <textarea id="message" class="form-control"></textarea>
                                </div>
                            </div>

                            <div class="col-sm-12 text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i>Enviar</button>

                            </div>
                        </div>
                        <!-- /.row -->
                    </form>
                </div>
            </div>
            <!-- /.col-md-9 -->
        </div>
        <!-- /.container -->
    </div>
    <!-- /#content -->
    <%@include file="footer.jsp" %>