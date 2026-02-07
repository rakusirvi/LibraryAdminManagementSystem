

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.DbConnection;

/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int totalBooks = 0;
			int totalIssuedBooks = 0;
			 
			
			try(Connection con = DbConnection.getConnection() ){
				
				PreparedStatement ps = con.prepareStatement("Select SUM(quantity) from books");
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					totalBooks = rs.getInt(1);
				}
				
				PreparedStatement ps1 = con.prepareStatement("Select Count(*) from issuedbooks where status='Issued'");
				ResultSet rs1 = ps1.executeQuery();
				if(rs1.next()){
					totalIssuedBooks = rs1.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("totalBooks", totalBooks);
			request.setAttribute("totalIssuedBooks", totalIssuedBooks);
			RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
			rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
