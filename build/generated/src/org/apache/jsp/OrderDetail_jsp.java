package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dto.OrderDTO;
import controller.IMyConstant;
import dao.FlowerDAO;
import dto.FlowerDTO;
import dao.OrderDAO;
import java.util.List;
import dto.ordDetailDTO;
import dto.AccountDTO;

public final class OrderDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <body style=\"background: #f7e1e1\">\n");
      out.write("        <nav class=\"navbar\">\n");
      out.write("            \n");
      out.write("<a class=\"brand\" style=\"font-size: 30px;\" href=\"MainServlet?action=");
      out.print( IMyConstant.USERPAGE_DEFAULT);
      out.write("\">Flower Shop <i class='bx bxs-florist'></i></a>\n");
      out.write("  \n");
      out.write("<a href=\"MainServlet?action=");
      out.print(IMyConstant.ORDERINFOR);
      out.write("\" >Other Orders</a>\n");
      out.write("        </nav>\n");
      out.write("        \n");
      out.write("         \n");
      out.write("       \n");
      out.write("        ");

            AccountDTO user =(AccountDTO) session.getAttribute("Loginrole");
            String ordID = request.getParameter("txtOrdID");
            List<ordDetailDTO> list = OrderDAO.orderDetail(ordID);
            
            

        
      out.write("\n");
      out.write("         ");
 OrderDTO order = OrderDAO.getOrderByID(ordID);
         int status = order.getOrdID();
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
      out.write("   \n");
      out.write("   <h1 style=\"font-size: 50px; text-align: center\">Order ");
      out.print( ordID );
      out.write(" </h1>\n");
      out.write("   <hr style=\"width: 90%; margin-bottom: 30px\">\n");
      out.write("         <div class=\"Order\">\n");
      out.write("             \n");
      out.write("             <p style=\"font-weight: bold; display: inline-block\">Status:</p><p style=\"display: inline-block\"> ");
      out.print( display );
      out.write("</p> <br>\n");
      out.write("             <p style=\"font-weight: bold;display: inline-block\">Order date:</p><p style=\"display: inline-block\"> ");
      out.print(order.getOrdDate() );
      out.write("</p> <br>\n");
      out.write("        <p style=\"font-weight: bold;display: inline-block\">Ship date  :</p><p style=\"display: inline-block\"> ");
      out.print( order.getShipDate() );
      out.write(" </p>\n");
      out.write("        \n");
      out.write("       ");
 if(status == 1){ 
      out.write("\n");
      out.write("                               <form action=\"MainServlet\">\n");
      out.write("                                    <input type=\"hidden\" value=\"");
      out.print( ordID );
      out.write("\" name=\"txtOrdID\">\n");
      out.write("                        <input type=\"submit\" value=\"Delete\" name=\"action\">\n");
      out.write("                               </form>\n");
      out.write("                    \n");
      out.write("                  ");
 } 
      out.write(" \n");
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
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
      out.write("         </nav>\n");
      out.write("         <p style=\"background: black;color: whitesmoke;font-weight: bold;font-size: 30px\">Total : ");
      out.print( total );
      out.write("</p>\n");
      out.write("        \n");
      out.write("          \n");
      out.write("                     \n");
      out.write("                  <style>\n");
      out.write(" .navbar {\n");
      out.write("    background-color: black;\n");
      out.write(" \n");
      out.write("    display: flex;\n");
      out.write("    justify-content: space-between;\n");
      out.write("    align-items:center;\n");
      out.write("    padding: 30px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".navbar a {\n");
      out.write("    color: pink;\n");
      out.write("    font-weight: bolder;\n");
      out.write("    font-size: 30px;\n");
      out.write("    \n");
      out.write("}\n");
      out.write("\n");
      out.write(".navbar .brand {\n");
      out.write("    display: block;\n");
      out.write("    color: pink;\n");
      out.write("    padding: 0 24px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(".navbar a:hover,\n");
      out.write(".navbar a:focus {\n");
      out.write("    color: white;\n");
      out.write("    transition: ease-in-out 0.5s;\n");
      out.write("}\n");
      out.write(".Order{\n");
      out.write("    width: 700px;\n");
      out.write("    border: solid;\n");
      out.write("    margin: 0 auto;\n");
      out.write("   \n");
      out.write("}\n");
      out.write("\n");
      out.write(".Order p{\n");
      out.write("   padding: 5px 40px;\n");
      out.write("}\n");
      out.write("table{\n");
      out.write("    margin : 30px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("table tr th{\n");
      out.write("    align-content: center;\n");
      out.write("    width: 100px;    \n");
      out.write("    height: 40px;\n");
      out.write("    font-size: 20px;\n");
      out.write("    border-bottom: 1px;\n");
      out.write("\n");
      out.write("  \n");
      out.write("}\n");
      out.write("table tr td{\n");
      out.write("    text-align: center;\n");
      out.write("    align-content: center;\n");
      out.write("    height: 70px;\n");
      out.write("    fon-size: 15px;\n");
      out.write("    \n");
      out.write("   \n");
      out.write("}\n");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write(".button{\n");
      out.write("    background-color: black;\n");
      out.write("    color: pink;\n");
      out.write("    padding: 20px 20px;\n");
      out.write("   \n");
      out.write("    \n");
      out.write("    text-align: center;\n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("}\n");
      out.write(".button:hover{\n");
      out.write("    background-color: pink;\n");
      out.write("    color: black;\n");
      out.write("    transition: .5s;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("       \n");
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
