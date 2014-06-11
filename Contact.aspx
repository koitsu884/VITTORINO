<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<%@ Register src="Controls/ContactForm.ascx" tagname="ContactForm" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/contact.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
    function pageLoad() {
        var latlng = new google.maps.LatLng(44.224029, 12.037536);
        var opts = {
            zoom: 15,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
            };
        var map = new google.maps.Map(document.getElementById("map_canvas"), opts);
        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: 'VITTORINO'
        });
    }
    </script>
    <h2>Contact</h2>
    <div id="contact_info">
        <div id="company_info">
            <h3>Company Information</h3>
            <table class="basic_table">
                <tr>
                    <th>Company name</th><td>VITTORINO</td>
                </tr>
                <tr>
                    <th>Products</th><td>Selling leather products</td>
                </tr>
                <tr>
                    <th class="style2">Address</th><td>47*** Forlì FC, Italy</td>
                </tr>
                <tr>
                    <th class="style2">Email</th><td>abc@hotmail.com</td>
                </tr>
                <tr>
                    <th class="style2">Phone</th><td>000-1234-777</td>
                </tr>
            </table>
            <h3>Location</h3>
            <div id="map_canvas"></div>
        </div>
        <div id="feedback_form">
        <h3>Send message
            </h3>
        <uc1:ContactForm ID="ContactForm1" runat="server" />
        </div>   
    
    </div>
</asp:Content>

