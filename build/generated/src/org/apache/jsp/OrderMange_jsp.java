package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import dto.OrderDTO;
import controller.IMyConstant;

public final class OrderMange_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Order Mangemet</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         <nav class=\"navbar\"> \n");
      out.write("        <a class=\"brand\" style=\"font-size: 30px;\" href=\"MainServlet?action=");
      out.print( IMyConstant.ADMINPAGE_DEFAULT);
      out.write("\">Flower Shop <i class='bx bxs-florist'></i></a>\n");
      out.write("        \n");
      out.write("             <ul>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"MainServlet?action=LoadOrder&order=0\" style=\"font-size: 23px;\"><i class='bx bxs-home'></i> All</a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"MainServlet?action=LoadOrder&order=1\" style=\"font-size: 23px;\"><i class='bx bxs-edit-alt'></i> Processing</a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"MainServlet?action=LoadOrder&order=2\" style=\"font-size: 23px;\"><i class='bx bx-log-in'></i> Shipping</a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"MainServlet?action=LoadOrder&order=3\"  style=\"font-size: 23px; cursor: pointer;\"><i class='bx bxs-cart'></i> Cancled </a>\n");
      out.write("                </li>\n");
      out.write("                 <li>\n");
      out.write("                    <a href=\"MainServlet?action=LoadOrder&order=4\"  style=\"font-size: 23px; cursor: pointer;\"><i class='bx bxs-cart'></i> Completed </a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        \n");
      out.write("        </nav>\n");
      out.write("         ");
  Integer type = (Integer) request.getAttribute("type");
                List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("orderList");
            String display=" ";
            
            
            if(type != null){
            
            if(type == 1){
                display = "Proccessing Order";
            }else if(type == 2){
                display ="Shipping Order";
                
            }else if(type == 3){
                display = "Cancled Order";
            }else if(type == 0){
                display ="All of your Order";
            }else if(type == 4){
                display="Completed Order";
            }else{
                display =" " ;
            }
            }else
            {type = 5;
            display=" ";}
            if (list != null){
            
             
        
      out.write("\n");
      out.write("        <h1 style=\"text-align: center; color: black; font-size: 50px\">");
      out.print( display);
      out.write("</h1>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("                \n");
      out.write("      \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
