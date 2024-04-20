<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candlestick Chart</title>
    <link href="https://cdn.syncfusion.com/ej2/material.css" rel="stylesheet">
   
    <link href="https://cdn.syncfusion.com/ej2/material.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
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
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-dark">

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Days.jsp"><span class="symbol"><i class="fas fa-arrow-left"></i></span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="mainpage.jsp">Home</a>
      </li>
      </ul>
  </div>
</nav>
    <!-- Chart container -->
    <div id="candleChart" style="width: 80%; height: 500px;"></div>

    <!-- Include Syncfusion Essential JS 2 library -->
    <script src="https://cdn.syncfusion.com/ej2/dist/ej2.min.js" type="text/javascript"></script>

    <script>
        const url = 'https://alpha-vantage.p.rapidapi.com/query?interval=1min&function=TIME_SERIES_INTRADAY&symbol=MSFT&datatype=json&output_size=compact';
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

                // Convert time series data to candlestick format
                const candleData = Object.keys(timeSeries).map(date => {
                    const candle = timeSeries[date];
                    return {
                        x: new Date(date),
                        open: parseFloat(candle['1. open']),
                        high: parseFloat(candle['2. high']),
                        low: parseFloat(candle['3. low']),
                        close: parseFloat(candle['4. close'])
                    };
                });

                // Initialize the candlestick chart
                var candleChart = new ej.charts.Chart({
                    // Specify the chart element
                    series: [{
                        dataSource: candleData,
                        xName: 'x',
                        low: 'low',
                        high: 'high',
                        open: 'open',
                        close: 'close',
                        type: 'Candle',
                        bearFillColor: '#FF3333',
                        bullFillColor: '#33FF33',
                    }],
                    // Specify the chart title
                    title: 'Candlestick Chart',
                    // Specify the primary X-axis
                    primaryXAxis: {
                        valueType: 'DateTime',
                        labelFormat: 'yMd',
                        edgeLabelPlacement: 'Shift'
                    },
                    // Specify the primary Y-axis
                    primaryYAxis: {
                        title: 'Price'
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
                candleChart.appendTo('#candleChart');
            } catch (error) {
                console.error(error);
            }
        }

        fetchData();
    </script>
</body>
</html>
