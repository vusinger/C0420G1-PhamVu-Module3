import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SumServlet", urlPatterns = "/sumServletPath")
public class SumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String a = request.getParameter("num1");
//        String b = request.getParameter("num2");
//        double result = Double.parseDouble(a) + Double.parseDouble(b);
//
//        PrintWriter out = response.getWriter();
//        out.write("<html><body>");
//        out.write("<p style='color: green'>" + result + "</p>");
//        out.write("</body></html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("num1");
        String b = request.getParameter("num2");
        double result = Double.parseDouble(a) + Double.parseDouble(b);

//        PrintWriter out = response.getWriter();
//        out.write("<html><body>");
//        out.write("<p style='color: red'>" + result + "</p>");
//        out.write("</body></html>");
        request.setAttribute("resultServlet", result);
        request.getRequestDispatcher("final.jsp").forward(request, response);
//        response.sendRedirect("final.jsp");
    }
}
