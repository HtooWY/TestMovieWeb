<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestMovie.aspx.cs" Inherits="TestMovieWeb.TestMovie" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Upcoming Movies</title>

    <!-- Bootstrap stylesheet -->
    <link href="../Content/bootstrap.min.css" rel="stylesheet">
    <link href="../Content/CustomStyle.css" rel="stylesheet">
    <link href="../colorbox/colorbox.css" rel="stylesheet" />
    <style>
        .bg-1 {
            color: #ffffff;

            margin: 15px;
        }

        .bg-white {
            background-color: white;
        }

        .bg-2 {
            background-color: #7C8C8E;
            padding: 0px 100px;
        }

        .overview {
            color: black;
            font-size: small;
        }

        .vcenter {
            vertical-align: middle;
        }

        .box {
            background-color: white;
            box-shadow: 5px 5px 10px black;
            padding: 0px;
        }

        .navbar {
            margin-bottom: 20px;
        }
    </style>
    <!-- Add jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <%--Add jquery Colorbox--%>
    <script type="text/javascript" src="../colorbox/jquery.colorbox-min.js"></script>
    <%--<script type="text/javascript" src="../Scripts/jquery.colorbox.js"></script>--%>

    <%-- <!-- Add mousewheel plugin (this is optional) -->
    <script type="text/javascript" src="/lib/jquery.mousewheel-3.0.6.pack.js"></script>

    <!-- Add fancyBox -->
    <link rel="stylesheet" href="source/jquery.fancybox.css" type="text/css" media="screen" />
    <script type="text/javascript" src="source/jquery.fancybox.pack.js"></script>

    <!-- Optionally add helpers - button, thumbnail and/or media -->
    <link rel="stylesheet" href="source/helpers/jquery.fancybox-buttons.css" type="text/css" media="screen" />
    <script type="text/javascript" src="source/helpers/jquery.fancybox-buttons.js"></script>
    <script type="text/javascript" src="source/helpers/jquery.fancybox-media.js"></script>

    <link rel="stylesheet" href="source/helpers/jquery.fancybox-thumbs.css" type="text/css" media="screen" />
    <script type="text/javascript" src="source/helpers/jquery.fancybox-thumbs.js"></script>--%>
    <script type="text/javascript">
       
    </script>
</head>

<body>
    <script type="text/javascript">

        $(document).ready(function () {
            jQuery(".youtube").colorbox({ iframe: true, innerWidth: 640, innerHeight: 390 });
            jQuery(".inline").colorbox({ inline: true, width: "50%" });
        });



    </script>
    <div class="container-fluid bg-2">
        <div class="bg-white">
            <nav class="navbar navbar-inverse nomargin">
                <div class="container-fluid nomargin">
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
            <div class="container-fluid box">


                <%-- for sliding movies --%>
                <div class="container-fluid">

                    <div class="row">



                        <%for (int i = 0; i < 4; i++)
                          {%>
                        <div class="col-md-3 nopad">
                            <div class="hovereffect">

                                <img class="img-responsive" src="https://image.tmdb.org/t/p/w780<%=Jtoken[i]["poster_path"] %>" alt="">
                                <div class="overlay">
                                    <h2><%=Jtoken[i]["title"] %></h2>
                                    <a class="info youtube" href="https://www.youtube.com/embed/<%=Jtoken[i]["videourl"] %>">Play Trailer</a>
                                </div>
                            </div>
                        </div>

                        <% } %>
                    </div>


                </div>
                <%--  --%>

                <div class="container">
                    <%--page header--%>
                    <div class="page-header">
                        <h2><strong>New Movies Spotlight</strong></h2>
                    </div>
                    <%--  --%>
                    <ul class="nav nav-tabs" style="padding: 20px 0px 0px">
                        <li role="presentation" class="active"><a href="#latest" data-toggle="tab">Lastest</a></li>
                        <li role="presentation"><a href="#comingsoon" data-toggle="tab">Coming Soon</a></li>

                    </ul>

                    <%--tab content--%>
                    <div class="tab-content">
                        <%--add latest tab content--%>
                        <div class="tab-pane active" id="latest">
                            <div class="container" style="margin: 25px 0px;">
                                <div class="col-md-3">
                                    <div class="hovereffect">

                                        <img class="img-responsive" src="https://image.tmdb.org/t/p/w780<%=Jtoken[1]["poster_path"] %>" alt="">
                                        <div class="overlay">
                                            <h2><%=Jtoken[1]["title"] %></h2>
                                            <a class="info inline" href="#<%=Jtoken[1]["id"] %>">More Info</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--wrap latest tab content--%>

                        <%--Add coming soon content--%>
                        <div class="tab-pane" id="comingsoon">
                            <div class="container" style="margin: 25px 0px;">
                                <% foreach (var j in Jtoken)
                                   {%>
                                <div class="col-md-3" style="padding: 0px 15px 20px">
                                    <div class="hovereffect">

                                        <img class="img-responsive" src="https://image.tmdb.org/t/p/w780<%=j["poster_path"] %>" alt="">
                                        <div class="overlay">
                                            <h2><%=j["title"] %></h2>
                                            <a class="info inline" href="#<%=j["id"] %>">More Info</a>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>

                        </div>
                        <%--wrap coming soon content--%>
                    </div>
                    <%--wrap tab content--%>

                    <%--<div class="container-fluid" style="padding: 0px 15px 0px; margin: 10px">
                        <% foreach (var j in Jtoken)
                           {%>

                        <div class="row bg-1" style="text-align: Left;">
                            <div class="col-md-4">
                                <img src="https://image.tmdb.org/t/p/w780<%=j["poster_path"] %>" class="img-responsive" style="align-content: center; padding: 30px 0px 0px">
                            </div>
                            <div class="col-md-8" style="padding: -10px 0px 0px 0px">
                                <h2 style="text-align: center; color: blue"><%=j["title"] %></h2>
                                <p class="date">
                                    <em>Release Date: <%=j["release_date"]%></em><br />
                                </p>
                                <p class="overview"><%=j["overview"]%></p>
                                <div class="embed-responsive embed-responsive-16by9">
                                    <iframe class="embed-responsive-item" src="//www.youtube.com/embed/<%=j["videourl"] %>"></iframe>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>--%>
                </div>
            </div>


        </div>
    </div>

    <div style='display: none'>
        <% foreach (var j in Jtoken)
           {%>

        <div class="row bg-1" id="<%=j["id"] %>" style="text-align: Left;">
            <div class="col-md-4">
                <img src="https://image.tmdb.org/t/p/w780<%=j["poster_path"] %>" class="img-responsive" style="align-content: center; padding: 30px 0px 0px">
            </div>
            <div class="col-md-8" style="padding: -10px 0px 0px 0px">
                <h2 style="text-align: center; color: blue"><%=j["title"] %></h2>
                <p class="date">
                    Release Date: <%=j["release_date"]%><br />
                </p>
                <p class="overview"><%=j["overview"]%></p>
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="//www.youtube.com/embed/<%=j["videourl"] %>"></iframe>
                </div>
            </div>
        </div>
        <% } %>
        <div id="inline_content" style='padding: 10px; background: #fff;'>
            <p><strong>This content comes from a hidden element on this page.</strong></p>
            <p>The inline option preserves bound JavaScript events and changes, and it puts the content back where it came from when it is closed.</p>
            <p><a id="click" href="#" style='padding: 5px; background: #ccc;'>Click me, it will be preserved!</a></p>

            <p><strong>If you try to open a new Colorbox while it is already open, it will update itself with the new content.</strong></p>
            <p>
                Updating Content Example:<br />

        </div>
    </div>


    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
