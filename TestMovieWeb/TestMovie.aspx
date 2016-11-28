<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestMovie.aspx.cs" Inherits="TestMovieWeb.TestMovie" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="Content/bootstrap.min.css" rel="stylesheet">

    <style>
        .bg-1 {
            background-color: #B2BABB;
            color: #ffffff;
            padding: 5px 20px 20px;
            border: 10px solid #B2BABB;
            border-radius: 10px;
            margin: 15px;
        }

        .overview {
            color: black;
            font-size: small;
        }

        .date {
            color: black;
            font-size: medium;
        }

        .vcenter {
            vertical-align: middle;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Test Movie</a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/TestMovie.aspx">Home</a></li>
                    <li><a href="/">About</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
     <div class="page-header" style="padding: 10px 50px 0px;">
         <h1><strong>New Movies Coming Soon</strong></h1>
     </div>
    <div class="container-fluid" style="padding: 0px 15px 0px; margin: 10px">
        <% foreach (var j in Jtoken)
           {%>

        <div class="row bg-1" style="text-align: Left;">
            <div class="col-md-4">
                <img src="https://image.tmdb.org/t/p/w780<%=j["poster_path"] %>" class="img-responsive" alt="Cinque Terre" style="align-content: center;">
            </div>
            <div class="col-md-8" style="padding: -10px 0px 0px 0px">
                <h2 style="text-align: center; color: blue"><%=j["title"] %></h2>
                <p class="date"><em>Release Date: <%=j["release_date"]%></em><br />
                </p>
                <p class="overview"><%=j["overview"]%></p>
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="//www.youtube.com/embed/<%=j["videourl"] %>"></iframe>
                </div>
            </div>
        </div>
        <% } %>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
