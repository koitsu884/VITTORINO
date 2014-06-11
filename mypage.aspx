<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mypage.aspx.cs" Inherits="mypage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>User information</h2>
<div class = "BasicContainer">
    <table class = "basic_table">
        <tr>
            <th>
                <asp:Label ID="UserName" runat="server" Text="UserName" 
                    AssociatedControlID="tbUserName"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="tbUserName" ErrorMessage="Enter user name">*</asp:RequiredFieldValidator>
            </td>
            <td colspan="2">
</td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Password" runat="server" Text="NewPassword" 
                    AssociatedControlID="tbNewPassword"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbNewPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Label2" runat="server" Text="First name" 
                    AssociatedControlID="tbFirstName"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
            </td>
            <th colspan="2">
                <asp:Label ID="Label3" runat="server" Text="Last name" 
                    AssociatedControlID="tbLastName"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Label4" runat="server" Text="Email address" 
                    AssociatedControlID="tbEmail"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="tbEmail" ErrorMessage="Enter valid Email address" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
            <th colspan="2">
                <asp:Label ID="Label5" runat="server" Text="Phone number" 
                    AssociatedControlID="tbPhone"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Label6" runat="server" Text="Address" 
                    AssociatedControlID="tbAddress"></asp:Label>
            </th>
            <td colspan="4">
                <asp:TextBox ID="tbAddress" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
            <td colspan="2">
                <asp:Button ID="Submit" runat="server" Text="Submit" onclick="Submit_Click" />
            </td>
        </tr>
    </table>
    </div>
</asp:Content>

