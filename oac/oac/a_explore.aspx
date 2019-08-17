<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="a_explore.aspx.cs" Inherits="oac.a_explore" %>

<!doctype html>


<html lang="en" class="no-js">
<head>
    <title>OAC - Explore</title>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/ymca-assets.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <form runat="server">
        <!-- Data Sources -->
        <asp:SqlDataSource ID="SqlDataSourceOrganizations" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [OrgName], [ImagePG], [OrgID], [City], [NumServices], [Address], [PostalCode] FROM [Organizations]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceActivity" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [ImagePG], [ActivityTitle], [Date], [StartTime], [EndTime], [AutoNumber] FROM [Activities]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCity" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%City%'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%Category%'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStream" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [ItemName] FROM [Handlers] WHERE Category LIKE '%Stream%'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePinned" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [ImagePG], [ActivityTitle], [Date], [StartTime], [EndTime], [AutoNumber] FROM [Activities] WHERE ActivityTitle LIKE '%Knitting Circle%'"></asp:SqlDataSource>

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
                                    <a class="active" href="a_explore.aspx">Explore</a>
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

            <!-- Local Category Block -->
            <section class="category-list">
                <div class="container">
                    <h1>Find Local Organizations & Activities</h1>
                </div>
                <div class="category-list__box owl-wrapper">
                    <div class="owl-carousel" data-num="5">

                        <asp:ListView ID="ActivityView" runat="server" DataSourceID="SqlDataSourceActivity">
                            <ItemTemplate>
                                <div class="item">
                                    <!-- category-post -->
                                    <div class="category-post">
                                        <!-- Main Image -->
                                        <img class="category-post__image" style="opacity: 0.4; filter: alpha(opacity=40);" src='<%#Eval("ImagePG") %>'>
                                        <div class="category-post__content">
                                            <h2 class="category-post__title">
                                                <!-- Button To Link to full details page -->
                                                <asp:LinkButton ID="LinkButton2" PostBackUrl='<%# String.Format("~/a_listing.aspx?id={0}", Eval("AutoNumber")) %>' runat="server"><%#Eval("ActivityTitle") %></asp:LinkButton>
                                            </h2>
                                            <!-- Date and Time of Event -->
                                            <p class="category-post__list-num">
                                                <%# Eval("Date", "{0:MMM-dd-yyyy}") %>
                                                <br />
                                                <%#Eval("StartTime") %> - <%#Eval("EndTime") %>
                                            </p>
                                        </div>
                                    </div>
                                    <!-- end category-post -->

                                </div>
                            </ItemTemplate>
                        </asp:ListView>

                    </div>
                </div>
            </section>
            <!-- End local category block -->

            <!-- Organizations -->
            <section class="explore">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="explore__box">
                                <h2 class="explore__filter-title">
                                    <span>Organizations</span>
                                </h2>

                                <div class="explore__wrap iso-call">

                                    <asp:ListView ID="CategoryView" runat="server" GroupItemCount="4" GroupPlaceholderID="groupPlaceHolder1"
                                        ItemPlaceholderID="itemPlaceHolder1" DataSourceID="SqlDataSourceOrganizations">
                                        <LayoutTemplate>
                                            <table>
                                                <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                            </table>
                                        </LayoutTemplate>
                                        <GroupTemplate>
                                            <tr>
                                                <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                            </tr>
                                        </GroupTemplate>
                                        <ItemTemplate>
                                            <div class="item">
                                                <!-- place-post -->
                                                <div class="place-post">
                                                    <div class="place-post__gal-box">
                                                        <!-- Main Image -->
                                                        <img class="place-post__image" src='<%#Eval("ImagePG") %>' alt="place-image">
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
                                                <!-- end place-post -->

                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>

                                </div>

                            </div>
                        </div>

                        <!-- Featured -->
                        <div class="col-lg-4">
                            <div class="explore__filter">
                                <h2 class="explore__filter-title">
                                    <span>Most Popular</span>
                                </h2>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourcePinned">
                                    <ItemTemplate>
                                        <div class="item">
                                            <!-- category-post -->
                                            <div class="category-post">
                                                <!-- Main Image -->
                                                <img class="category-post__image" style="opacity: 0.4; filter: alpha(opacity=40);" src='<%#Eval("ImagePG") %>'>
                                                <div class="category-post__content">
                                                    <h2 class="category-post__title">
                                                        <!-- Button To Link to full details page -->
                                                        <asp:LinkButton ID="LinkButton2" PostBackUrl='<%# String.Format("~/a_listing.aspx?id={0}", Eval("AutoNumber")) %>' runat="server"><%#Eval("ActivityTitle") %></asp:LinkButton>
                                                    </h2>
                                                    <!-- Date and Time of Event -->
                                                    <p class="category-post__list-num">
                                                        <%# Eval("Date", "{0:MMM-dd-yyyy}") %>
                                                        <br />
                                                        <%#Eval("StartTime") %> - <%#Eval("EndTime") %>
                                                    </p>
                                                </div>
                                            </div>
                                            <!-- end category-post -->

                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                        <!-- End Featured -->

                    </div>
                </div>
            </section>
            <!-- End Organizations -->


            <!-- footer blocks -->
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
