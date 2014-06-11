<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Create new account</h2>
    <div id = "register_table" >
    <table class = "basic_table">
        <tr>
            <th>
                <asp:Label ID="Label1" runat="server" Text="User name"></asp:Label>
            </th>
            <td colspan="2">
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                &nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="UserName" ErrorMessage="Enter user name" 
                        CssClass="ErrorMessage">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            </th>
            <td colspan="3">
                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:PasswordStrength ID="Password_PasswordStrength" runat="server" 
                    TargetControlID="Password" MinimumNumericCharacters="1" 
                    MinimumSymbolCharacters="1" PreferredPasswordLength="5" 
                    DisplayPosition="AboveRight">
                </asp:PasswordStrength>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Password" ErrorMessage="Enter password" 
                        CssClass="ErrorMessage">*</asp:RequiredFieldValidator>&nbsp;(Use at least 1 number and 1 symbolic charactor)</td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Label3" runat="server" Text="Confirm password"></asp:Label>
            </th>
            <td colspan="3">
                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="ConfirmPassword" ErrorMessage="Confirm password" 
                        CssClass="ErrorMessage">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                        ErrorMessage="Retype password" CssClass="ErrorMessage">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <th>
                First name</th>
            <td colspan="3">
                <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                Last name</th>
            <td colspan="3">
                <asp:TextBox ID="LastName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>
                Email</th>
            <td colspan="3">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="Email" ErrorMessage="Enter valid email address" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        CssClass="ErrorMessage">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <th>
                Address</th>
            <td colspan="3">
                <asp:TextBox ID="Address" runat="server"></asp:TextBox>&nbsp;
            </td>
        </tr>
        <tr>
            <th>
                Phone&nbsp;number</th>
            <td colspan="3">
                <asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Only 10 numbers are allowed." 
                        ControlToValidate="PhoneNumber" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorMessage" />
            </td>
            <td colspan="2">
                <asp:Button ID="Confirm" runat="server" Text="Confirm" 
                    onclick="Confirm_Click" />
            </td>
        </tr>
    </table>
    </div>
    </asp:Content>


