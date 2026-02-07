

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DB.DbConnection;

/**
 * Servlet implementation class addStudentServlet
 */
@WebServlet("/addStudentServlet")
public class addStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public addStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String rollno = request.getParameter("rollno");
		String Class = request.getParameter("class");
		String message = "";
		
		try(Connection con = DbConnection.getConnection()){
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO student (  rollno,name , class) VALUES  (?,?,?)"
					);
			ps.setString(1, rollno);
			ps.setString(2, name);
			ps.setString(3, Class);
			
			int count = ps.executeUpdate();
			
			if(count > 0) {
				message= "Student Added SucessFully";
			}
			
			request.setAttribute("count",count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("DashboardServlet");
		return;

		
		
	}

}
