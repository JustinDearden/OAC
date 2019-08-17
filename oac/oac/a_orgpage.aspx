<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="a_orgpage.aspx.cs" Inherits="oac.a_orgpage" %>

<!doctype html>


<html lang="en" class="no-js">
<head>
    <title>OAC - Organization</title>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/ymca-assets.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <form runat="server">
        <!-- Data Sources -->
        <asp:SqlDataSource ID="SqlDataSourceAddServices" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [OrgID], [ServiceName], [SeviceDesc] FROM [OrgAddServices] WHERE ([OrgID] = @OrgID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="OrgID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSourceTags" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="SELECT [OrgID], [ServiceDesc] FROM [OrgServices] WHERE ([OrgID] = @OrgID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="OrgID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        
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

            <!-- Organization-details -->
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
                                        <br />
                                        <span class="listing-detail__description-review-numb">Number of Services:
                                            <asp:Label ID="LabelNumServices" runat="server" Text="Label"></asp:Label>
                                        </span>
                                    </p>
                                </div>
                                <div class="col-sm-3">
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
                                            <asp:Image ID="Image1" Width="500px" Height="325px" runat="server" />
                                        </div>
                                        <div class="item-image small-size">
                                            <asp:Image ID="Image2" Width="220px" Height="162px" runat="server" />
                                        </div>
                                        <div class="item-image small-size">
                                            <asp:Image ID="Image3" Width="220px" Height="162px" runat="server" />
                                        </div>
                                    </div>

                                    <!-- overview box -->
                                    <div class="listing-detail__overview element-waypoint" id="overview-box">
                                        <h2 class="listing-detail__content-title">Overview</h2>
                                        <p class="listing-detail__content-description">
                                            <asp:TextBox ID="PageViews" runat="server" Visible="false"></asp:TextBox>
                                            <asp:Label ID="LabelOrgDesc" runat="server" Text="Label"></asp:Label>
                                        </p>
                                    </div>

                                    <!-- tips & reviews-box -->
                                    <div class="listing-detail__reviews element-waypoint" id="tips-reviews-box">
                                        <h2 class="listing-detail__content-title">Additional Services:

                                        </h2>
                                        <p>
                                            Non-IRCC funded Programs:
                                <br />
                                            ** IRCC = (Immigration, Refugees and Citizenship Canada) **
                                        </p>
                                        <div class="listing-detail__reviews-box">

                                            <!-- additional services list -->
                                            <ul class="reviews-list">

                                                <asp:ListView ID="CategoryView" runat="server" GroupItemCount="4" GroupPlaceholderID="groupPlaceHolder1"
                                                    ItemPlaceholderID="itemPlaceHolder1" DataSourceID="SqlDataSourceAddServices">
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
                                                        <li class="reviews-list__item">
                                                            <div class="reviews-list__item-box">
                                                                <div class="reviews-list__item-content">
                                                                    <h3 class="reviews-list__item-title">
                                                                        <%#Eval("ServiceName") %>
                                                                    </h3>
                                                                    <p class="reviews-list__item-description">
                                                                        <%#Eval("SeviceDesc") %>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:ListView>

                                            </ul>
                                            <!-- additional services list -->

                                        </div>

                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="sidebar">

                                    <div class="sidebar__map-widget">
                                        <h2 class="sidebar__widget-title">Location
                                        </h2>
                                        <div id="mapSingle" data-latitude="<%#Eval("Latitude") %>" data-longitude="<%#Eval("Longitude") %>" data-map-icon="la la-cutlery"></div>
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
                                                <asp:Label ID="LabelWebsite" runat="server" Text="Label"></asp:Label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="sidebar__widget sidebar__widget-author">
                                        <div class="sidebar__widget sidebar__widget-tags">
                                            <h2 class="sidebar__widget-title">Services
                                            </h2>
                                            <ul class="sidebar__tags-list">
                                                <asp:ListView ID="ListView1" runat="server" GroupItemCount="4" GroupPlaceholderID="groupPlaceHolder1"
                                                    ItemPlaceholderID="itemPlaceHolder1" DataSourceID="SqlDataSourceTags">
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
                                                        <li>
                                                            <a style="pointer-events: none; cursor: default;" href="#">
                                                                <asp:Label ID="LabelTagOne" runat="server" Text='<%#Eval("ServiceDesc") %>'></asp:Label>
                                                            </a>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:ListView>
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
                                    <img src="images/YMCA-logo.png" alt="ymca-logo">
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
