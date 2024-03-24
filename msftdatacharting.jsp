<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock Market</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .card {
            /* Set a fixed height for the card */
            height: 400px; /* Adjust as needed */
        }

        .card-body {
            /* Set a fixed height for the card body */
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .navbar-brand img {
        width: 50px;
        height: auto;
        background-color: #000000;  /* Maintain aspect ratio */
        }


        iframe {
            /* Make the iframe fill the available space */
            width: 100%;
            height: 100%;
            border: none; /* Remove iframe border */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">MSFT <img src="images.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="mainpage.jsp">Home </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">About This App</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="companyInfo.jsp">CompanyInfo</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="container">
        <div class="row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <div class="card">
                    <div class="card-body">
                        <iframe src="Month.jsp" title="Included Content"></iframe>
                        <a href="Month.jsp" class="btn btn-primary">Monthly</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 mb-3 mb-sm-0">
                <div class="card">
                    <div class="card-body">
                        <iframe src="Week.jsp" title="Included Content"></iframe>
                        <a href="Week.jsp" class="btn btn-primary">Weekly</a>
                    </div>
                </div>
            </div>
          </div>

          <div class="row justify-content-center align-items-center">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <div class="card">
                    <div class="card-body">
                        <iframe src="Days.jsp" title="Included Content"></iframe>
                        <a href="Days.jsp" class="btn btn-primary">Live</a>
                    </div>
                </div>
            </div>
          </div>
      </div>
</body>
</html>