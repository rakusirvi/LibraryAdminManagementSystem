<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="DB.DbConnection" %>
    
    
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>

<%
    String name = (String) session.getAttribute("Admin");
    if (name == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!doctype html>
<html lang="en">
  <head>
  <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Library Admin Dashboard</title>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
      :root {
        --primary: #4f46e5;
        --bg-body: #f9fafb;
        --text-main: #111827;
        --text-muted: #6b7280;
        --border: #e5e7eb;
        --accent-add: #10b981;
        --accent-return: #f59e0b;
        --accent-issue: #3b82f6;
      }

      * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: "Inter", system-ui, -apple-system, sans-serif;
      }

      body {
        background-color: var(--bg-body);
        color: var(--text-main);
        min-height: 100vh;
        /* Normalized font size */
        font-size: 14px; 
      }

      /* Top Navbar - Standard height */
      .navbar {
        height: 64px;
        background: white;
        border-bottom: 1px solid var(--border);
        display: flex;
        align-items: center;
        padding: 0 24px;
        position: sticky;
        top: 0;
        z-index: 50;
      }

      .logo {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 1.25rem;
        font-weight: 700;
        color: var(--primary);
      }

      /* Main Content - Standard max-width */
      .main-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 32px 24px;
      }

      .header {
        margin-bottom: 32px;
      }

      .header h1 {
        font-size: 1.875rem;
        font-weight: 800;
        letter-spacing: -0.025em;
        color: #111827;
      }

      .header p {
        color: var(--text-muted);
        font-size: 1rem;
        margin-top: 4px;
      }

      /* Stats Row - Balanced grid */
      .stats-row {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 20px;
        margin-bottom: 32px;
      }

      .stat-card {
        padding: 24px;
        border-radius: 8px;
        border: 1px solid var(--border);
        background: white;
        box-shadow: 0 1px 2px rgba(0,0,0,0.05);
      }

      .stat-card h3 {
        font-size: 0.875rem;
        color: var(--text-muted);
        text-transform: uppercase;
        letter-spacing: 0.05em;
        margin-bottom: 8px;
      }

      .stat-card .value {
        font-size: 2rem;
        font-weight: 700;
        color: var(--primary);
      }

      /* Action List - Modern card grid */
      .action-list {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
        gap: 16px;
        margin-bottom: 48px;
      }

      .action-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 18px;
        border: 1px solid var(--border);
        border-radius: 8px;
        cursor: pointer;
        transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        background: white;
      }

      .action-item:hover {
        background: #fdfdfd;
        transform: translateY(-2px);
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        border-color: var(--primary);
      }

      .action-info {
        display: flex;
        align-items: center;
        gap: 16px;
      }

      .icon-box {
        width: 44px;
        height: 44px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 8px;
      }

      .add-btn .icon-box { color: var(--accent-add); background: #ecfdf5; }
      .return-btn .icon-box { color: var(--accent-return); background: #fffbeb; }
      .issue-btn .icon-box { color: var(--accent-issue); background: #eff6ff; }

      .action-text h4 {
        font-size: 1rem;
        font-weight: 600;
      }
      .action-text p {
        font-size: 0.875rem;
        color: var(--text-muted);
      }

      .chevron {
        color: #9ca3af;
      }

      /* Recent Borrowed Books Section */
      .recent-section {
        margin-top: 40px;
      }

      .recent-section h2 {
        font-size: 1.25rem;
        font-weight: 700;
        margin-bottom: 20px;
        color: #111827;
      }

      .table-wrapper {
        width: 100%;
        overflow-x: auto;
        border: 1px solid var(--border);
        border-radius: 8px;
        background: white;
        box-shadow: 0 1px 2px rgba(0,0,0,0.05);
      }

      table {
        width: 100%;
        border-collapse: collapse;
        text-align: left;
        min-width: 700px;
      }

      th {
        background: #f9fafb;
        padding: 12px 20px;
        font-size: 0.75rem;
        font-weight: 600;
        color: var(--text-muted);
        text-transform: uppercase;
        letter-spacing: 0.05em;
        border-bottom: 1px solid var(--border);
      }

      td {
        padding: 14px 20px;
        font-size: 0.9rem;
        border-bottom: 1px solid var(--border);
        color: #374151;
      }

      tr:last-child td {
        border-bottom: none;
      }

      tr:hover td {
        background-color: #f9fafb;
      }

      .book-title {
        font-weight: 600;
        color: var(--text-main);
      }

      @media (max-width: 768px) {
        .main-container {
          padding: 20px 16px;
        }
        .header h1 { font-size: 1.5rem; }
        .stats-row { grid-template-columns: 1fr; }
      }
    </style>
  </head>
  <body>
    <nav class="navbar">
      <div class="logo">
        <i data-lucide="library" size="24"></i>
        <span>Library Admin Portal</span>
      </div>
    </nav>

    <div class="main-container">
      <header class="header">
        <h1>Dashboard Overview</h1>
        <p>Comprehensive statistics and quick access to management tools.</p>
      </header>

      <section class="stats-row">
        <div class="stat-card">
          <h3>Total Books in Collection</h3>
          <div class="value"><%=request.getAttribute("totalBooks")%> </div>
        </div>
        <div class="stat-card">
          <h3>Currently Issued</h3>
          <div class="value"><%=request.getAttribute("totalIssuedBooks")%></div>
        </div>
      </section>

      <section class="action-list">
        <div class="action-item add-btn" onclick="location.href='addBook.jsp' " style="border-left: 4px solid var(--accent-add);">
          <div class="action-info">
            <div class="icon-box"><i data-lucide="plus" size="20"></i></div>
            <div class="action-text">
              <h4>Add New Book</h4>
              <p>Register new titles</p>
            </div>
          </div>
          <i data-lucide="chevron-right" class="chevron" size="18"></i>
        </div>
       
        <div class="action-item issue-btn" onclick="location.href='addStudent.jsp'" style="border-left: 4px solid var(--accent-add);">
          <div class="action-info">
            <div class="icon-box" style="color: var(--primary); background: #eef2ff;">
              <i data-lucide="user-plus" size="20"></i>
            </div>
            <div class="action-text">
              <h4>Register Student</h4>
              <p>Add new library member</p>
            </div>
          </div>
          <i data-lucide="chevron-right" class="chevron" size="18"></i>
        </div>

        <div class="action-item return-btn" onclick="location.href='returnBook.jsp'" style="border-left: 4px solid var(--accent-add);">
          <div class="action-info">
            <div class="icon-box">
              <i data-lucide="rotate-ccw" size="20"></i>
            </div>
            <div class="action-text">
              <h4>Return Process</h4>
              <p>Check-in materials</p>
            </div>
          </div>
          <i data-lucide="chevron-right" class="chevron" size="18"></i>
        </div>

        <div class="action-item issue-btn" onclick="location.href='issueBook.jsp'" style="border-left: 4px solid var(--accent-add);">
          <div class="action-info">
            <div class="icon-box"><i data-lucide="book-up" size="20"></i></div>
            <div class="action-text">
              <h4>Issue Book</h4>
              <p>Lend to members</p>
            </div>
          </div>
          <i data-lucide="chevron-right" class="chevron" size="18"></i>
        </div>

        
      </section>

      <section class="recent-section">
        <h2>Recent Issued Activities</h2>
        <div class="table-wrapper">
          <table>
            <thead>
              <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Issue Date</th>
                <th>Student Name</th>
                <th>Student ID</th>
              </tr>
            </thead>
            <tbody>
            <% 
            try(Connection con = DbConnection.getConnection()){
    		    PreparedStatement ps2 = con.prepareStatement(
    				"Select i.bookid, b.title, s.name, i.issuedate, i.rollno FROM issuedbooks i JOIN books b ON i.bookid = b.bookid JOIN student s ON i.rollno = s.rollno WHERE i.status = 'Issued' ORDER by i.issueid DESC LIMIT 10"
    			);
    		    ResultSet rs2 = ps2.executeQuery();
            
                while(rs2.next()){%>
              <tr>
                <td class="book-title"><%= rs2.getInt("bookid") %></td>
				<td><%= rs2.getString("title") %></td>
				<td><%= rs2.getDate("issuedate") %></td>
				<td><%= rs2.getString("name") %></td>
				<td><%= rs2.getString("rollno") %></td>
              </tr>
              <%} 
            } catch(Exception e) {
                System.out.println("Error loading : " + e.getMessage() );
            }
            %>
            </tbody>
          </table>
        </div>
      </section>
    </div>

    <script>
      lucide.createIcons();
    </script>
  </body>
</html>