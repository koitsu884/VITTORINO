<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:VITTORINOConnectionString1 %>" 
        
        SelectCommand="SELECT Products.ProductID, Products.ProductName, Products.Category, Products.Price, Products.Description, ProductPictures.ImageURL FROM Products INNER JOIN ProductPictures ON Products.ImageName = ProductPictures.ImageName WHERE (Products.ProductID = @ProductID2)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID2" QueryStringField="ProductID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductID" 
        DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class = "product_pic">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ImageUrl", "~\\images\\products\\{0}") %>'><asp:Image ID="Image" runat="server" ImageUrl='<%# Eval("ImageUrl", "~\\images\\products\\{0}") %>' /></asp:HyperLink><br />
                <asp:Label ID="ImageUrlLabel" runat="server" Text='<%# Eval("ImageUrl") %>' Visible="False"></asp:Label><br />
            </div>
            <div class="product_info">
            <table class = "basic_table">
            <tr>
            <th>Product name</th>
            <td><asp:Label ID="ProductNameLabel" runat="server" 
                Text='<%# Eval("ProductName") %>' Font-Bold="True" Font-Size="Large" /></td>
            </tr>
            <tr>
            <th>Price</th>
            <td><asp:Label ID="PriceLabel" runat="server" 
                Text='<%# Eval("Price", "{0:##0.00}") %>' Font-Italic="True" 
                Font-Size="Medium" ForeColor="#990000" />
            </td>
            </tr>
            <tr>
            <th>Description</th>
            <td><asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Eval("Description") %>' Font-Size="Medium" /></td>
            </tr>
            </table>
            
            
            
            <br />
            <asp:Label ID="Label1" runat="server" Text="Quantity"></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Enter quantity" ControlToValidate="txtQuantity">*</asp:RequiredFieldValidator>
<br />
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ErrorMessage="Quantity must be between 1 and 100" 
                ControlToValidate="txtQuantity" MaximumValue="100" MinimumValue="1" Type="Integer" CssClass="ErrorMessage">*</asp:RangeValidator>
            <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" 
                onclick="btnAdd_Click" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorMessage" />
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:Label ID="lblResult" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label>
</asp:Content>

