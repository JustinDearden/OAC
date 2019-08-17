<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="a_index.aspx.cs" Inherits="oac.a_index" %>

<!doctype html>


<html lang="en" class="no-js">
<head>
    <title>OAC</title>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/ymca-assets.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <!-- Container -->
    <form runat="server">

        <asp:SqlDataSource ID="SqlDataSourceOrganizations" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT DISTINCT TOP(5) [OrgName], [ImagePG], [OrgID], [City], [NumServices], [Address], [PostalCode] FROM [Organizations]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceActivity" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT DISTINCT TOP(5) [ImagePG], [ActivityTitle], [Date], [StartTime], [EndTime], [AutoNumber] FROM [Activities]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCity" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%City%'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%Category%'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStream" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%Stream%'"></asp:SqlDataSource>

        <div id="container">
            <!-- Header -->
            <header class="clearfix white-header-style">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container">

                        <!-- Logo -->
                        <a class="navbar-brand" href="a_index.aspx">
                            <img src="images/ymca-logo.png" alt="">
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li>
                                    <a class="active" href="a_index.aspx">Home</a>
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

            <!-- Title Overlay -->
            <section class="discover discover-best">
                <div class="container">

                    <p class="discover__description">
                        Orientation services in Windsor, Essex and Chatham-Kent.
                    </p>

                    <h1 class="discover__title places-tab">Find amazing activities.
                    </h1>

                </div>
            </section>
            <!-- End Title Overlay -->

            <!-- Newest Activities -->
            <section class="trending-places">
                <div class="container">

                    <!-- section-header -->
                    <div class="section-header">
                        <h1 class="section-header__title">Newest Activities
                        </h1>
                    </div>
                    <!-- end section-header -->

                    <div class="trending-places__box owl-wrapper">
                        <div class="owl-carousel" data-num="5">

                            <asp:ListView ID="ActivityView" runat="server" DataSourceID="SqlDataSourceActivity">
                                <ItemTemplate>
                                    <div class="item">
                                        <!-- Main Content -->
                                        <div class="category-post">
                                            <!-- Main Image -->
                                            <img class="category-post__image" width="370" height="300" src='<%#Eval("ImagePG") %>'>
                                            <div class="category-post__content">
                                                <h2 class="category-post__title">
                                                    <!-- Button To Link to full details page -->
                                                    <asp:LinkButton ID="LinkButton2" PostBackUrl='<%# String.Format("~/a_listing.aspx?id={0}", Eval("AutoNumber")) %>' runat="server"><%#Eval("ActivityTitle") %></asp:LinkButton>
                                                </h2>
                                                <!-- Date and Time of Activity -->
                                                <p class="category-post__list-num">
                                                    <%# Eval("Date", "{0:MMM-dd-yyyy}") %>
                                                    <br />
                                                    <%#Eval("StartTime") %> - <%#Eval("EndTime") %>
                                                </p>
                                            </div>
                                        </div>
                                        <!-- end Main Content -->

                                    </div>
                                </ItemTemplate>
                            </asp:ListView>

                        </div>
                    </div>
                </div>
            </section>
            <!-- End Newest Activities -->

            <!-- Newest Organizations -->
            <section class="trending-events">
                <div class="container">

                    <!-- section-header -->
                    <div class="section-header">
                        <h1 class="section-header__title">Newest Organizations
                        </h1>
                    </div>
                    <!-- end section-header -->


                    <div class="trending-events__box owl-wrapper">
                        <div class="owl-carousel" data-num="5">

                            <asp:ListView ID="CategoryView" runat="server" DataSourceID="SqlDataSourceOrganizations">
                                <ItemTemplate>
                                    <div class="item">
                                        <!-- Main Content -->
                                        <div class="place-post">
                                            <div class="place-post__gal-box">
                                                <!-- Main Image -->
                                                <img class="place-post__image" src='<%#Eval("ImagePG") %>' alt="organization-image">
                                                <!-- Organization City -->
                                                <span class="place-post__rating"><%#Eval("City") %></span>
                                            </div>
                                            <div class="place-post__content">
                                                <h2 class="place-post__title">
                                                    <!-- Link to the listing page -->
                                                    <asp:LinkButton ID="LinkButton2" PostBackUrl='<%# String.Format("~/a_orgpage.aspx?id={0}", Eval("OrgID")) %>' runat="server"><%#Eval("OrgName") %></asp:LinkButton>
                                                </h2>
                                                <p class="place-post__description">
                                                    Number of Services: <%#Eval("NumServices") %>
                                                </p>
                                                <!-- Address -->
                                                <p class="place-post__address">
                                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                    <%#Eval("Address") %> <%#Eval("City") %> <%#Eval("PostalCode") %>
                                                </p>
                                            </div>
                                        </div>
                                        <!-- End Main Content -->

                                    </div>
                                </ItemTemplate>
                            </asp:ListView>

                        </div>
                    </div>
                </div>
            </section>
            <!-- End Newest Organizations -->

            <!-- Details -->
            <section class="how-it-work how-it-work-white">
                <div class="container">

                    <!-- section-header -->
                    <div class="section-header">
                        <h1 class="section-header__title">What We Offer
                        </h1>
                        <p class="section-header__description">
                            A wide range of services to help integrate you into the community.
                        </p>
                    </div>
                    <!-- end section-header -->

                    <div class="how-it-work__box">
                        <div class="row">

                            <div class="col-lg-4 col-md-6">

                                <!-- what we offer -->
                                <div class="how-work-post">

                                    <span class="how-work-post__icon">
                                        <i class="la la-compass" aria-hidden="true"></i>
                                    </span>

                                    <h2 class="how-work-post__title">Discover Local Organizations
                                    </h2>

                                    <p class="how-work-post__description">
                                        Our list of growing partner organizations are here to help provided services to meet a wide variety of needs.
                                    </p>

                                </div>
                                <!-- end what we offer -->

                            </div>

                            <div class="col-lg-4 col-md-6">

                                <!-- what we offer section 2 -->
                                <div class="how-work-post">

                                    <span class="how-work-post__icon">
                                        <i class="la la-binoculars" aria-hidden="true"></i>
                                    </span>

                                    <h2 class="how-work-post__title">Find Interesting Activities
                                    </h2>

                                    <p class="how-work-post__description">
                                        Local activites are a great way to learn new skills, meet friends and interact with the people of your community.
                                    </p>

                                </div>
                                <!-- end what we offer section 2 -->

                            </div>

                            <div class="col-lg-4 col-md-6">

                                <!-- what we offer section 3 -->
                                <div class="how-work-post">

                                    <span class="how-work-post__icon">
                                        <i class="la la-plus-circle" aria-hidden="true"></i>
                                    </span>

                                    <h2 class="how-work-post__title">Connect With Us
                                    </h2>

                                    <p class="how-work-post__description">
                                        Your feedback is critical to helping us pick out new organizations to partner with or in setting up activities.
                                    </p>

                                </div>
                                <!-- end what we offer section 3 -->

                            </div>

                        </div>
                    </div>

                </div>
            </section>
            <!-- End details -->

            <!-- footer block module -->
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
