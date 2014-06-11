<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="CustomerInfo.aspx.cs" Inherits="Management_CustomerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" DataKeyNames="CustomerID" 
    DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" 
                SortExpression="EmailAddress" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" 
                SortExpression="PhoneNumber" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:VITTORINOConnectionString1 %>" 
    DeleteCommand="DELETE FROM Customer WHERE (CustomerID = @CustomerID)" 
    SelectCommand="SELECT CustomerID, UserName, FirstName, LastName, EmailAddress, PhoneNumber, Address FROM Customer" 
    
    UpdateCommand="UPDATE Customer SET UserName = @UserName, FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, PhoneNumber = @PhoneNumber, Address = @Address WHERE (CustomerID = @CustomerID)">
        <DeleteParameters>
            <asp:Parameter Name="CustomerID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" />
            <asp:Parameter Name="FirstName" />
            <asp:Parameter Name="LastName" />
            <asp:Parameter Name="EmailAddress" />
            <asp:Parameter Name="PhoneNumber" />
            <asp:Parameter Name="Address" />
            <asp:Parameter Name="CustomerID" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

