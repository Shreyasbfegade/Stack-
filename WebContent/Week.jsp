<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Stock Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Stock Chart</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="mainpage.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="algo1.jsp">moving Average</a>
                    </li>
                    
            </div>
        </div>
    </nav>
    <div style="position: relative;">
        <canvas id="stockChart" width="800" height="350"></canvas>
        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink" style="position: absolute; z-index: 0;">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <!-- Add more dropdown items as needed -->
        </div>
    </div>
    <canvas id="stockChart" width="800" height="350"></canvas>
    <script>
        const url = 'https://alpha-vantage.p.rapidapi.com/query?interval=1min&function=TIME_SERIES_DAILY&symbol=IBM&datatype=json&output_size=compact';
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
                const timeSeries = data['Time Series (Daily)'];
                const chartLabels = [];
                const chartData = [];
                let count = 0;

                // Loop through the time series data
                for (let time in timeSeries) {
                    if (count >= 7) break; // Exit loop after 30 data points

                    // Extract date
                    chartLabels.push(time);

                    // Extract closing price
                    chartData.push(timeSeries[time]['4. close']);

                    count++; // Increment count
                }

                plotChart(chartLabels, chartData); // Plot chart with extracted data
            } catch (error) {
                console.error(error);
            }
        }

        function plotChart(labels, data) {
            const ctx = document.getElementById('stockChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels.reverse(), // Reverse labels to display in ascending order
                    datasets: [{
                        label: 'MSFT Stock Price (Weekly)',
                        data: data.reverse(), // Reverse data to match the labels
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
        }

        fetchData();
    </script>
</body>
</html>
