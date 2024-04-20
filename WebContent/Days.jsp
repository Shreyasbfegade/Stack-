<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body> <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Stock Chart</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="candle.jsp">Candle</a>
                </li>
                </ul>
        </div>
    </div>
</nav>
    <canvas id="stockChart" width="800" height="350"></canvas>
    <script>
        const url = 'https://alpha-vantage.p.rapidapi.com/query?interval=1min&function=TIME_SERIES_INTRADAY&symbol=MSFT&datatype=json&output_size=compact&datatype=json';  
        const options = {
            method: 'GET',
            headers: {
                'X-RapidAPI-Key': 'YourApiKey',
                'X-RapidAPI-Host': 'alpha-vantage.p.rapidapi.com'
            }
        };

        async function fetchData() {
    try {
        const response = await fetch(url, options);
        const data = await response.json();
        const timeSeries = data['Time Series (1min)'];
        const chartLabels = [];
        const chartData = [];
        let firstTime = true; // To ensure date is added only once
        let dateLabel;

        for (let time in timeSeries) {
            // Extract time part only (HH:MM) from the timestamp
            const timePart = time.split(' ')[1];
            chartLabels.push(timePart);
            chartData.push(timeSeries[time]['4. close']);

            // Extract date only once
            if (firstTime) {
                dateLabel = time.split(' ')[0];
                firstTime = false;
            }
        }
        plotChartData(chartLabels, chartData);

        // Display date below the graph
        displayDate(dateLabel);
    } catch (error) {
        console.error(error);
    }
}

function displayDate(dateLabel) {
    const dateElement = document.createElement('div');
    dateElement.textContent = 'Date: ' + dateLabel;
    document.body.appendChild(dateElement);
}


        async function plotChartData(labels, data) {
            const ctx = document.getElementById('stockChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: [],
                    datasets: [{
                        label: 'MSFT Stock Price',
                        data: [],
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: false
                            }
                        }]
                    }
                }
            });

            for (let i = 0; i < labels.length; i++) {
                await delay(1000); // 5000 milliseconds = 5 seconds
                myChart.data.labels.push(labels[i]);
                myChart.data.datasets[0].data.push(data[i]);
                myChart.update();
            }
        }

        function delay(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        fetchData();
    </script>
</body>
</html>
