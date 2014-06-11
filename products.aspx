<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <h2>Our Products</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:VITTORINOConnectionString1 %>" 
            
            SelectCommand="SELECT Products.ProductID, Products.ProductName, Products.Price, ProductPictures.ThumbURL FROM Products INNER JOIN ProductPictures ON Products.ImageName = ProductPictures.ImageName"></asp:SqlDataSource>
        <div class="BasicContainer">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
            RepeatColumns="5" ShowFooter="False" CellPadding="3" BackColor="#DEBA84" 
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" 
                GridLines="Both">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <div class = "productBox">
                    <div class = "productImage"><asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl='<%# Eval("ThumbURL", "~\\images\\products\\{0}") %>' PostBackUrl='<%# Eval("ProductID", "~/ProductDetails.aspx?ProductID={0}") %>' />
                    </div>
                    <div class = "productName">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ProductID", "~/ProductDetails.aspx?ProductID={0}") %>' ><asp:Label ID="Name" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label></asp:HyperLink>
                    </div>
                    <div class = "productPrice">
                    <asp:Label ID="Price" runat="server" Text='<%# Eval("Price", "{0:C}") %>'></asp:Label>
                    </div>
                </div>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        </div>
    </div>
</asp:Content>

