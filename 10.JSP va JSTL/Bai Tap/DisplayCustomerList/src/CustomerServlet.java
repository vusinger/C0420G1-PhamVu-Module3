import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/listCustomer")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Nguyen Mai Nhi","1993-08-20","Da Nang","../frontend/images/19620200_617828381720681_4843501145941964931_o.jpg"));
        customerList.add(new Customer("Hoang Thi Tu Trinh","1995-07-18","TP HCM","../frontend/images/74336510_3130545606962637_1897410568759803904_n.jpg"));
        customerList.add(new Customer("Tran Thi Trang","1998-09-22","Vung Tau","../frontend/images/82099911_1083276065340200_1043580669566910464_n.jpg"));
        customerList.add(new Customer("Mai Thi Quynh","1993-08-20","Quy Nhon","../frontend/images/107885500_1675363279283207_6379132642022552522_n.jpg"));
        request.setAttribute("mylist",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/result.jsp");
        requestDispatcher.forward(request,response);
    }
}