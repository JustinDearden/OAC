<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="a_contact.aspx.cs" Inherits="oac.a_contact" %>

<!doctype html>

<html lang="en" class="no-js">
<head>
    <title>OAC - Contact</title>

    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/ymca-assets.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <!-- Container -->
    <form runat="server">
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
                                    <a class="active" href="a_contact.aspx">Contact</a>
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

            <!-- contact-page -->
            <section class="contact-page">
                <div class="container">
                    <span class="contact-page__short-title">
                        <!--our contact information-->
                    </span>
                    <h1 class="contact-page__title">Contact Us
                    </h1>

                    <div class="row">
                        <div class="col-lg-8 col-md-8">

                            <!-- Contact form -->
                            <form class="contact-form" id="contact-form">
                                <h2 class="contact-form__title">Contact Form
                                </h2>
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:TextBox ID="Name" class="contact-form__input-text" placeholder="Name:" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="Email" class="contact-form__input-text" placeholder="Email:" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:TextBox ID="Subject" class="contact-form__input-text" placeholder="Subject:" runat="server"></asp:TextBox>
                                <asp:TextBox ID="Message" class="contact-form__textarea" placeholder="Message:" runat="server"></asp:TextBox>
                                <asp:Button ID="Submit" class="contact-form__submit" runat="server" Text="Submit" OnClick="Submit_Click" />
                            </form>
                            <!-- End Contact form -->

                        </div>

                        <div class="col-lg-3 offset-lg-1 col-md-4">

                            <!-- contact-post -->
                            <div class="contact-post">
                                <i class="la la-map-marker"></i>
                                <div class="contact-post__content">
                                    <h2 class="contact-post__title">Location:
                                    </h2>
                                    <p class="contact-post__description">
                                        <a href="https://www.google.com/maps/place/500+Victoria+Ave,+Windsor,+ON+N9A+4M8">500 Victoria Ave, Windsor, ON N9A 4M8 </a>
                                    </p>
                                </div>
                            </div>
                            <!-- End contact-post -->

                            <!-- contact-post -->
                            <div class="contact-post">
                                <i class="la la-phone"></i>
                                <div class="contact-post__content">
                                    <h2 class="contact-post__title">Phone:
                                    </h2>
                                    <p class="contact-post__description">
                                        <a href="tel:519-258-9622">(519) 258-9622</a>
                                    </p>
                                </div>
                            </div>
                            <!-- End contact-post -->

                            <!-- contact-post -->
                            <div class="contact-post">
                                <i class="la la-envelope"></i>
                                <div class="contact-post__content">
                                    <h2 class="contact-post__title">Email:
                                    </h2>
                                    <p class="contact-post__description">
                                        <a href="mailto:kkhaj@ymcawo.ca">kkhaj@ymcawo.ca</a>
                                    </p>
                                </div>
                            </div>
                            <!-- End contact-post -->

                        </div>

                    </div>

                </div>
            </section>
            <!-- End Contact Page -->

            <!-- map block -->
            <div class="contact-map">
                <div id="mapSingle" data-latitude="42.314684" data-longitude="-83.039262" data-map-icon="la la-map-marker"></div>
            </div>
            <!-- End map block -->


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
