<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConfirmOrder.aspx.cs" Inherits="ConfirmOrder" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class = "CartData">
<h3>Items in your shopping cart</h3>
<asp:GridView ID="CartData" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl", "~/images/products/thumb_{0}") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="ProductName" HeaderText="Product" ReadOnly="True" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True"  />
        <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" ReadOnly="True" />
        <asp:BoundField DataField="SubTotal" DataFormatString="{0:c}" HeaderText="Total"
            ReadOnly="True" />
    </Columns>
    <EmptyDataTemplate>
        Your Shopping Cart is empty
    </EmptyDataTemplate>
</asp:GridView>
<asp:Label ID="TotalLabel" runat="server"></asp:Label>
</div>
<div class = "BasicTable">
<h3>Customer information</h3>
    <table class = "basic_table">
        <tr>
            <th>
                <asp:Label ID="Label2" runat="server" Text="First name" 
                    AssociatedControlID="tbFirstName"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="tbFirstName" ErrorMessage="Enter first name">*</asp:RequiredFieldValidator>
            </td>
            <th>
                <asp:Label ID="Label3" runat="server" Text="Last name" 
                    AssociatedControlID="tbLastName"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="tbLastName" ErrorMessage="Enter last name">*</asp:RequiredFieldValidator>
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
            <th>
                <asp:Label ID="Label5" runat="server" Text="Phone number" 
                    AssociatedControlID="tbPhone"></asp:Label>
            </th>
            <td>
                <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="tbPhone" ErrorMessage="Enter phone number">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <asp:Label ID="Label6" runat="server" Text="Address" 
                    AssociatedControlID="tbAddress"></asp:Label>
            </th>
            <td colspan="3">
                <asp:TextBox ID="tbAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="tbAddress" ErrorMessage="Enter address">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
    </table>
</div>
    <asp:Button ID="Confirm" runat="server" Text="Confirm order" 
        onclick="Confirm_Click" />
    <asp:ConfirmButtonExtender ID="Confirm_ConfirmButtonExtender" runat="server" 
        ConfirmText="Are you sure you wanted to confirm order?" 
        TargetControlID="Confirm">
    </asp:ConfirmButtonExtender>
</asp:Content>

