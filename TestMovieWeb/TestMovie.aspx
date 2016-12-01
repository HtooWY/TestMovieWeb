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

    <!-- Add jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <%--Add jquery Colorbox--%>
    <script type="text/javascript" src="../colorbox/jquery.colorbox-min.js"></script>

</head>

<body>
    <script type="text/javascript">

        $(document).ready(function () {
            jQuery(".youtube").colorbox({ iframe: true, innerWidth: 640, innerHeight: 390 });
            jQuery(".inline").colorbox({ inline: true, width: "75%" });
        });
    </script>
    <%--background--%>
    <div class="container-fluid bg-1">
        <%--second white bachground--%>
        <div class="bg-white">
            <%--navigation bar--%>
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
            <%--wrap navigation bar--%>

            <div class="container-fluid box">
                <%-- for movies cards--%>
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
                    <%--tabs--%>
                    <ul class="nav nav-tabs" style="padding: 20px 0px 0px">
                        <li role="presentation" class="active"><a href="#latest" data-toggle="tab">Currently Popular</a></li>
                        <li role="presentation"><a href="#comingsoon" data-toggle="tab">Coming Soon</a></li>

                    </ul>
                    <%--  --%>
                    <%--tab content--%>
                    <div class="tab-content">
                        <%--add Popular tab content--%>
                        <div class="tab-pane active" id="latest">
                            <div class="container" style="margin: 25px 0px;">
                                <% foreach (var j in popular)
                                   {%>
                                <div class="col-md-2 shadow">
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
                        <%--wrap latest tab content--%>

                        <%--Add coming soon content--%>
                        <div class="tab-pane" id="comingsoon">
                            <div class="container" style="margin: 25px 0px;">
                                <% foreach (var j in Jtoken)
                                   {%>
                                <div class="col-md-2 shadow">
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
                </div>
            </div>
        </div>
        <%--wrap second white background--%>
    </div>
    <%-- wrap background--%>

    <%--for movie synopsis contents--%>
    <div style='display: none'>
        <% foreach (var j in Jtoken)
           {%>
        <div class="row tab" id="<%=j["id"] %>" style="background-image: url('https://image.tmdb.org/t/p/w780<%=j["backdrop_path"]%>');">
            <div class="col-md-4">
                <img src="https://image.tmdb.org/t/p/w780<%=j["poster_path"] %>" class="img-responsive poster">
            </div>
            <div class="col-md-8 synbox">
                <div class="page-header">
                    <h2 class="textshade"><strong><%=j["title"] %></strong></h2>
                </div>

                <p class="date textshade">
                    <em>Release Date: <%=j["release_date"]%></em><br />
                </p>
                <p class="overview textshade"><%=j["overview"]%></p>
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<%=j["videourl"] %>?html5=1"></iframe>
                </div>
            </div>
        </div>
        <% } %>

        <% foreach (var p in popular)
           {%>
        <div class="row tab" id="<%=p["id"] %>" style="background-image: url('https://image.tmdb.org/t/p/w780<%=p["backdrop_path"]%>');">
            <div class="col-md-4">
                <img src="https://image.tmdb.org/t/p/w780<%=p["poster_path"] %>" class="img-responsive poster">
            </div>
            <div class="col-md-8 synbox">
                <div class="page-header">
                    <h2 class="textshade"><strong><%=p["title"] %></strong></h2>
                </div>

                <p class="date textshade">
                    <em>Release Date: <%=p["release_date"]%></em><br />
                </p>
                <p class="overview textshade"><%=p["overview"]%></p>
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<%=p["videourl"] %>?html5=1"></iframe>
                </div>
            </div>
        </div>
        <% } %>
    </div>


    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
