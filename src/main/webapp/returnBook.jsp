<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Library Admin | Issue Book</title>
    <script src="https://unpkg.com/lucide@latest"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <style>
      :root {
        --primary: #4f46e5;
        --primary-hover: #4338ca;
        --text-main: #1f2937;
        --text-muted: #64748b;
        --border: #e2e8f0;
        --bg-card: #ffffff;
        --bg-page: #f8fafc;
      }

      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: "Inter", sans-serif;
      }

      body {
        background-color: var(--bg-page);
        color: var(--text-main);
        min-height: 100vh;
      }

      /* Navbar */
      .navbar {
        height: 60px;
        background: white;
        border-bottom: 1px solid var(--border);
        display: flex;
        align-items: center;
        padding: 0 24px;
      }

      .logo {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 1.15rem;
        font-weight: 700;
        color: var(--text-main);
      }

      /* Container */
      .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 32px 20px;
      }

      .goback {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        color: var(--text-muted);
        font-size: 0.875rem;
        text-decoration: none;
        cursor: pointer;
        margin-bottom: 24px;
      }

      .header-area {
        margin-bottom: 24px;
      }

      .header-area h2 {
        font-size: 1.5rem;
        font-weight: 700;
        margin-bottom: 4px;
      }

      .header-area p {
        color: var(--text-muted);
        font-size: 0.9rem;
      }

      /* Form Card */
      .card {
        background: var(--bg-card);
        padding: 24px;
        border-radius: 12px;
        border: 1px solid var(--border);
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
      }

      .form-group {
        margin-bottom: 16px;
      }

      label {
        display: block;
        font-size: 0.875rem;
        font-weight: 600;
        margin-bottom: 6px;
      }

      input {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid var(--border);
        border-radius: 6px;
        font-size: 0.95rem;
        outline: none;
      }

      input:focus {
        border-color: var(--primary);
      }

      .submit-btn {
        width: 100%;
        background-color: var(--primary);
        color: white;
        padding: 12px;
        border: none;
        border-radius: 6px;
        font-size: 0.95rem;
        font-weight: 600;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 8px;
        margin-top: 8px;
      }

      .submit-btn:hover {
        background-color: var(--primary-hover);
      }

      /* Table Section */
      .table-section h3 {
        font-size: 1.1rem;
        font-weight: 700;
        margin-bottom: 16px;
      }

      .table-wrapper {
        background: white;
        border: 1px solid var(--border);
        border-radius: 8px;
        overflow-x: auto;
      }

      table {
        width: 100%;
        border-collapse: collapse;
        text-align: left;
        min-width: 500px;
      }

      th {
        background: #f9fafb;
        padding: 12px 16px;
        font-size: 0.75rem;
        font-weight: 600;
        color: var(--text-muted);
        text-transform: uppercase;
        border-bottom: 1px solid var(--border);
      }

      td {
        padding: 12px 16px;
        font-size: 0.875rem;
        border-bottom: 1px solid var(--border);
      }

      tr:last-child td {
        border-bottom: none;
      }

      .badge {
        font-weight: 600;
        color: var(--primary);
      }

      @media (max-width: 640px) {
        .container {
          padding: 16px;
        }
        
     .error{
      text-align:center;
     margin-top:4px ;
     }
     }
    </style>
  </head>
  <body>
    <nav class="navbar">
      <div class="logo">
        <i data-lucide="library"></i>
        <span>LibraryAdmin</span>
      </div>
    </nav>

    <div class="container">
      <div class="goback" onclick="window.history.back()">
        <i data-lucide="chevron-left" size="18"></i>
        <span>Go Back</span>
      </div>

      <div class="header-area">
        <h2>Return Book From Student</h2>
        <p>Enter details below to Submission of the Book.</p>
      </div>

      <main class="card">
        <form action="ReturnBookServlet" method="post">
          <div class="form-group">
            <label for="rollNo">Student Roll No</label>
            <input
              type="text"
              name="rollno"
              id="rollNo"
              placeholder="e.g. T.24.99"
              required
            />
          </div>

          <div class="form-group">
            <label for="bookId">Book ID</label>
            <input
              type="number"
              name="bookId"
              id="bookId"
              placeholder="101"
              required
            />
          </div>

          <button type="submit" class="submit-btn">
            <i data-lucide="book-check" size="18"></i>
            Return Book
          </button>
        </form>
        <div class="error">

<%=request.getAttribute("error")%>


</div>
      </main>
    </div>

    <script>
      lucide.createIcons();
    </script>
  </body>
</html>
