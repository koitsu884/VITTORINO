<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<%@ Register Src="~/Controls/CartControl.ascx" TagName="CartControl" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <uc1:CartControl ID="CartControl2" runat="server" />
    <br />
    <asp:Button ID="Confirm" runat="server" Text="Confirm order" 
            onclick="Confirm_Click" />
    </div>
</asp:Content>

