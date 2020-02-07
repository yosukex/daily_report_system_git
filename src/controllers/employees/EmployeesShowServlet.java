package controllers.employees;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Employee;
import utils.DBUtil;

/**
 * Servlet implementation class ShowServlet
 */
@WebServlet("/show")
public class EmployeesShowServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeesShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

        /**
         * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
         */
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            EntityManager em = DBUtil.createEntityManager();

            // 該当のIDのメッセージ1件のみをデータベースから取得、Integer.parseIntでint型に
            Employee e = em.find(Employee.class, Integer.parseInt(request.getParameter("id")));

            em.close();

            // メッセージデータをリクエストスコープにセットしてshow.jspを呼び出す
            request.setAttribute("employee", e);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/employees/show.jsp");
            rd.forward(request, response);
        }
}