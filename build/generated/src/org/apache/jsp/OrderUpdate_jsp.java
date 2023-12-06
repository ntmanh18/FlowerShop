package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dto.AccountDTO;
import dao.FlowerDAO;
import dto.FlowerDTO;
import dto.OrderDTO;
import dto.ordDetailDTO;
import java.util.List;
import dao.OrderDAO;
import controller.IMyConstant;

public final class OrderUpdate_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         <nav class=\"navbar\">\n");
      out.write("            \n");
      out.write("<a class=\"brand\" style=\"font-size: 30px;\" href=\"MainServlet?action=");
      out.print( IMyConstant.ADMINPAGE_DEFAULT);
      out.write("\">Flower Shop <i class='bx bxs-florist'></i></a>\n");
      out.write("  \n");
      out.write("<a href=\"MainServlet?action=");
      out.print(IMyConstant.ORDERMANAGE );
      out.write("\" >Other Orders</a>\n");
      out.write("        </nav>\n");
      out.write("         ");

            AccountDTO user =(AccountDTO) session.getAttribute("Loginrole");
            String ordID = request.getParameter("txtOrd");
            List<ordDetailDTO> list = OrderDAO.orderDetail(ordID);
            
            

        
      out.write("\n");
      out.write("        ");
 OrderDTO order = OrderDAO.getOrderByID(ordID);
         int status = order.getOrdStatus();
             
         String display = " "; 
         if(status == 1){
         display = "Processing";
} else if(status == 2){ 
display ="Shipping";
}else if(status == 3){
display="Cancle";
}else if(status ==4){
display = "completed";
}
   
      out.write("\n");
      out.write("        <h1 style=\"font-size: 50px; text-align: center\">Order ");
      out.print( ordID);
      out.write(" </h1>\n");
      out.write("        <form action=\"MainServlet\">\n");
      out.write("            <input type=\"hidden\" value=\"");
      out.print( ordID);
      out.write("\" name=\"txtOrd\" />\n");
      out.write("            <p>Status: ");
      out.print( display);
      out.write("\n");
      out.write("            <input type=\"radio\"  name=\"status\" value=\"1\">\n");
      out.write("            <label>Processing</label>\n");
      out.write("            <input type=\"radio\"  name=\"status\" value=\"2\">\n");
      out.write("            <label>Shipping</label>\n");
      out.write("            <input type=\"radio\"  name=\"status\" value=\"3\">\n");
      out.write("            <label>Canceled</label>\n");
      out.write("            <input type=\"radio\"  name=\"status\" value=\"4\">\n");
      out.write("            <label>Completed</label>\n");
      out.write("            </p>  \n");
      out.write("            <p>Order Date: <input type=\"date\" value=\"");
      out.print(order.getOrdDate() );
      out.write("\"name=\"ordDate\" readonly=\"\"></p>\n");
      out.write("            <p>Ship Date: <input type=\"date\" value=\"");
      out.print(order.getShipDate() );
      out.write("\"name=\"shipDate\"></p>\n");
      out.write("            <p class=\"button\"><input type=\"submit\" name=\"action\" value=\"Update Order\"></p>\n");
      out.write("        </form>\n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("                \n");
      out.write("                <th>Flower</th>              \n");
      out.write("                <th>Quantity</th>\n");
      out.write("                <th>Price</th>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("            ");
 
                double total =0;
                
            for(ordDetailDTO tmp:list){
                
            
            
      out.write("\n");
      out.write("           \n");
      out.write("          \n");
      out.write("                  \n");
      out.write("                <tr>   \n");
      out.write("                ");
 FlowerDTO flower=FlowerDAO.getFlowerById(String.valueOf(tmp.getFlowID()));  
                    total += (tmp.getPrice() * tmp.getQuantity());
                   
                
                
                
      out.write(" \n");
      out.write("                <td>");
      out.print(flower.getFlowName());
      out.write("</td>  \n");
      out.write("                <td>");
      out.print(tmp.getQuantity());
      out.write("</td>\n");
      out.write("                <td>");
      out.print( tmp.getPrice() * tmp.getQuantity());
      out.write("</td>\n");
      out.write("                \n");
      out.write("                 \n");
      out.write("            </tr>\n");
      out.write("            \n");
      out.write("\n");
      out.write("         ");
}
         
         
         
      out.write("\n");
      out.write("        </table>\n");
      out.write("        <p style=\"background: black;color: whitesmoke;font-weight: bold;font-size: 30px\">Total : ");
      out.print( total );
      out.write("</p>\n");
      out.write("         ");
 if(request.getAttribute("Message") != null){
       
      out.write("\n");
      out.write("       <h1>");
      out.print( request.getAttribute("Message") );
      out.write("</h1>\n");
      out.write("       ");
}
      out.write("\n");
      out.write("        \n");
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
