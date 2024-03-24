<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://kit.fontawesome.com/c96107f48b.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        /* Background image container */
        .background-container {
            background-image: url('background.png');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: -1;
        }

        /* Content container */
        .content-container {
            max-width: 800px;
            margin: 20px auto;
         padding: 20px;
        background: linear-gradient(45deg, #4CAF50, #2196F3);
        border-radius: 20px;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        transform: perspective(1000px) rotateX(30deg);
        color: white; /* Text color */
}

/* Add hover effect for more interaction */
.content-container:hover {
    transform: perspective(1000px) rotateX(20deg);
    transition: transform 0.5s ease;
}



        .search-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-bar {
            width: 60%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }

        .shares-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .share {
            width: calc(30% - 20px);
            margin: 10px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .share:hover {
            background-color: #f9f9f9;
            color:black;
        }
        .navbar {
        background-color: #333;
        overflow: hidden;
    }
    .navbar a {
        float: left;
        display: block;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
    }
    .navbar a:hover {
        background-color: #ddd;
        color: black;
    }
    .navbar a.signout {
        float: right;
    }
    </style>
</head>
<body>
    <div class="navbar">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-chart-line">Stock+</i></a>
        <a href="#">About</a>
        <a href="#">Contact</a>
        <a href="login.jsp" class="signout">Sign Out</a>
      </div>
    <div class="background-container"></div>

    <!-- Content container -->
    <div class="content-container">
        <h1 style="text-align: center;">Share Market Dashboard</h1>
        <div class="search-container">
            <input type="text" class="search-bar" placeholder="Search shares...">
        </div>
        <div class="shares-container">
            <!-- Example share options -->
            <div class="share" onclick="navigateToPage('IBM')">IBM Corp. (IBM)</div>
            <div class="share" onclick="navigateToPage('MSFT')">Microsoft Corp. (MSFT)</div>
            <div class="share" onclick="navigateToPage('AMZN')">Amazon.com Inc. (AMZN)</div>
            <!-- Add more share options here -->
        </div>
    </div>

    <script>
        function navigateToPage(symbol) {
            let pageUrl;
            // Define the URL for each symbol
            switch (symbol) {
                case 'IBM':
                    pageUrl = 'IBMdatacharting.jsp';
                    break;
                case 'MSFT':
                    pageUrl = 'msftdatacharting.jsp';
                    break;
                case 'AMZN':
                    pageUrl = 'amzn.jsp';
                    break;
                default:
                    pageUrl = 'default.jsp';
            }
            // Navigate to the respective page
            window.location.href = pageUrl;
        }

        // JavaScript for search functionality
        document.querySelector('.search-bar').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const shares = document.querySelectorAll('.share');
            shares.forEach(function(share) {
                const text = share.textContent.toLowerCase();
                const isVisible = text.includes(searchTerm);
                share.style.display = isVisible ? 'block' : 'none';
            });
        });
    </script>
</body>
</html>