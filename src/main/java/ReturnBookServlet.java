

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
 * Servlet implementation class ReturnBookServlet
 */
@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBookServlet() {
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
		
		String student = request.getParameter("rollno");
		int bookid = Integer.parseInt(request.getParameter("bookId"));
		String error;
		
		try(Connection con =DbConnection.getConnection()){
			
			PreparedStatement ps = con.prepareStatement("select * from issuedbooks where rollno=? and status='Issued' and bookid=?");
			ps.setString(1, student);
			ps.setInt(2,bookid);
			
			ResultSet rs= ps.executeQuery();
			
			if(rs.next()) {
				PreparedStatement ps1 = con.prepareStatement("UPDATE issuedbooks SET status='Returned' WHERE rollno=? AND status='Issued' AND bookid=?;" );
				ps1.setString(1, student);
				ps1.setInt(2,bookid);
				int rs1= ps1.executeUpdate();
				
				
				PreparedStatement ps2 = con.prepareStatement("UPDATE books SET quantity=quantity+1 WHERE  bookid=?;" );
				ps2.setInt(1, bookid);
				
				
				int rs2= ps2.executeUpdate();
				
				
				if(rs1 > 0) {
					
				response.sendRedirect("DashboardServlet");
				}
				
			}else {
			    request.setAttribute("error", "Book not issued or already returned");
			    request.getRequestDispatcher("returnBook.jsp").forward(request, response);
			}

			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
