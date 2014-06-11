<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mypage.aspx.cs" Inherits="MyPage_mypage" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="ErrorMessage"
                    ControlToValidate="tbUserName" ErrorMessage="Enter user name">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Password" runat="server" Text="NewPassword" 
                    AssociatedControlID="tbNewPassword"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:PasswordStrength ID="tbNewPassword_PasswordStrength" runat="server" 
                    TargetControlID="tbNewPassword" MinimumNumericCharacters="1" 
                    MinimumSymbolCharacters="1" PreferredPasswordLength="5" 
                    DisplayPosition="AboveRight">
                </asp:PasswordStrength>
                &nbsp;(Use at least 1 number and 1 symbolic charactor)
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Label2" runat="server" Text="First name" 
                    AssociatedControlID="tbFirstName"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
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
                    ControlToValidate="tbEmail" ErrorMessage="Enter valid Email address" CssClass="ErrorMessage"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Label6" runat="server" Text="Address" 
                    AssociatedControlID="tbAddress"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbAddress" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Label3" runat="server" Text="Last name" 
                    AssociatedControlID="tbLastName"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Label5" runat="server" Text="Phone number" 
                    AssociatedControlID="tbPhone"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="Enter valid phone number(Only 10 numbers are accepted)" CssClass="ErrorMessage"
                ControlToValidate="tbPhone" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorMessage"/>
            </td>
        </tr>
    </table>
    <asp:Button ID="Submit" runat="server" Text="Submit" onclick="Submit_Click" />
    </div>
</asp:Content>

