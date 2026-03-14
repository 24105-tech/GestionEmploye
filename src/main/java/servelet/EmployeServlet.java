package servelet;



import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import dao.EmployeDAO;
import model.Employe;

@WebServlet("/EmployeServlet")
public class EmployeServlet extends HttpServlet {

    private EmployeDAO employeDAO;

    public void init() {
        employeDAO = new EmployeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {

            if (action == null) {
                listEmployes(request, response);
            } else if (action.equals("delete")) {
                deleteEmploye(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String poste = request.getParameter("poste");
        double salaire = Double.parseDouble(request.getParameter("salaire"));

        Employe emp = new Employe(nom, prenom, poste, salaire);

        try {
            employeDAO.insertEmploye(emp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("EmployeServlet");
    }

    private void listEmployes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Employe> list = employeDAO.selectAllEmployes();

        request.setAttribute("listeEmployes", list);

        RequestDispatcher dispatcher = request.getRequestDispatcher("employe-list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteEmploye(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        employeDAO.deleteEmploye(id);

        response.sendRedirect("EmployeServlet");
    }
}

