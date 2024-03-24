<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Moving Average Chart</title>
<!-- Include Syncfusion Essential JS 2 CSS -->
<link href="https://cdn.syncfusion.com/ej2/material.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- Include Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    /* Style for navigation bar */
    .navbar {
        background-color: #333;
        padding: 10px;
        text-align: center;
        border-radius: 5px;
    }

    .navbar a {
        color: #ffffff;
        text-decoration: none;
        padding: 10px 20px;
        margin: 0 10px;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .navbar a:hover {
        background-color: #555;
    }

    .navbar .symbol {
        color: #ffffff;
        font-size: 20px;
        margin-right: 10px;
    }

    /* Style for chart container */
    #stockChart {
        position: absolute;
        top: 50px; /* Adjust top position as needed */
        left: 10px; /* Adjust left position as needed */
        width: calc(100% - 20px); /* Adjust width as needed */
        height: calc(100% - 60px); /* Adjust height as needed */
    }
</style>
</head>
<body>
<!-- Navigation bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-dark">

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Month.jsp"><span class="symbol"><i class="fas fa-arrow-left"></i></span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="mainpage.jsp">Home</a>
      </li>
      </ul>
  </div>
</nav>


<!-- Chart container -->
<div id="stockChart"></div>

<!-- Include Syncfusion Essential JS 2 library -->
<script src="https://cdn.syncfusion.com/ej2/dist/ej2.min.js" type="text/javascript"></script>

<script>
    const url = 'https://alpha-vantage.p.rapidapi.com/query?function=TIME_SERIES_DAILY&symbol=MSFT&datatype=json';
    const options = {
        method: 'GET',
        headers: {
            'X-RapidAPI-Key': '6341ed85efmshe7c35ac2a9950e6p1f063ejsnfebe3b48c9fc',
            'X-RapidAPI-Host': 'alpha-vantage.p.rapidapi.com'
        }
    };

    async function fetchData() {
        try {
            const response = await fetch(url, options);
            const data = await response.json();
            const timeSeries = data['Time Series (Daily)'];
            const chartData = [];
            const movingAverageData = [];
            const period = 5; // Period for moving average

            // Extract data for the last 30 days and calculate moving average
            const dates = Object.keys(timeSeries).slice(0, 30);
            dates.forEach((date, index) => {
                const closePrice = parseFloat(timeSeries[date]['4. close']);
                chartData.push({ x: new Date(date), y: closePrice });

                let sum = 0;
                for (let i = Math.max(0, index - period + 1); i <= index; i++) {
                    sum += parseFloat(timeSeries[dates[i]]['4. close']);
                }
                movingAverageData.push({ x: new Date(date), y: sum / Math.min(index + 1, period) });
            });

            // Initialize the chart
            var stockChart = new ej.charts.Chart({
                // Specify the chart element
                series: [
                    // Add series for stock price
                    {
                        dataSource: chartData,
                        xName: 'x',
                        yName: 'y',
                        name: 'Stock Price',
                        type: 'Line',
                        fill: '#0066FF',
                        width: 2
                    },
                    // Add series for moving average
                    {
                        dataSource: movingAverageData,
                        xName: 'x',
                        yName: 'y',
                        name: 'Moving Average',
                        type: 'Line',
                        fill: '#FF3300',
                        width: 2
                    }
                ],
                // Specify the chart title
                title: 'Stock Price with Moving Average',
                // Specify the primary X-axis
                primaryXAxis: {
                    valueType: 'DateTime',
                    labelFormat: 'yMd',
                    edgeLabelPlacement: 'Shift'
                },
                // Specify the primary Y-axis
                primaryYAxis: {
                    title: 'Price',
                    minimum: Math.min(...chartData.map(data => data.y)) - 10,
                    maximum: Math.max(...chartData.map(data => data.y)) + 10,
                    interval: 10,
                    labelFormat: '${value}',
                    lineStyle: { width: 0 }
                },
                // Specify the tooltip settings
                tooltip: {
                    enable: true,
                    shared: true
                },
                // Enable the crosshair
                crosshair: { enable: true },
                // Enable zooming and panning
                zoomSettings: {
                    enableSelectionZooming: true,
                    enableMouseWheelZooming: true,
                    enablePinchZooming: true,
                    enableScrollbar: true
                }
            });
            // Render the chart
            stockChart.appendTo('#stockChart');
        } catch (error) {
            console.error(error);
        }
    }

    fetchData();

    function goBack() {
        window.history.back();
    }
</script>
</body>
</html>
