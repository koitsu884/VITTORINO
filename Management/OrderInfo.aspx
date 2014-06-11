<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="OrderInfo.aspx.cs" Inherits="Management_OrderInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="OrderID" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" ReadOnly="True" 
                SortExpression="OrderDate" />
            <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" ReadOnly="True" 
                SortExpression="TotalPrice" />
            <asp:BoundField DataField="ItemCount" HeaderText="ItemCount" ReadOnly="True" 
                SortExpression="ItemCount" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" 
                SortExpression="CustomerID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" ReadOnly="True" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" ReadOnly="True" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" 
                SortExpression="PhoneNumber" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:VITTORINOConnectionString1 %>" 
    DeleteCommand="DELETE FROM [Order] FROM [Order] INNER JOIN OrderDetails ON [Order].OrderID = OrderDetails.OrderID WHERE ([Order].OrderID = @OrderID)" 
    SelectCommand="SELECT [Order].OrderID, [Order].OrderDate, [Order].TotalPrice, [Order].ItemCount, [Order].CustomerID, Customer.FirstName, Customer.LastName, [Order].Address, [Order].PhoneNumber FROM [Order] INNER JOIN Customer ON [Order].CustomerID = Customer.CustomerID" 
    
        UpdateCommand="UPDATE [Order] SET Address = @Address, PhoneNumber = @PhoneNumber WHERE (OrderID = @OrderID)">
        <DeleteParameters>
            <asp:Parameter Name="OrderID"/>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Address" />
            <asp:Parameter Name="PhoneNumber" />
            <asp:Parameter Name="OrderID" />
        </UpdateParameters>
</asp:SqlDataSource>
<br />
<h2>Order detail</h2>
    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:VITTORINOConnectionString1 %>" 
        SelectCommand="SELECT ProductName, Price, Quantity, OrderID FROM OrderDetails WHERE (OrderID = @OrderID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="@OrderID" 
                Name="OrderID" PropertyName="SelectedValue" DbType="Object" Type="Object" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

