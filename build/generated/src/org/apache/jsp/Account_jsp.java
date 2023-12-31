package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.List;
import dto.AccountDTO;
import dto.AccountDTO;
import dao.UserDAO;

public final class Account_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Account Manage</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

           ArrayList<AccountDTO> userList=UserDAO.getAllAccount();
           if(userList == null){
        
      out.write("\n");
      out.write("        <table>\n");
      out.write("        \n");
      out.write("            <tr>\n");
      out.write("                <th>ID</th>\n");
      out.write("                <th>Role</th>\n");
      out.write("                <th>Email</th>\n");
      out.write("                <th>Name</th>\n");
      out.write("                <th>Address</th>\n");
      out.write("                <th>Phone</th>\n");
      out.write("                <th>Status</th>\n");
      out.write("                <th>Action</th>\n");
      out.write("            </tr>\n");
      out.write("            ");
 for(AccountDTO user:userList){ 
      out.write("\n");
      out.write("            \n");
      out.write("            <tr>\n");
      out.write("                 <form action=\"MainServlet\">\n");
      out.write("                 <input type=\"hidden\" name=\"txtid\" value=\"");
      out.print(user.getAccID() );
      out.write("\">\n");
      out.write("                <th>");
      out.print(user.getAccID());
      out.write("</th>\n");
      out.write("               \n");
      out.write("                ");
 if(user.getRole() == 0) {
      out.write("\n");
      out.write("               <th>Admin</th>");
}else{
      out.write("\n");
      out.write("               <th>User</th>");
}
      out.write("\n");
      out.write("                \n");
      out.write("                <th>");
      out.print(user.getEmail());
      out.write("</th>\n");
      out.write("                <th>");
      out.print(user.getFullname());
      out.write("</th>\n");
      out.write("                <th>");
      out.print(user.getPhone());
      out.write("</th>\n");
      out.write("                 ");
 if(user.getStatus()== 0) {
      out.write("\n");
      out.write("               <th>Blocked</th>");
}else{
      out.write("\n");
      out.write("               <th>Active</th>");
}
      out.write("\n");
      out.write("               <th><input type=\"submit\" name=\"action\" value=\"Disable Account\"/></th>\n");
      out.write("                </form>\n");
      out.write("            </tr>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("                 \n");
      out.write("        </table>\n");
      out.write("        ");
}else{
      out.write("\n");
      out.write("        <h1>There is no user</h1>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("        \n");
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
