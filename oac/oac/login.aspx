<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="oac.login" %>

<!doctype html>


<html lang="en" class="no-js">
<head>
    <title>OAC - Login</title>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/ymca-assets.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <form runat="server">

        <!-- Container -->
        <div id="container">
            <!-- Header -->
            <header class="clearfix white-header-style">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container">

                        <!-- Logo -->
                        <a class="navbar-brand" href="index.aspx">
                            <img src="images/ymca-logo.png" alt="">
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li>
                                    <a href="index.aspx">Home</a>
                                </li>
                                <li>
                                    <a href="explore.aspx">Explore</a>
                                </li>
                                <li>
                                    <a href="contact.aspx">Contact</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav ml-auto right-list">
                                <li>
                                    <a class="active" href="login.aspx"><i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>Sign In</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>
            <!-- End Header -->

            <!-- Login -->
            <section class="sign">
                <div class="sign__area">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-sign-tab" data-toggle="tab" href="#nav-sign" role="tab" aria-controls="nav-sign" aria-selected="true">Sign in</a>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-sign" role="tabpanel" aria-labelledby="nav-sign-tab">

                            <!-- login-form -->
                            <form class="sign-form">
                                <label class="sign-form__label" for="username">
                                    Username:
                                </label>
                                <asp:TextBox ID="UserName" class="sign-form__input-text" runat="server" placeholder="Username"></asp:TextBox>
                                <label class="sign-form__label" for="password">
                                    Password:
                                </label>
                                <asp:TextBox ID="Password" class="sign-form__input-text" runat="server" placeholder="Password" type="password"></asp:TextBox>


                                <asp:Button ID="Button1" class="sign-form__submit" runat="server" Text="Login" OnClick="Button1_Click" />

                                <asp:Label ID="lblErrorMessage" runat="server" Text="Incorrect Username / Password" Visible="false"></asp:Label>
                                <asp:Label ID="LoginDate" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:TextBox ID="OrgID" runat="server" Visible="false"></asp:TextBox>
                            </form>

                            <!-- End login-form -->

                        </div>
                    </div>
                </div>

            </section>
            <!-- End loglink -->

        </div>
        <!-- End Container -->
    </form>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.migrate.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiqrIen8rWQrvJsu-7f4rOta0fmI5r2SI"></script>
    <!--build:js js/triptip-plugins.min.js -->
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/select2.min.js"></script>
    <script src="js/jquery.imagesloaded.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/retina-1.1.0.min.js"></script>
    <script src="js/jquery.appear.js"></script>
    <script src="js/infobox.min.js"></script>
    <script src="js/markerclusterer.js"></script>
    <script src="js/maps.js"></script>
    <!-- endbuild -->
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.countTo.js"></script>
    <script src="js/script.js"></script>

</body>
</html>
