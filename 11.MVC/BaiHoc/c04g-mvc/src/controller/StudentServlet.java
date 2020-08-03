package controller;

import bo.StudentBO;
import bo.StudentBOImpl;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = "/studentServletPath")
public class StudentServlet extends HttpServlet {

    private StudentBO studentBO = new StudentBOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Student> studentList = new ArrayList<>();
//        studentList.add(new Student(1, "Tien", "2000", 7));
//        studentList.add(new Student(2, "Tien Quoc", "2005", 4));
//        studentList.add(new Student(3, "Thinh", "2005", 9));

        List<Student> studentList = this.studentBO.findAll();

        request.setAttribute("studentListServlet", studentList);

        String inputUser = "<p style='color: red'>abc</p>";

        request.setAttribute("inputUser", inputUser);

        request.getRequestDispatcher("list.jsp").forward(request, response);
//        response.sendRedirect("list.jsp");
    }

}
