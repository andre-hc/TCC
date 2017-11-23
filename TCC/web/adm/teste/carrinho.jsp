<%@include file="cabecalho.jsp" %> 
<div id="all">

    <div id="content">
        <div class="container">

            <div class="col-md-12">
                <ul class="breadcrumb">
                    <li><a href="index.jsp">Início</a>
                    </li>
                    <li>Carrinho</li>
                </ul>
            </div>

            <div class="col-md-9" id="basket">

                <div class="box">

                    <form method="post" action="checkout1.html">

                        <h1>Carrinho de Compras</h1>
                        <p class="text-muted">Verifique suas compras abaixo.</p>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th colspan="2">Produto</th>
                                        <th>Quantidade</th>
                                        <th>Preço unitário</th>
                                        <th>Desconto</th>
                                        <th colspan="2">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <a href="#">
                                                <img src="img/detailsquare.jpg" alt="White Blouse Armani">
                                            </a>
                                        </td>
                                        <td><a href="#">White Blouse Armani</a>
                                        </td>
                                        <td>
                                            <input type="number" value="2" class="form-control">
                                        </td>
                                        <td>$123.00</td>
                                        <td>$0.00</td>
                                        <td>$246.00</td>
                                        <td><a href="#"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#">
                                                <img src="img/basketsquare.jpg" alt="Black Blouse Armani">
                                            </a>
                                        </td>
                                        <td><a href="#">Black Blouse Armani</a>
                                        </td>
                                        <td>
                                            <input type="number" value="1" class="form-control">
                                        </td>
                                        <td>$200.00</td>
                                        <td>$0.00</td>
                                        <td>$200.00</td>
                                        <td><a href="#"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="5">Total</th>
                                        <th colspan="2">$446.00</th>
                                    </tr>
                                </tfoot>
                            </table>

                        </div>
                        <!-- /.table-responsive -->

                        <div class="box-footer">
                            <div class="pull-left">
                                <a href="category.html" class="btn btn-default">
                                    <i class="fa fa-chevron-left"></i> Continue comprando</a>
                            </div>
                            <div class="pull-right">
                                <button class="btn btn-default"><i class="fa fa-refresh"></i>Atualizar carrinho</button>
                                <button type="submit" class="btn btn-primary">Proceder com a compra<i class="fa fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>

                    </form>

                </div>
                <!-- /.box -->

                <div class="row same-height-row">
                    <div class="col-md-3 col-sm-6">
                        <div class="box same-height">
                            <h3>Você pode gostar desses livros</h3>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="product same-height">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front">
                                        <a href="detail.html">
                                            <img src="img/product2.jpg" alt="" class="img-responsive">
                                        </a>
                                    </div>
                                    <div class="back">
                                        <a href="detail.html">
                                            <img src="img/product2_2.jpg" alt="" class="img-responsive">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="detail.html" class="invisible">
                                <img src="img/product2.jpg" alt="" class="img-responsive">
                            </a>
                            <div class="text">
                                <h3>Fur coat</h3>
                                <p class="price">$143</p>
                            </div>
                        </div>
                        <!-- /.product -->
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="product same-height">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front">
                                        <a href="detail.html">
                                            <img src="img/product1.jpg" alt="" class="img-responsive">
                                        </a>
                                    </div>
                                    <div class="back">
                                        <a href="detail.html">
                                            <img src="img/product1_2.jpg" alt="" class="img-responsive">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="detail.html" class="invisible">
                                <img src="img/product1.jpg" alt="" class="img-responsive">
                            </a>
                            <div class="text">
                                <h3>Fur coat</h3>
                                <p class="price">$143</p>
                            </div>
                        </div>
                        <!-- /.product -->
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="product same-height">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front">
                                        <a href="detail.html">
                                            <img src="img/product3.jpg" alt="" class="img-responsive">
                                        </a>
                                    </div>
                                    <div class="back">
                                        <a href="detail.html">
                                            <img src="img/product3_2.jpg" alt="" class="img-responsive">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="detail.html" class="invisible">
                                <img src="img/product3.jpg" alt="" class="img-responsive">
                            </a>
                            <div class="text">
                                <h3>Fur coat</h3>
                                <p class="price">$143</p>

                            </div>
                        </div>
                        <!-- /.product -->
                    </div>

                </div>
            </div>
            <!-- /.col-md-9 -->

            <div class="col-md-3">
                <div class="box" id="order-summary">
                    <div class="box-header">
                        <h3>Resumo da Compra</h3>
                    </div>
                    <p class="text-muted">Confira o resumo dos valores que serão cobrados.</p>

                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>Subtotal</td>
                                    <th>$446.00</th>
                                </tr>
                                <tr>
                                    <td>Cupom de desconto</td>
                                    <th>$10.00</th>
                                </tr>
                                <tr>
                                    <td>Frete</td>
                                    <th>$0.00</th>
                                </tr>
                                <tr class="total">
                                    <td>Total</td>
                                    <th>$456.00</th>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>

                <div class="box">
                    <div class="box-header">
                        <h4>Código do cupom</h4>
                    </div>
                    <p class="text-muted">Se você possui um cupom de desconto, insira o número na caixa indicada.</p>
                    <form>
                        <div class="input-group">

                            <input type="text" class="form-control">

                            <span class="input-group-btn">

                                <button class="btn btn-primary" type="button"><i class="fa fa-gift"></i></button>

                            </span>
                        </div>
                        <!-- /input-group -->
                    </form>
                </div>

            </div>
            <!-- /.col-md-3 -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#content -->
    <%@include file="footer.jsp" %>