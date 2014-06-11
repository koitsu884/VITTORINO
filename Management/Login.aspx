<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Management_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:Login ID="Login1" runat="server" onauthenticate="Login1_Authenticate">
</asp:Login>
</asp:Content>

