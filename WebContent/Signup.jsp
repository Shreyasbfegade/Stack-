<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Share Market Login</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
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
  

  <!-- Signup Form -->
  <div id="signupForm" class="container ">
    <div class="card">
      <div class="card-header">
        <h3>Sign Up</h3>
      </div>
      <div class="card-body">
        <form action="signUp" method="get"> <!-- Changed method to POST -->
		  <div class="form-group">
		    <label for="fullName">Full Name</label>
		    <input type="text" class="form-control" id="fullName" name="uname" placeholder="Enter your full name">
		  </div>
		  <div class="form-group">
		    <label for="signupEmail">Email address</label>
		    <input type="email" class="form-control" id="signupEmail" name="uemail" placeholder="Enter email">
		  </div>
		  <div class="form-group">
		    <label for="signupPassword">Password</label>
		    <input type="password" class="form-control" id="signupPassword" name="upwd" placeholder="Password">
		  </div>
		  <div class="form-group">
		    <label for="gender">Gender</label>
		    <select class="form-control" id="gender" name="ugender">
		      <option value="male">Male</option>
		      <option value="female">Female</option>
		      <option value="other">Other</option>
		    </select>
		  </div>
		  <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
		</form>

      </div>
    </div>
  </div>

</body>
</html>