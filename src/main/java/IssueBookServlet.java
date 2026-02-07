

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.DbConnection;

/**
 * Servlet implementation class IssueBookServlet
 */
@WebServlet("/IssueBookServlet")
public class IssueBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IssueBookServlet() {
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
		int id =Integer.parseInt(request.getParameter("bookid"));
		String rollno = request.getParameter("rollno");
		String message ;
		
		try(Connection con = DbConnection.getConnection();){
			
			PreparedStatement ps = con.prepareStatement(
				    "SELECT quantity FROM books WHERE quantity > 0 AND bookid=?"
				);
				ps.setInt(1, id);

				ResultSet rs = ps.executeQuery();

			if(rs.next()){
				
				PreparedStatement ps1= con.prepareStatement("INSERT INTO issuedbooks (bookid, rollno, issuedate, status) VALUES(? ,?,?,?)");
				ps1.setInt(1,id);
				ps1.setString(2, rollno);
				ps1.setDate(3,  new Date(System.currentTimeMillis()));
				ps1.setString(4, "Issued");
				int count = ps1.executeUpdate();
				
				if(count > 0) {
					
					PreparedStatement ps2= con.prepareStatement("UPDATE books SET quantity = quantity - 1 where bookid=?");
					ps2.setInt(1, id);
					
					int count2 = ps2.executeUpdate();
					response.sendRedirect("DashboardServlet");
				
				}else {
					response.sendRedirect("issueBook.jsp?error=student");
				}
				
		
			
			}else {
				response.sendRedirect("issueBook.jsp?error=books");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}


}
