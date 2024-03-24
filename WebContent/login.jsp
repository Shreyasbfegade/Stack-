<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Share Market Login</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
    
      background-size: cover;
      background-repeat: no-repeat;
      /* Add fallback background color */
      background-color: #f8f9fa;
    }
    .container {
      max-width: 400px;
      margin-top: 100px;
    }
    .card {
      border: 2px solid #000;
      border-radius: 10px;
      box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
    }
    .card-header {
      background-color: #007bff;
      color: #fff;
      text-align: center;
      border-radius: 10px 10px 0 0;
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="card">
      <div class="card-header">
        <h3>Welcome to Share Market</h3>
      </div>
      <div class="card-body">
        <form action="login" method="get"> <!-- Replace "loginServlet" with the appropriate servlet URL -->
          <div class="form-group">
            <label for="email">Email address</label>
            <input type="email" class="form-control" id="email" name="uemail" placeholder="Enter email">
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="upwd" placeholder="Password">
          </div>
          <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
        <div class="text-center mt-3">
          <p>Don't have an account? <a href="Signup.jsp" id="signupLink">Sign Up</a></p>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
