package controller;

import model.Class;
import model.Student;
import service.ClassService;
import service.ClassServiceImpl;
import service.StudentService;
import service.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = "/students")
public class StudentServlet extends HttpServlet {
    StudentService studentService = new StudentServiceImpl();
    ClassService classService = new ClassServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("act");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "view":
                showView(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Class> classes = classService.findAll();
        request.setAttribute("classes", classes);
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentService.findById(id);
        request.setAttribute("student", student);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("student/view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Class> classes = classService.findAll();
        request.setAttribute("classes", classes);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("student/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("student/list.jsp");
        List<Student> students = studentService.findAll();
        request.setAttribute("ds", students);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("act");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createForm(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                showList(request, response);
        }
    }

    private void createForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        int cID = Integer.parseInt(request.getParameter("cID"));
        Class clazz = classService.findById(cID);
        studentService.add(new Student(0,name,age,clazz));
        response.sendRedirect("/home");
    }
}
