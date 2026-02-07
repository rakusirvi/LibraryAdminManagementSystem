<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login</title>
    <script
      type="module"
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>

    <style>
      :root {
        --primary: #1245b4;
        --text-main: #111827;
        --text-muted: #6b7280;
        --border: #e5e7eb;
      }

      * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: "Inter", Arial, sans-serif;
      }

      body.mainContainer {
        display: flex;
        flex-direction: row;
        min-height: 100vh;
        background-color: #ffffff;
      }

      .partition {
        flex: 1;
        height: 100vh;
      }

      .photoSection {
        background-image: url(bg.png);
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        /* Fallback background if image is missing */
        background-color: #f3f4f6;
        border-radius: 0px 20px 20px 0px;
      }

      .loginform {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 40px;
      }

      .form-tag {
        display: flex;
        flex-direction: column;
        gap: 24px;
        width: 100%;
        max-width: 400px;
      }

      .icon-body {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 8px;
      }

      .icons {
        background-image: url(login.png);
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        height: 64px;
        width: 64px;
      }

      .title {
        text-align: center;
      }

      .hedding {
        color: var(--primary);
        font-size: 1.875rem;
        font-weight: 700;
        margin-bottom: 8px;
      }

      .title p {
        font-size: 1rem;
        color: var(--text-muted);
      }

      .form {
        display: flex;
        flex-direction: column;
        gap: 8px;
      }

      label {
        font-size: 0.875rem;
        font-weight: 600;
        color: var(--text-main);
      }

      .form input {
        width: 100%;
        height: 44px;
        border-radius: 8px;
        border: 1px solid var(--border);
        padding: 12px;
        font-size: 1rem;
        transition: border-color 0.2s;
      }

      .form input:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(18, 69, 180, 0.1);
      }

      input::placeholder {
        font-size: 0.875rem;
        color: #9ca3af;
      }

      .pributton {
        width: 100%;
        padding: 12px;
        font-size: 1rem;
        font-weight: 600;
        border-radius: 8px;
        border: none;
        background: var(--primary);
        color: white;
        margin-top: 8px;
        cursor: pointer;
        transition: transform 0.1s, background-color 0.2s;
      }

      .pributton:hover {
        background-color: #0e378f;
      }

      .pributton:active {
        transform: scale(0.98);
      }

      .error {
        color: #dc2626;
        font-size: 0.875rem;
        font-weight: 500;
        text-align: center;
        background-color: #fef2f2;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid #fee2e2;
      }

      /* Responsive adjustment */
      @media (max-width: 768px) {
        .photoSection {
          display: none;
        }
        .loginform {
          width: 100%;
        }
      }
    </style>
  </head>`
  <body class="mainContainer">
    <div class="partition photoSection"></div>
    <div class="partition loginform">
      <form action="LoginServlet" method="post" class="form-tag">
        <div class="icon-body">
          <div class="icons"></div>
        </div>
        <div class="title">
          <h1 class="hedding">Admin Login</h1>
          <p>Access your library management dashboard</p>
        </div>
        
        <div class="form">
          <label for="name">User Name</label>
          <input type="text" id="name" placeholder="Enter your username" name="username" required />
        </div>
        
        <div class="form">
          <label for="pass">Password</label>
          <input type="password" id="pass" placeholder="Enter your password" name="password" required />
        </div>

        <input class="pributton" type="submit"  value="Sign in to Dashboard" />
        
        <% 
          String error = (String) request.getAttribute("LoginError");
          if(error != null) {
        %>
          <p class="error"><%=error %></p>
        <% 
          } 
        %>
      </form>
    </div>
  </body>
</html>