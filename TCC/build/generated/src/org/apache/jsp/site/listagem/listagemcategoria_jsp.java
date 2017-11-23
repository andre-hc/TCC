package org.apache.jsp.site.listagem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Receita;
import dao.ReceitaDAO;
import modelo.Ingrediente;
import dao.IngredienteDAO;
import modelo.Categoria;
import java.util.List;
import dao.CategoriaDAO;
import modelo.Usuario;
import dao.UsuarioDAO;
import modelo.Ingrediente;
import dao.IngredienteDAO;
import modelo.Receita;
import dao.ReceitaDAO;
import modelo.Categoria;
import java.util.List;
import dao.CategoriaDAO;
import modelo.Usuario;
import dao.UsuarioDAO;

public final class listagemcategoria_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/site/listagem/../includes/cabecalho.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    UsuarioDAO usuarioDAO = new UsuarioDAO();
    Usuario usuario = new Usuario();

    CategoriaDAO catDAO = new CategoriaDAO();
    List<Categoria> catListAleat = catDAO.listarAleatorio();
    List<Categoria> catListAcesso = catDAO.listarMaisAcessado();
    List<Categoria> catList = catDAO.listar();


    IngredienteDAO ingDAO = new IngredienteDAO();
    List<Ingrediente> ingList = ingDAO.listar();

    if (session.getAttribute("usuario") != null) {
        usuario = (Usuario) session.getAttribute("usuario");
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML>\n");
      out.write("<!--\n");
      out.write("        Front-end: html5up.net | André Huber | Ícaro Crespo \n");
      out.write("        Back-end: André Huber | Ícaro Crespo\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>O que vamos preparar hoje</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=no\" />\n");
      out.write("        <!--[if lte IE 8]><script src=\"assets/js/ie/html5shiv.js\"></script><![endif]-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"../assets/css/main.css\" />\n");
      out.write("        <!--[if lte IE 9]><link rel=\"stylesheet\" href=\"assets/css/ie9.css\" /><![endif]-->\n");
      out.write("        <!--[if lte IE 8]><link rel=\"stylesheet\" href=\"assets/css/ie8.css\" /><![endif]-->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!-- Wrapper -->\n");
      out.write("        <div id=\"wrapper\">\n");
      out.write("            <!-- Main -->\n");
      out.write("            <div id=\"main\">\n");
      out.write("                <div class=\"inner\">\n");
      out.write("\n");
      out.write("                    <!-- Header -->\n");
      out.write("                    <header id=\"header\">\n");
      out.write("                        <a href=\"../geral/index.jsp\" class=\"logo\"><strong>O que vamos preparar hoje?</strong></a>\n");
      out.write("                        <!--                        <ul class=\"icons\">\n");
      out.write("                                                    <li><a href=\"#\" class=\"icon fa-facebook\"><span class=\"label\">Facebook</span></a></li>\n");
      out.write("                                                    <li><a href=\"#\" class=\"icon fa-instagram\"><span class=\"label\">Instagram</span></a></li>\n");
      out.write("                                                </ul>-->\n");
      out.write("                    </header>\n");
      out.write("                    <section>\n");
      out.write("                        <header class=\"major\">\n");
      out.write("                            <h2>Todas as categorias</h2>\n");
      out.write("                        </header>\n");
      out.write("                        <div class=\"posts\">\n");
      out.write("\n");
      out.write("                            ");

                                for (Categoria item : catListAcesso) {
                            
      out.write("\n");
      out.write("                            <article>\n");
      out.write("                                <a href=\"../detalhe/categoria.jsp?id=");
      out.print(item.getId());
      out.write("\" class=\"image\"><img src=\"../../fotos/");
      out.print(item.getFoto());
      out.write("\" alt=\"");
      out.print(item.getNome());
      out.write("\" height=\"300\" width=\"50\" /></a>\n");
      out.write("                                <h3>");
      out.print(item.getNome());
      out.write("</h3>\n");
      out.write("                                <p>");
      out.print(item.getDescricao());
      out.write("</p>\n");
      out.write("                                <ul class=\"actions\">\n");
      out.write("                                    <li><a href=\"../detalhe/categoria.jsp?id=");
      out.print(item.getId());
      out.write("\" class=\"button\">Ir para</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </article>\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </section>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Sidebar -->\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    UsuarioDAO cabecalho_usuarioDAO = new UsuarioDAO();
    Usuario cabecalho_usuario = new Usuario();

    CategoriaDAO cabecalho_catDAO = new CategoriaDAO();
    List<Categoria> cabecalho_catListAleat = cabecalho_catDAO.listarAleatorio();
    List<Categoria> cabecalho_catListAcesso = cabecalho_catDAO.listarMaisAcessado();
    List<Categoria> cabecalho_catList = cabecalho_catDAO.listar();

    ReceitaDAO cabecalho_recDAO = new ReceitaDAO();
    List<Receita> cabecalho_recListAleat = cabecalho_recDAO.listarAleatorio();
    List<Receita> cabecalho_recListaAcesso = cabecalho_recDAO.listarMaisAcessado();

    IngredienteDAO cabecalho_ingDAO = new IngredienteDAO();
    List<Ingrediente> cabecalho_ingList = cabecalho_ingDAO.listar();

    if (session.getAttribute("usuario") != null) {
        cabecalho_usuario = (Usuario) session.getAttribute("usuario");
    }
//    if (request.getParameter("sair").equals("true")) {
//        session.removeAttribute("usuario");
//        response.sendRedirect("index.jsp");
//        return;
//    }

      out.write("\n");
      out.write("\n");
      out.write("<!-- Sidebar -->\n");
      out.write("<div id=\"sidebar\">\n");
      out.write("    <div class=\"inner\">\n");
      out.write("        <!-- Search -->\n");
      out.write("        <section id=\"search\" class=\"alt\">\n");
      out.write("            <form method=\"post\" name=\"pesquisa\" action=\"#\">\n");
      out.write("                <input type=\"text\" name=\"txtFiltro\" id=\"query\" placeholder=\"Pesquise aqui\" />\n");
      out.write("            </form>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <!-- Menu -->\n");
      out.write("        <nav id=\"menu\">\n");
      out.write("            <ul>\n");
      out.write("                ");

                    if (cabecalho_usuario.getFoto() == null) {
                
      out.write("\n");
      out.write("                <li>\n");
      out.write("                <center>\n");
      out.write("                    <a href=\"../minhaconta.jsp\">cabecalho</a>\n");
      out.write("                    <a href=\"../minhaconta.jsp\"><img src=\"../images/user.png\" width=\"100\" height=\"100\" alt=\"Minha conta\"></a><br>\n");
      out.write("                </center>\n");
      out.write("                </li>\n");
      out.write("                ");

                    }
                    if (cabecalho_usuario.getFoto() != null) {
                
      out.write("\n");
      out.write("                <li>\n");
      out.write("                <center>\n");
      out.write("                    <a href=\"../minhaconta.jsp\">cabecalho</a>\n");
      out.write("                    <a href=\"../minhaconta.jsp\"><img src=\"");
      out.print(cabecalho_usuario.getFoto());
      out.write("\" width=\"100\" height=\"100\" alt=\"Minha conta\"></a>\n");
      out.write("                </center>\n");
      out.write("                </li>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("            </ul>\n");
      out.write("            <header class=\"major\">\n");
      out.write("                <h2>Menu</h2>\n");
      out.write("            </header>\n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"../geral/index.jsp\">Home</a></li>\n");
      out.write("                <li><a href=\"../listagem/listagemreceita.jsp\">Receitas</a></li>\n");
      out.write("\n");
      out.write("                <li>\n");
      out.write("                    <span class=\"opener\">Categorias</span>\n");
      out.write("                    <ul>\n");
      out.write("                        ");

                            int num_categoria = 0;
                            for (Categoria item : cabecalho_catList) {
                                if (num_categoria <= 2) {
                        
      out.write("\n");
      out.write("                        <li><a href=\"#\">");
      out.print(item.getNome());
      out.write("</a></li>\n");
      out.write("                            ");

                                    }
                                    num_categoria++;
                                }
                            
      out.write("\n");
      out.write("                        <li><a href=\"../listagem/listagemcategoria.jsp\" >Ver todas</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"../minhaconta.jsp\">Seus Pratos</a></li>\n");
      out.write("                <li>\n");
      out.write("                    <span class=\"opener\">Ingredientes mais usados</span>\n");
      out.write("                    <ul>\n");
      out.write("                        ");

                            int num_ingrediente = 0;
                            for (Ingrediente item : cabecalho_ingList) {
                                if (num_ingrediente <= 2) {
                        
      out.write("\n");
      out.write("                        <li><a href=\"../detalhe/ingrediente.jsp\">");
      out.print(item.getNome());
      out.write("</a></li>\n");
      out.write("                            ");

                                    }
                                    num_ingrediente++;
                                }
                            
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"../minhaconta.jsp\">Favoritos</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <!-- Section -->\n");
      out.write("        <section>\n");
      out.write("            <header class=\"major\">\n");
      out.write("                <h2>Algumas receitas do nosso site</h2>\n");
      out.write("            </header>\n");
      out.write("            <div class=\"mini-posts\">\n");
      out.write("                ");

                    for (Receita item : cabecalho_recListAleat) {
                
      out.write("\n");
      out.write("                <article>\n");
      out.write("                    <a href=\"../detalhe/receita.jsp?id=");
      out.print(item.getId());
      out.write("\" class=\"image\"><img src=\"\" alt=\"");
      out.print(item.getNome());
      out.write("\" /></a>\n");
      out.write("                    <p>");
      out.print(item.getDescricao());
      out.write("</p>\n");
      out.write("                </article>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"actions\">\n");
      out.write("                <li><a href=\"../listagem/listagemreceita.jsp\" class=\"button\">Mostrar mais</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <section>\n");
      out.write("            <header class=\"major\">\n");
      out.write("                <h2>Algumas categorias do nosso site</h2>\n");
      out.write("            </header>\n");
      out.write("            <div class=\"mini-posts\">\n");
      out.write("                ");

                    for (Categoria item : cabecalho_catListAleat) {
                
      out.write("\n");
      out.write("                <article>\n");
      out.write("                    <a href=\"../detalhe/categoria.jsp?id=");
      out.print(item.getId());
      out.write("\" class=\"image\"><img src=\"../../fotos/");
      out.print(item.getFoto());
      out.write("\" alt=\"");
      out.print(item.getNome());
      out.write("\" /></a>\n");
      out.write("                    <p>");
      out.print(item.getNome());
      out.write("</p>\n");
      out.write("                </article>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"actions\">\n");
      out.write("                <li><a href=\"../listagem/listagemcategoria.jsp\" class=\"button\">mostrar mais</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <!-- Section -->\n");
      out.write("        <section>\n");
      out.write("            <header class=\"major\">\n");
      out.write("                <h2>Entre em contato</h2>\n");
      out.write("            </header>\n");
      out.write("            <p>Envie suas dúvidas pelo nosso e-mail abaixo, ou acesse a área para contato.</p>\n");
      out.write("            <ul class=\"contact\">\n");
      out.write("                <li class=\"fa-envelope-o\"><a href=\"#\">icarocrespo@gmail.com</a></li>\n");
      out.write("                <li class=\"fa-phone\">53 99944-0212</li>\n");
      out.write("                <li class=\"fa-home\">Av. Leonel de Moura Brizola, 2501<br />\n");
      out.write("                    Bagé/RS</li>\n");
      out.write("            </ul>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <!-- Footer -->\n");
      out.write("        <footer id=\"footer\">\n");
      out.write("            <p class=\"copyright\">&copy; Desenvolvido por André Huber e Ícaro Crespo | Design: HTML5 UP.</p>\n");
      out.write("        </footer>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <!-- Scripts -->\n");
      out.write("        <script src=\"../assets/js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"../assets/js/skel.min.js\"></script>\n");
      out.write("        <script src=\"../assets/js/util.js\"></script>\n");
      out.write("        <!--[if lte IE 8]><script src=\"assets/js/ie/respond.min.js\"></script><![endif]-->\n");
      out.write("        <script src=\"../assets/js/main.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!-- Exemplo Função Javascript pesquisa -->\n");
      out.write("\n");
      out.write("<!--<script src=\"https://code.jquery.com/jquery-1.12.4.js\"></script>\n");
      out.write("  <script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\n");
      out.write("  <script>\n");
      out.write("  $( function() {\n");
      out.write("    var availableTags = [\n");
      out.write("      \"ActionScript\",\n");
      out.write("      \"AppleScript\",\n");
      out.write("      \"Asp\",\n");
      out.write("      \"BASIC\",\n");
      out.write("      \"C\",\n");
      out.write("      \"C++\",\n");
      out.write("      \"Clojure\",\n");
      out.write("      \"COBOL\",\n");
      out.write("      \"ColdFusion\",\n");
      out.write("      \"Erlang\",\n");
      out.write("      \"Fortran\",\n");
      out.write("      \"Groovy\",\n");
      out.write("      \"Haskell\",\n");
      out.write("      \"Java\",\n");
      out.write("      \"JavaScript\",\n");
      out.write("      \"Lisp\",\n");
      out.write("      \"Perl\",\n");
      out.write("      \"PHP\",\n");
      out.write("      \"Python\",\n");
      out.write("      \"Ruby\",\n");
      out.write("      \"Scala\",\n");
      out.write("      \"Scheme\"\n");
      out.write("    ];\n");
      out.write("    $( \"#tags\" ).autocomplete({\n");
      out.write("      source: availableTags\n");
      out.write("    });\n");
      out.write("  } );\n");
      out.write("  </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write(" \n");
      out.write("<div class=\"ui-widget\">\n");
      out.write("  <label for=\"tags\">Tags: </label>\n");
      out.write("  <input id=\"tags\">\n");
      out.write("</div>-->");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
