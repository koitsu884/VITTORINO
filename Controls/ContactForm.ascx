<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactForm.ascx.cs" Inherits="ContactForm" %>
<style type="text/css">
    .ErrorMessage
    {
        color:Red;
    }
</style>
<script type="text/javascript">
    function ValidatePhoneNumbers(source, args) { 
        var phoneNumber = document.getElementById('<%= PhoneNumber.ClientID %>');
        if (phoneNumber.value != "") {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
</script>
<table class="basic_table">
    <tr>
        <th>
            Name</th>
        <td>
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Enter your name" CssClass="ErrorMessage" 
                ControlToValidate="Name" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            E-mail address</th>
        <td>
            <asp:TextBox ID="EmailAddress" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                CssClass="ErrorMessage" Display="Dynamic" 
                ErrorMessage="Enter an e-mail address" ControlToValidate="EmailAddress">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                CssClass="ErrorMessage" Display="Dynamic" 
                ErrorMessage="Enter a valid e-mail address" 
                ControlToValidate="EmailAddress" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <th>
            E-mail address again</th>
        <td>
            <asp:TextBox ID="ConfirmEmailAddress" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                CssClass="ErrorMessage" Display="Dynamic" 
                ErrorMessage="ConfirmEmailAddress" ControlToValidate="ConfirmEmailAddress">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                CssClass="ErrorMessage" Display="Dynamic" 
                ErrorMessage="Retype the e-mail address" ControlToCompare="EmailAddress" 
                ControlToValidate="ConfirmEmailAddress">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <th>
            Phone number</th>
        <td>
            <asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="Enter valid phone number(Only 10 numbers are accepted)" CssClass="ErrorMessage"
                ControlToValidate="PhoneNumber" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                CssClass="ErrorMessage" ErrorMessage="Enter your phone number" 
                ClientValidationFunction="ValidatePhoneNumbers" Display="Dynamic" 
                onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <th>
            Comments</th>
        <td>
            <asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" Height="121px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter a comment" 
                ControlToValidate="Comments">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:Button ID="Send" runat="server" Text="Send" onclick="Send_Click" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                CssClass="ErrorMessage" />
        </td>
    </tr>
</table>

