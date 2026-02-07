

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
 * Servlet implementation class addBookServlet
 */
@WebServlet("/addBookServlet")
public class addBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String name = request.getParameter("author");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String message = "";
		String Insert = "" ;
		
		
		try(Connection con = DbConnection.getConnection()){
			String Query = "Insert into books(title,author,quantity) values (?,?,?)";
			PreparedStatement ps = con.prepareStatement(Query);
			ps.setString(1, title);
			ps.setString(2, name);
			ps.setInt(3, quantity);
			
			int rows = ps.executeUpdate();
			if(rows > 0) {
				Insert = "true";
				
			}else {
				Insert = "false";
				message = "Error while Adding Book";
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 message = "Database error: " + e.getMessage();
		}
		
		request.setAttribute("message", message);
		request.setAttribute("Insert", Insert);
		
		request.getRequestDispatcher("DashboardServlet").forward(request, response);
		
		
	
	}

}
