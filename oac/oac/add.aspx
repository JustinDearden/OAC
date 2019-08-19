<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="oac.add" %>

<!doctype html>


<html lang="en" class="no-js">
<head>
    <title>OAC - Add Organization</title>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/ymca-assets.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <form runat="server">
        <!-- Data Sources -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%City%'"></asp:SqlDataSource>

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
                                    <a href="a_register.aspx">Register User</a>
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

            <!-- Add Organization -->
            <section class="add-listing">
                <div class="add-listing__title-box">
                    <div class="container">
                        <h1 class="add-listing__title">Add New Organization
                        </h1>
                    </div>
                </div>

                <!-- user scroll menu box -->
                <div class="user-detail__scroll-menu-box scroller-menu">
                    <div class="container">
                        <ul class="user-detail__scroll-menu navigate-section">
                            <li>
                                <a class="active" href="#general-info" data-offset="30">General Information</a>
                            </li>
                            <li>
                                <a href="#location-box" data-offset="30">Location</a>
                            </li>
                            <li>
                                <a href="#contact-box" data-offset="30">Contact</a>
                            </li>
                            <li>
                                <a href="#hours-box" data-offset="30">Hours</a>
                            </li>
                            <li>
                                <a href="#categories-box" data-offset="30">Categories</a>
                            </li>
                            <li>
                                <a href="#gallery-box" data-offset="30">Images</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Main Form -->
                <form class="add-listing__form">

                    <div class="container">

                        <!-- First Sectionx -->
                        <div class="add-listing__form-box element-waypoint" id="general-info">

                            <h2 class="add-listing__form-title">
                                <asp:Label ID="lblMainTitle" runat="server" Visible="false" Text="General Information:"></asp:Label>
                            </h2>

                            <div class="add-listing__form-content">
                                <div class="row">
                                    <div class="col-lg-5 col-md-4 col-sm-6">
                                        <label class="add-listing__label" for="OrganizationName">
                                            Organization Name:
                                        </label>
                                        <asp:TextBox ID="OrgName" class="add-listing__input" placeholder="Organization Name" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <label class="add-listing__label" for="OrgDescription">
                                    Description:
                                </label>
                                <asp:TextBox ID="OrgDescription" class="add-listing__textarea" placeholder="Organization Description" runat="server"></asp:TextBox>
                            </div>

                        </div>

                        <!-- Second Section -->
                        <div class="add-listing__form-box element-waypoint" id="location-box">

                            <h2 class="add-listing__form-title">Location:
                            </h2>

                            <div class="add-listing__form-content">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label class="add-listing__label" for="Address">
                                            Address:
                                        </label>
                                        <asp:TextBox ID="Address" class="add-listing__input" placeholder="Enter the address" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="add-listing__label" for="city">
                                            City:
                                        </label>
                                        <asp:DropDownList ID="City" class="add-listing__input js-example-basic-multiple" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="add-listing__label" for="PostalCode">
                                            Postal Code:
                                        </label>
                                        <asp:TextBox ID="PostalCode" class="add-listing__input" placeholder="Enter the postal code" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Third Section -->
                        <div class="add-listing__form-box element-waypoint" id="contact-box">

                            <h2 class="add-listing__form-title">Contact Information:
                            </h2>

                            <div class="add-listing__form-content">
                                <div class="row">
                                    <div class="col-md-3 col-sm-6">
                                        <label class="add-listing__label" for="PhoneNumber">
                                            Phone Number:
                                        </label>
                                        <asp:TextBox ID="PhoneNumber" class="add-listing__input" placeholder="Phone Number" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <label class="add-listing__label" for="PhoneExtension">
                                            Phone Extension:
                                        </label>
                                        <asp:TextBox ID="PhoneExtension" class="add-listing__input" placeholder="Phone Extension" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <label class="add-listing__label" for="FaxNumber">
                                            Fax Number:
                                        </label>
                                        <asp:TextBox ID="FaxNumber" class="add-listing__input" placeholder="Fax Number" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <label class="add-listing__label" for="Email">
                                            Email:
                                        </label>
                                        <asp:TextBox ID="Email" class="add-listing__input" placeholder="Email" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3 col-sm-6">
                                        <label class="add-listing__label" for="Website">
                                            Website:
                                        </label>
                                        <asp:TextBox ID="Website" class="add-listing__input" placeholder="Website" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="OrgID" runat="server" Visible="false"></asp:TextBox>
                                        <asp:TextBox ID="ImagePG" runat="server" Visible="false"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                        </div>

                        <!-- Fourth Section -->
                        <div class="add-listing__form-box element-waypoint" id="categories-box">

                            <h2 class="add-listing__form-title">Geo-Location:
                            </h2>

                            <div class="add-listing__form-content">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="add-listing__label" for="Latitude">
                                            Latitude:
                                        </label>
                                        <asp:TextBox ID="Latitude" class="add-listing__input" Placeholder="Latitude" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="add-listing__label" for="Longitude">
                                            Longitude:
                                        </label>
                                        <asp:TextBox ID="Longitude" class="add-listing__input" Placeholder="Longitude" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                            </div>

                        </div>

                        <!-- Fifth Section -->
                        <div class="add-listing__form-box element-waypoint" id="gallery-box">

                            <h2 class="add-listing__form-title">Image:
                            </h2>

                            <div class="add-listing__form-content">
                                <div class="add-listing__input-file-box">
                                    <asp:FileUpload class="add-listing__input-file" ID="Image" runat="server" />
                                    <div class="add-listing__input-file-wrap">
                                        <i class="la la-cloud-upload"></i>
                                        <p>Click here to upload your images</p>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="center-button">
                            <asp:Button ID="btnSubmit" class="add-listing__submit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        </div>

                    </div>

                </form>
            </section>
            <!-- End Add Organization -->

            <!-- footer block -->
            <footer class="footer footer-black">
                <div class="container">

                    <div class="footer__up-part">
                        <div class="row">
                            <div class="col-md-4">

                                <div class="footer__widget text-widget">
                                    <img src="images/ymca-logo.png" alt="ymca-logo">
                                    <p class="footer__widget-description">
                                        This website has been developed as part of a final year project by the School of Computer Science 2019, at the University of Windsor, under the supervision of <a href="http://kobti.myweb.cs.uwindsor.ca/">Dr. Kobti</a>.
                                    </p>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="footer__widget subscribe-widget">
                                    <h2 class="footer__widget-title footer__widget-title-white">Subscribe
                                    </h2>
                                    <p class="footer__widget-description">
                                        Be notified about new locations
                                    </p>
                                    <form class="footer__subscribe-form">
                                        <input class="footer__subscribe-input" type="text" name="email-sub" id="email-sub" placeholder="Enter your Email" />
                                        <button class="footer__subscribe-button footer__subscribe-button-primary" type="submit">
                                            <i class="la la-arrow-circle-o-right" aria-hidden="true"></i>
                                        </button>
                                    </form>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="footer__widget text-widget">
                                    <h2 class="footer__widget-title footer__widget-title-white">Contact Info
                                    </h2>
                                    <p class="footer__widget-description">
                                        <a href="https://www.google.com/maps/place/500+Victoria+Ave,+Windsor,+ON+N9A+4M8">500 Victoria Ave, Windsor, ON N9A 4M8 </a>
                                        <br>
                                        <a href="tel:519-258-9622">(519) 258-9622</a>
                                        <br>
                                        <a href="mailto:kkhaj@ymcawo.ca">kkhaj@ymcawo.ca</a>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="footer__down-part footer__down-part-black">
                        <div class="row">
                            <div class="col-md-7">
                                <p class="footer__copyright">
                                    © Copyright 2019 - OAC
                                </p>
                            </div>
                            <div class="col-md-5">
                                <ul class="footer__social-list">
                                    <li>
                                        <div id="google_translate_element"></div>
                                        <script type="text/javascript">
                                            function googleTranslateElementInit() {
                                                new google.translate.TranslateElement(
                                                    {
                                                        pageLanguage: 'en',
                                                        layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
                                                        multilanguagePage: true
                                                    }, 'google_translate_element');
                                            }
                                        </script>
                                        <script type="text/javascript"
                                            src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>

            </footer>
            <!-- End footer -->

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
