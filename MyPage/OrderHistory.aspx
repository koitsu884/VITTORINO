<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderHistory.aspx.cs" Inherits="MyPage_OrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Order history</h2>
<div id = "order_history">
    <div class = "orderBox">
        <h3>Orders</h3>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="OrderID" >
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <%-- <asp:HyperLinkField DataTextField="OrderID" DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="~/MyPage/OrderDetail.aspx?OrderID={0}" HeaderText="OrderID" />--%>
                <asp:BoundField DataField="OrderDate" HeaderText="Order date" ReadOnly="True" 
                    DataFormatString="{0:D}" />
                <asp:BoundField DataField="TotalPrice" DataFormatString="{0:c}" HeaderText="Total price" />
                <asp:BoundField DataField="ItemCount" HeaderText="Item count" ReadOnly="True" />
            </Columns>
            <EmptyDataTemplate>
                No data
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:VITTORINOConnectionString1 %>" 
        SelectCommand="SELECT [OrderID], [OrderDate], [TotalPrice], [ItemCount] FROM [Order] WHERE ([CustomerID] = @CustomerID)">
        <SelectParameters>
            <asp:ProfileParameter DefaultValue="0" Name="CustomerID" 
                PropertyName="UserDetail.CustomerID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class = "orderDetailBox">
    <h3>Order detail</h3>
        <asp:GridView ID="GridView2" runat="server" 
                DataSourceID="SqlDataSource2">
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:VITTORINOConnectionString1 %>" 
        SelectCommand="SELECT [ProductName], [Price], [Quantity] FROM [OrderDetails] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="OrderID" 
                Name="OrderID" PropertyName="SelectedValue" DbType="Object" Type="Object" />
        </SelectParameters>
    </asp:SqlDataSource>

</div>
</asp:Content>

