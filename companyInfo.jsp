<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/c96107f48b.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Stock Market</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .card {
            height: 400px; 
        }

        .card-body {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .navbar-brand img {
        width: 50px;
        height: auto;
        }


        iframe {
            width: 100%;
            height: 100%;
            border: none; 
        }

        #stockInfo {
            margin-top: 20px;
            text-align: center;
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
                <a class="nav-link active" aria-current="page" href="msftdatacharting.jsp"><i class="fa-solid fa-arrow-left"></i></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">About This App</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <img src="MicroSoft.png" alt="Microsoft Logo" style="width: 30px; height: auto; margin-right: 10px;"> Microsoft Corporation
                        
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Stock Information</h5>
                        <p class="card-text">Date: <span id="dateLabel" class="fw-bold"></span></p>
                        <p class="card-text">Last Refreshed: <span id="lastRefreshed" class="fw-bold"></span></p>
                        <p class="card-text">Last Close: <span id="lastClose" class="fw-bold"></span></p>
                        <p class="card-text">Last Open: <span id="lastOpen" class="fw-bold"></span></p>
                        <p class="card-text">Volume: <span id="volume" class="fw-bold"></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const url = 'https://alpha-vantage.p.rapidapi.com/query?interval=1min&function=TIME_SERIES_INTRADAY&symbol=MSFT&datatype=json&output_size=compact&datatype=json';
        const options = {
            method: 'GET',
            headers: {
                'X-RapidAPI-Key': '1261490cd5mshd21a27faec0038dp11a8b2jsn7d06fd11e844',
                'X-RapidAPI-Host': 'alpha-vantage.p.rapidapi.com'
            }
        };

        async function fetchData() {
            try {
                const response = await fetch(url, options);
                const data = await response.json();
                const metaData = data['Meta Data'];
                const lastRefreshed = metaData['3. Last Refreshed'];
                const lastClose = parseFloat(data['Time Series (1min)'][lastRefreshed]['4. close']);
                const lastOpen = parseFloat(data['Time Series (1min)'][lastRefreshed]['1. open']);
                const volume = parseInt(data['Time Series (1min)'][lastRefreshed]['5. volume']);

                document.getElementById('dateLabel').textContent = lastRefreshed;
                document.getElementById('lastRefreshed').textContent = lastRefreshed;
                document.getElementById('lastClose').textContent = lastClose;
                document.getElementById('lastOpen').textContent = lastOpen;
                document.getElementById('volume').textContent = volume;
            } catch (error) {
                console.error(error);
            }
        }

        fetchData();
    </script>
</body>
</html>