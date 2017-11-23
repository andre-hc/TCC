<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        FreeD Livraria
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="css/font-awesome.css" rel="stylesheet" type='text/css'>
    <link href="css/bootstrap.min.css" rel="stylesheet" type='text/css'>
    <link href="css/animate.min.css" rel="stylesheet" type='text/css'>
    <link href="css/owl.carousel.css" rel="stylesheet" type='text/css'>
    <link href="css/owl.theme.css" rel="stylesheet" type='text/css'>

    <!-- theme stylesheet -->
    <link href="css/style.default.css" rel="stylesheet" id="theme-stylesheet" type='text/css'>

    <!-- your stylesheet with modifications -->
    <link href="css/custom.css" rel="stylesheet" type='text/css'>

    <script src="js/respond.min.js"></script>

    <link rel="shortcut icon" href="favicon.png">

</head>

<body>
    <div id="top">
        <div class="container">

            <div class="col-md-13" >
                <ul class="menu">
                    <li><a href="#" data-toggle="modal" data-target="#login-modal">Entre</a>
                    </li>
                    <li><a href="#" data-toggle="modal" data-target="#register-modal">Registrar-se</a>
                    </li>
                    <li><a href="contato.jsp">Contato</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
            <div class="modal-dialog modal-sm">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="Login">Login do Cliente</h4>
                    </div>
                    <div class="modal-body">
                        <form action="customer-orders.html" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" id="email-modal" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password-modal" placeholder="Senha">
                            </div>

                            <p class="text-center">
                                <button class="btn btn-primary"><i class="fa fa-sign-in"></i>Entrar</button>
                            </p>

                        </form>
                    </div>
                </div>
            </div>
        </div> 
        <div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="Registro" aria-hidden="true">
            <div class="modal-dialog modal-sm">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="Registro">Registro</h4>
                    </div>
                    <div class="modal-body">
                        <form action="customer-orders.html" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" id="email-modal" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="nome-modal" placeholder="Nome">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password-modal" placeholder="Senha">
                            </div>

                            <p class="text-center">
                                <button class="btn btn-primary"><i class="fa fa-sign-in"></i>Registrar-se</button>
                            </p>

                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <a class="navbar-brand home" href="index.jsp" data-animate-hover="bounce">
                    <img src="img/logo.png" alt="Obaju logo" class="hidden-xs">
                    <img src="img/logo-small.png" alt="Obaju logo" class="visible-xs"><span class="sr-only">FreeD - Início</span>
                </a>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                    <a class="btn btn-default navbar-toggle" href="carrinho.jsp">
                        <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">Carrinho</span>
                    </a>
                </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="index.jsp">Início</a>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                           data-hover="dropdown" data-delay="200">Categorias <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h5>Pré-Vendas</h5>
                                            <ul>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Todos</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>Lançamentos</h5>
                                            <ul>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Todos</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>E-Books</h5>
                                            <ul>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Todos</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>Audiobooks</h5>
                                            <ul>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Todos</a>
                                                </li>
                                            </ul>
                                            <h5>TOPS</h5>
                                            <ul>
                                                <li><a href="category.html">Top 10 + vendidos</a>
                                                </li>
                                                <li><a href="category.html">Top 10 + bem avaliados</a>
                                                </li>
                                                <li><a href="category.html">Top 10 + comentados</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                           data-hover="dropdown" data-delay="200">Classificações <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h5>Geek</h5>
                                            <ul>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Todos</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>Infantil</h5>
                                            <ul>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Todos</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>Adolescente</h5>
                                            <ul>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Todos</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-3">
                                            <h5>Adulto</h5>
                                            <ul>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Nome do Livro</a>
                                                </li>
                                                <li><a href="category.html">Todos</a>
                                                </li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                           data-hover="dropdown" data-delay="200">Livros<b class="caret"></b></a>

                        <!-- /.yamm-content -->
                    </li>

            </div>
            <!--/.nav-collapse -->

            <div class="navbar-buttons">

                <div class="navbar-collapse collapse right" id="basket-overview">
                    <a href="carrinho.jsp" class="btn btn-primary navbar-btn">
                        <i class="fa fa-shopping-cart"></i><span class="hidden-sm">Carrinho</span></a>
                </div>
                <!--/.nav-collapse -->

                <div class="navbar-collapse collapse right" id="search-not-mobile">
                    <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Pesquisa</span>
                        <i class="fa fa-search"></i>
                    </button>
                </div>

            </div>

            <div class="collapse clearfix" id="search">

                <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Pesquisar">
                        <span class="input-group-btn">

                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>

                        </span>
                    </div>
                </form>

            </div>
            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->