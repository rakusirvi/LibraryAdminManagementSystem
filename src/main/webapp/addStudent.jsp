<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Library Admin | Add Book</title>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
      :root {
        --primary: #4f46e5;
        --primary-hover: #4338ca;
        --text: #1f2937;
        --light-text: #64748b;
        --border: #e2e8f0;
        --bg: #ffffff;
        --body-bg: #f8fafc;
      }

      * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family:
          "Inter",
          system-ui,
          -apple-system,
          sans-serif;
      }

      body {
        background-color: var(--body-bg);
        color: var(--text);
        min-height: 100vh;
      }

      /* Navbar */
      .navbar {
        height: 64px;
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
        font-size: 1.125rem;
        font-weight: 600;
      }

      /* Main Layout Container */
      .container {
        max-width: 600px;
        margin: 0 auto;
        padding: 40px 20px;
      }

      /* Header Section */
      .header-area {
        margin-bottom: 32px;
      }

      .header-area h2 {
        font-size: 1.875rem;
        font-weight: 800;
        color: #0f172a;
        margin-bottom: 4px;
      }

      .header-area p {
        color: var(--light-text);
        font-size: 1rem;
      }

      /* Action Bar (Go Back) */
      .action-bar {
        margin-bottom: 24px;
      }

      .goback {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        color: var(--light-text);
        font-size: 0.875rem;
        font-weight: 500;
        text-decoration: none;
        cursor: pointer;
        transition: color 0.2s;
      }

      .goback:hover {
        color: var(--primary);
      }

      .card {
        background: var(--bg);
        padding: 32px;
        border-radius: 12px;
        border: 1px solid var(--border);
        box-shadow:
          0 4px 6px -1px rgba(0, 0, 0, 0.05),
          0 2px 4px -2px rgba(0, 0, 0, 0.05);
      }

      .form-group {
        margin-bottom: 20px;
      }

      .form-group:last-of-type {
        margin-bottom: 28px;
      }

      label {
        display: block;
        font-size: 0.875rem;
        font-weight: 600;
        margin-bottom: 8px;
        color: #334155;
      }

      input {
        width: 100%;
        padding: 12px 14px;
        border: 1.5px solid var(--border);
        border-radius: 8px;
        font-size: 1rem;
        outline: none;
        transition: all 0.2s;
        background-color: #fff;
      }

      input::placeholder {
        color: #94a3b8;
      }

      input:focus {
        border-color: var(--primary);
        box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
      }

      .submit-btn {
        width: 100%;
        background-color: var(--primary);
        color: white;
        padding: 14px;
        border: none;
        border-radius: 8px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition:
          background-color 0.2s,
          transform 0.1s;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 8px;
      }

      .submit-btn:hover {
        background-color: var(--primary-hover);
      }

      .submit-btn:active {
        transform: scale(0.99);
      }

      @media (max-width: 480px) {
        .card {
          padding: 24px;
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
      <div class="action-bar">
        <div class="goback" onclick="window.history.back()">
          <i data-lucide="chevron-left" size="18"></i>
          <span>Go Back</span>
        </div>
      </div>

      <div class="header-area">
        <h2>Add Student</h2>
        <p>Registered Student Can Access Books From Library</p>
      </div>

      <main class="card">
        <form action="addStudentServlet" method="post">
          <div class="form-group">
            <label for="title">Student Name</label>
            <input
              type="text"
              name="name"
              id="title"
              placeholder="Rakesh Choudhary"
              required
            />
          </div>

          <div class="form-group">
            <label for="author">Roll No</label>
            <input
              type="text"
              name="rollno"
              id="author"
              placeholder="e.g : T.24.99"
              required
            />
          </div>

          <div class="form-group">
            <label for="quantity">Class</label>
            <input
              type="text"
              name="class"
              id="quantity"
              placeholder="e.g : SYIT"
              required
            />
          </div>

          <button type="submit" class="submit-btn">
            <i data-lucide="plus" size="18"></i>
            Register Student
          </button>
        </form>
      </main>
    </div>
    <script>
      lucide.createIcons();
    </script>
  </body>
</html>
    