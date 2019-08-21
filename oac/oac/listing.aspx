<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listing.aspx.cs" Inherits="oac.listing" %>

<!doctype html>


<html lang="en" class="no-js">
<head>
    <title>OAC - Listing</title>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/ymca-assets.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <form runat="server">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
                                    <a href="login.aspx"><i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>Sign In</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>
            <!-- End Header -->

            <!-- listing-detail -->
            <section class="listing-detail">
                <div class="listing-detail__gal">
                    <div class="listing-detail__title-box">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-9">

                                    <h1 class="listing-detail__title listing-detail__title-black">
                                        <span>
                                            <asp:Label ID="LabelTitle" runat="server" Text="Label"></asp:Label>
                                        </span>
                                    </h1>
                                    <p class="listing-detail__address">
                                        <i class="fa fa-map-marker"></i>
                                        <asp:Label ID="LabelAddress" runat="server" Text="Label"></asp:Label>
                                        <asp:Label ID="LabelCity" runat="server" Text="Label"></asp:Label>
                                        <asp:Label ID="LabelPostalCode" runat="server" Text="Label"></asp:Label>
                                        <span class="listing-detail__description-review-numb">
                                            <br />
                                            <asp:Label ID="LabelCategory" runat="server" Text="Label"></asp:Label>
                                            /
                                            <asp:Label ID="LabelStream" runat="server" Text="Label"></asp:Label>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="listing-detail__content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="listing-detail__content-box listing-detail__content-box-nopadding">

                                    <div class="listing-detail__scroll-menu-box scroller-menu">
                                        <ul class="listing-detail__scroll-menu listing-detail__menu-top-border navigate-section">
                                            <li>
                                                <a class="active" href="#overview-box">Overview</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <!-- overview box -->
                                    <div class="listing-detail__galleria">
                                        <div class="item-image">
                                            <asp:Image ID="Image2" Width="500px" Height="325px" runat="server" />
                                        </div>
                                        <div class="item-image small-size">
                                            <asp:Image ID="Image3" Width="220px" Height="162px" runat="server" />
                                        </div>
                                        <div class="item-image small-size">
                                            <asp:Image ID="Image4" Width="220px" Height="162px" runat="server" />
                                        </div>
                                    </div>

                                    <!-- overview box -->
                                    <div class="listing-detail__overview element-waypoint" id="overview-box">
                                        <h2 class="listing-detail__content-title">Overview</h2>
                                        <p class="listing-detail__content-description">
                                            <asp:Label ID="LabelDesc" runat="server" Text="Label"></asp:Label>
                                            <asp:TextBox ID="PageViews" runat="server" Visible="false"></asp:TextBox>
                                        </p>
                                    </div>
                                    <div class="listing-detail__overview element-waypoint" id="gather-box">
                                        <h2 class="listing-detail__content-title">Gather Time</h2>
                                        <h3>
                                            <asp:Label ID="LabelDate" runat="server" Text="Label"></asp:Label>
                                            -
                                            <asp:Label ID="LabelStart" runat="server" Text="Label"></asp:Label>
                                            Till
                                            <asp:Label ID="LabelEnd" runat="server" Text="Label"></asp:Label>
                                        </h3>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="sidebar">

                                    <div class="sidebar__map-widget">
                                        <h2 class="sidebar__widget-title">Location
                                        </h2>
                                        <div id="mapSingle" data-latitude="<%#Eval("Lat") %>" data-longitude="<%#Eval("Long") %>" data-map-icon="la la-cutlery"></div>
                                    </div>

                                    <div class="sidebar__widget sidebar__widget-listing-details">
                                        <h2 class="sidebar__widget-title">Details
                                        </h2>
                                        <ul class="sidebar__listing-list">
                                            <li>
                                                <i class="la la-map-marker"></i>
                                                <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
                                                <asp:Label ID="lblCity" runat="server" Text="Label"></asp:Label>
                                                <br />
                                                &emsp;&ensp;<asp:Label ID="lblPostalCode" runat="server" Text="Label"></asp:Label>
                                            </li>
                                            <li>
                                                <i class="la la-mobile-phone"></i>
                                                <asp:Label ID="LabelPhoneNumber" runat="server" Text="Label"></asp:Label>
                                            </li>
                                            <li>
                                                <i class="la la-link"></i>
                                                <a href='<%# Eval("lblWebsiteAddress") %>'>
                                                    <asp:Label ID="LabelWebsite" runat="server" href='<%# Eval("lblWebsiteAddress") %>'></asp:Label>
                                                </a>
                                                <asp:Label ID="lblWebsiteAddress" runat="server" Visible="false" Text="Label"></asp:Label>
                                            </li>
                                            <li>
                                                <i class="la la-mobile-phone"></i>
                                                Host Name:
                                                <asp:Label ID="LabelHostName" runat="server" Text="Label"></asp:Label>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="sidebar__widget sidebar__widget-author">
                                        <div class="sidebar__widget sidebar__widget-tags">
                                            <h2 class="sidebar__widget-title">Tags
                                            </h2>
                                            <ul class="sidebar__tags-list">
                                                <li>
                                                    <a style="pointer-events: none; cursor: default;" href="#">
                                                        <asp:Label ID="LabelTagOne" runat="server" Text="Label"></asp:Label>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a style="pointer-events: none; cursor: default;" href="#">
                                                        <asp:Label ID="LabelTagTwo" runat="server" Text="Label"></asp:Label>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
            <!-- End listing-detail -->

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
