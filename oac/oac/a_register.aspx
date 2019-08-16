<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="a_register.aspx.cs" Inherits="oac.a_register" %>

<!doctype html>


<html lang="en" class="no-js">
<head>
    <title>OAC - Register</title>

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
                        <a class="navbar-brand" href="a_index.aspx">
                            <img src="images/ymca-logo.png" alt="">
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li>
                                    <a href="a_index.aspx">Home</a>
                                </li>
                                <li>
                                    <a href="a_explore.aspx">Explore</a>
                                </li>
                                <li>
                                    <a href="a_contact.aspx">Contact</a>
                                </li>
                                <li>
                                    <a class="active" href="a_register.aspx">Register User</a>
                                </li>
                            </ul>
                            <ul class="navbar-nav ml-auto right-list">
                                <li>
                                    <asp:LinkButton ID="lblUserName" runat="server" OnClick="LinkButton_Click">LinkButton</asp:LinkButton>
                                </li>
                            </ul>
                            <a href="activity.aspx" class="add-list-btn btn-default"><i class="fa fa-plus" aria-hidden="true"></i>Activity</a>
                            <a href="add.aspx" class="add-list-btn btn-default"><i class="fa fa-plus" aria-hidden="true"></i>Org</a>
                            <asp:Button ID="btnLogout" runat="server" Text="Logout" class="add-list-btn btn-default" OnClick="btnLogout_Click" />
                        </div>
                    </div>
                </nav>
            </header>
            <!-- End Header -->

            <!-- Register -->
            <section class="sign">
                <div class="sign__area">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-sign-tab" data-toggle="tab" href="#nav-sign" role="tab" aria-controls="nav-sign" aria-selected="true">
                                <asp:Label ID="lblmsg" runat="server" Text="Register a User" Visible="true"></asp:Label>
                            </a>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-sign" role="tabpanel" aria-labelledby="nav-sign-tab">

                            <!-- Register-Form -->
                            <form class="sign-form">
                                <label class="sign-form__label" for="FirstName">
                                    First Name:
                                </label>
                                <asp:TextBox ID="FirstName" class="sign-form__input-text" runat="server" placeholder="Enter your first name" Required="true"></asp:TextBox>

                                <label class="sign-form__label" for="LastName">
                                    Last Name:
                                </label>
                                <asp:TextBox ID="LastName" class="sign-form__input-text" runat="server" placeholder="Enter your last name" Required="true"></asp:TextBox>

                                <label class="sign-form__label" for="email">
                                    Email address:
                                </label>
                                <asp:TextBox ID="Email" class="sign-form__input-text" runat="server" placeholder="Enter your email" Required="true"></asp:TextBox>

                                <label class="sign-form__label" for="username">
                                    Username:
                                </label>
                                <asp:TextBox ID="UserName" class="sign-form__input-text" runat="server" placeholder="Enter your username" Required="true"></asp:TextBox>

                                <label class="sign-form__label" for="OrgNameID">
                                    Organization:
                                </label>
                                <asp:DropDownList ID="OrgName" class="add-listing__input js-example-basic-multiple" Placeholder="Organization" runat="server">
                                </asp:DropDownList>
                                <br />
                                <label class="sign-form__label" for="password">
                                    Password:
                                </label>
                                <asp:TextBox ID="Password" class="sign-form__input-text" runat="server" placeholder="Password" type="password" Required="true"></asp:TextBox>

                                <label class="sign-form__label" for="con-password2">
                                    Confirm Password:
                                </label>
                                <asp:TextBox ID="conPassword" class="sign-form__input-text" runat="server" placeholder="Confirm Password" type="password" Required="true"></asp:TextBox>

                                <asp:TextBox ID="ID" runat="server" Visible="false"></asp:TextBox>

                                <br />
                                <asp:Button ID="btnSubmit" class="sign-form__submit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />

                            </form>

                            <!-- End Register Form -->

                        </div>

                    </div>
                </div>

            </section>
            <!-- End Register -->

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
