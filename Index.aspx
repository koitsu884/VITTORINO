<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/Index.css" rel="stylesheet" type="text/css" />



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--  <script>
        $(function () {
            $('#slides').slidesjs({
                width: 800,
                height: 450,
                navigation: false,
                play: {
                  auto: true,
                  interval: 4000,
                  pauseOnHover: false,
                  restartDelay: 25
                }
            });
        });
    </script>--%>
    <script type="text/javascript">
        jQuery(function ($) {
            $('.box').mosaic({
                animation: 'slide'
            });
        });
    </script>
 
    <div id="main_contents">
        <ul class="section01 section">
        <li class="box">
        <div class="titleBg"><a href="products/Wallets.aspx" rel="nofollow"><img src="images/layout/section1.jpg" alt="wallets" /></a></div>
        <div class="tileOverlay"><a href="products/Wallets.aspx" rel="nofollow">Wallets</a></div>
        </li>
        <li class="box">
        <div class="tileBg"><a href="products/Cardcases.aspx" rel="nofollow"><img src="images/layout/section_cc.jpg" alt="card cases" /></a></div>
        <div class="tileOverlay"><a href="products/Cardcases.aspx" rel="nofollow">Card cases</a></div>
        </li>
        <li class="box">
        <div class="tileBg"><img src="images/layout/home_section.jpg"/></div>
        </li>
        </ul>

        <ul class="section02 section">
        <li class="box">
        <div class="tileBg"><a href="products/Handbags.aspx" rel="nofollow"><img src="images/layout/section_bag.jpg" alt="card cases" /></a></div>
        <div class="tileOverlay"><a href="products/Handbags.aspx" rel="nofollow">Hand bags</a></div>
        </li>
        </ul>

        <ul class="section03 section">
        <li class="box">
        <div class="tileBg"><a href="Aboutus.aspx" rel="nofollow"><img src="images/layout/section_aboutus.jpg" alt="about us" /></a></div>
        <div class="tileOverlay"><a href="Aboutus.aspx" rel="nofollow">About us</a></div>
        </li>
        <li class="box">
        <div class="tileBg"><a href="MyPage/Mypage.aspx" rel="nofollow"><img src="images/layout/section_mypage.jpg" alt="My page" /></a></div>
        <div class="tileOverlay"><a href="MyPage/Mypage.aspx" rel="nofollow">My page</a></div>
        </li>
        </ul>


        <%--  <div id="slides">
            <img src="images/whatsnew/whatsnew_1.jpg"/>
            <img src="images/whatsnew/whatsnew_2.jpg"/>
            <img src="images/whatsnew/whatsnew_3.jpg"/>
            <a href="#" class="slidesjs-previous slidesjs-navigation"><i class="icon-chevron-left icon-large"></i></a>
            <a href="#" class="slidesjs-next slidesjs-navigation"><i class="icon-chevron-right icon-large"></i></a>
        </div>--%>
     </div>

 
</asp:Content>

