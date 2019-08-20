<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="oac.dashboard" %>

<!doctype html>


<html lang="en" class="no-js">
<head>
    <title>OAC - Dashboard</title>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/ymca-assets.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <form runat="server">
        <!-- Data Sources -->
        <asp:SqlDataSource ID="SqlDataSourceLoginHistory" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>" SelectCommand="select Top(3) [LoginHistory].[UserName], [LoginHistory].[LoginDate], [Organizations].[OrgName] from LoginHistory, Organizations where [LoginHistory].[OrgID] = [Organizations].[OrgID] order by [LoginHistory].[UserName] ASC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceActivity" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePreviousActivities" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceOrgStats" runat="server" ConnectionString="<%$ ConnectionStrings:oacConnectionString %>"></asp:SqlDataSource>
        <asp:Label ID="UserNameActivity" runat="server" Text="Label"></asp:Label>

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

            <!-- User Details -->
            <section class="user-detail">
                <div class="user-detail__profile">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="user-detail__profile-box">
                                    <h1>
                                        <asp:Label ID="lblUserNameDis" runat="server" Text="Label"></asp:Label>
                                    </h1>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <ul class="user-detail__profile-list">
                                    <li>
                                        <span>
                                            <asp:Label ID="lblTotalOrgs" runat="server" Text="Label"></asp:Label>
                                        </span>
                                        Total<br />
                                        Organizations
                                    </li>
                                    <li>
                                        <span>
                                            <asp:Label ID="lblTotalActivities" runat="server" Text="Label"></asp:Label>
                                        </span>
                                        Total<br />
                                        Activities
                                    </li>
                                    <li>
                                        <span>
                                            <asp:Label ID="lblActivitiesAdded" runat="server" Text="Label"></asp:Label>
                                        </span>
                                        Activities Added<br />
                                        This Week
                                    </li>
                                    <li>
                                        <span>
                                            <asp:Label ID="lblActivitiesUpcoming" runat="server" Text="Label"></asp:Label>
                                        </span>
                                        Upcoming Activities<br />
                                        This Month
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Label ID="lblStartTime" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:Label ID="lblEndTime" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:Label ID="lblActivitiesUpcomingCalc" runat="server" Text="Label" Visible="false"></asp:Label>

                <!-- user scroll menu box -->
                <div class="user-detail__scroll-menu-box scroller-menu">
                    <div class="container">
                        <ul class="user-detail__scroll-menu navigate-section">
                            <li>
                                <a href="#upcoming-activities" data-offset="30">Upcoming Activities</a>
                            </li>
                            <li>
                                <a href="#organization-stats" data-offset="30">Organization Stats</a>
                            </li>
                            <li>
                                <a href="#previous-activities" data-offset="30">Previous Activities</a>
                            </li>
                            <li>
                                <a href="#login-history" data-offset="30">Login History</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Upcoming Activities -->
                <div class="user-detail__cities element-waypoint" id="upcoming-activities">
                    <div class="container">
                        <h2 class="user-detail__subtitle">Upcoming Activities</h2>
                        <div class="category-list__box owl-wrapper">
                            <div class="owl-carousel" data-num="5">

                                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSourceActivity">
                                    <ItemTemplate>
                                        <div class="item">
                                            <!-- category-post -->
                                            <div class="category-post">
                                                <!-- Main Image -->
                                                <img class="category-post__image" style="opacity: 0.4; filter: alpha(opacity=40);" src='<%#Eval("ImagePG") %>'>
                                                <div class="category-post__content">
                                                    <h2 class="category-post__title">
                                                        <!-- Button To Link to full details page -->
                                                        <asp:LinkButton ID="LinkButton2" PostBackUrl='<%# String.Format("~/listing.aspx?id={0}", Eval("AutoNumber")) %>' runat="server"><%#Eval("ActivityTitle") %></asp:LinkButton>
                                                    </h2>
                                                    <!-- Date and Time of Event -->
                                                    <p class="category-post__list-num">
                                                        <%# Eval("Date", "{0:MMM-dd-yyyy}") %>
                                                        <br />
                                                        <%#Eval("StartTime") %> - <%#Eval("EndTime") %>
                                                    </p>
                                                </div>
                                            </div>
                                            <!-- end category post -->

                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- Organization Stats -->
                <div class="user-detail__follow element-waypoint" id="organization-stats">
                    <div class="container">
                        <h2 class="user-detail__subtitle">Stats</h2>

                        <div class="tab-content" id="tabContent">
                            <div class="tab-pane fade show active" id="stats" role="tabpanel" aria-labelledby="stats-tab">
                                <div class="user-detail__follow-box owl-wrapper">
                                    <div class="owl-carousel" data-num="3">

                                        <asp:ListView ID="ListViewOrgStats" runat="server" DataSourceID="SqlDataSourceOrgStats">
                                            <ItemTemplate>
                                                <div class="item">
                                                    <!-- Most Viewed Organizations -->
                                                    <div class="author-wrapper author-wrapper-border">
                                                        <div class="author-wrapper__profile">
                                                            <div class="row">
                                                                <div class="col-7">
                                                                    <div class="author-wrapper__content">
                                                                        <h3 class="author-wrapper__title">
                                                                            <a style="pointer-events: none; cursor: default;" href="#"><%#Eval("OrgName") %></a>
                                                                        </h3>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <ul class="author-wrapper__list">
                                                            <li>
                                                                <span>Page Views</span>
                                                                <%# Eval("PageViews") %>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- End Most Viewed Organizations-->
                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>


                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceLoginHistory">
                                            <ItemTemplate>
                                                <div class="item">
                                                    <!-- Login History -->
                                                    <div class="author-wrapper author-wrapper-border">
                                                        <div class="author-wrapper__profile">
                                                            <div class="row">
                                                                <div class="col-7">
                                                                    <div class="author-wrapper__content">
                                                                        <h3 class="author-wrapper__title">
                                                                            <a style="pointer-events: none; cursor: default;" href="#"><%#Eval("UserName") %></a>
                                                                        </h3>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <ul class="author-wrapper__list">
                                                            <li>
                                                                <span>Date</span>
                                                                <%# Eval("LoginDate", "{0:MMM-dd-yyyy}") %>
                                                            </li>
                                                            <li>
                                                                <span>Time</span>
                                                                <%# Eval("LoginDate", "{0:HH:mm:ss}") %>
                                                            </li>
                                                        </ul>
                                                        <br />
                                                        <ul class="author-wrapper__list">
                                                            <li>
                                                                <span>Organization</span>
                                                                <%# Eval("OrgName", "{0:MMM-dd-yyyy}") %>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- End Login History -->
                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Previous Activities -->
                <div class="user-detail__mylist element-waypoint" id="previous-activities">
                    <div class="container">
                        <h2 class="user-detail__subtitle">Previous Activities</h2>
                        <div class="user-detail__mylist-box iso-call">

                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePreviousActivities" CellPadding="4" ForeColor="#333333" GridLines="None" Width="800px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="ActivityTitle" HeaderText="ActivityTitle" SortExpression="ActivityTitle" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                    <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>

                        </div>
                    </div>
                </div>

                <!-- Login History -->
                <div class="user-detail__follow element-waypoint" id="login-history">
                    <div class="container">
                        <h2 class="user-detail__subtitle">Login History</h2>

                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="followers" role="tabpanel" aria-labelledby="followers-tab">
                                <div class="user-detail__follow-box owl-wrapper">
                                    <div class="owl-carousel" data-num="3">

                                        <asp:ListView ID="ActivityView" runat="server" DataSourceID="SqlDataSourceLoginHistory">
                                            <ItemTemplate>
                                                <div class="item">
                                                    <!-- Author-wrapper module -->
                                                    <div class="author-wrapper author-wrapper-border">
                                                        <div class="author-wrapper__profile">
                                                            <div class="row">
                                                                <div class="col-7">
                                                                    <div class="author-wrapper__content">
                                                                        <h3 class="author-wrapper__title">
                                                                            <a style="pointer-events: none; cursor: default;" href="#"><%#Eval("UserName") %></a>
                                                                        </h3>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <ul class="author-wrapper__list">
                                                            <li>
                                                                <span>Date</span>
                                                                <%# Eval("LoginDate", "{0:MMM-dd-yyyy}") %>
                                                            </li>
                                                            <li>
                                                                <span>Time</span>
                                                                <%# Eval("LoginDate", "{0:HH:mm:ss}") %>
                                                            </li>
                                                        </ul>
                                                        <br />
                                                        <ul class="author-wrapper__list">
                                                            <li>
                                                                <span>Organization</span>
                                                                <%# Eval("OrgName", "{0:MMM-dd-yyyy}") %>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <!-- End Author-wrapper module-->
                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
            <!-- End user-detail -->

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
