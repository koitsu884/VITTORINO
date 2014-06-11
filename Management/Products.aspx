<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Management_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>VITTORINO - Management - Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" DataKeyNames="ProductID" 
    DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                SortExpression="ProductName" />
            <asp:TemplateField HeaderText="CategoryName" SortExpression="CategoryName">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="sourceCategory" DataTextField="CategoryName" 
                        DataValueField="CategoryID" SelectedValue='<%# Bind("Category") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:TemplateField HeaderText="ImageURL">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ImageURL", "~\\images\\products\\{0}") %>'><asp:Image runat="server" ImageURL = '<%# Eval("ThumbURL", "~\\images\\products\\{0}") %>'/></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Rows="5" 
                        Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:VITTORINOConnectionString1 %>" 
    DeleteCommand="DELETE FROM Products WHERE (ProductID = @ProductID)" 
    SelectCommand="SELECT Products.ProductID, Products.ProductName, Category.CategoryName, Products.Price, Products.Description, Products.Category, ProductPictures.ImageURL, ProductPictures.ThumbURL FROM Products INNER JOIN Category ON Products.Category = Category.CategoryID INNER JOIN ProductPictures ON Products.ImageName = ProductPictures.ImageName" 
    
        
        
        UpdateCommand="UPDATE Products SET ProductName = @ProductName, Category = @Category, Price = @Price, Description = @Description WHERE (ProductID = @ProductID)">
        <DeleteParameters>
            <asp:Parameter Name="ProductID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductName" />
            <asp:Parameter Name="Category" />
            <asp:Parameter Name="Price" />
            <asp:Parameter Name="Description" />
            <asp:Parameter Name="ProductID" />
        </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="sourceCategory" runat="server" 
    ConnectionString="<%$ ConnectionStrings:VITTORINOConnectionString1 %>" 
    SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category]">
</asp:SqlDataSource>
<h3>Add new product</h3>
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Name"></asp:Label>
            </td>
            <td colspan="2">
                &nbsp;<asp:TextBox ID="tbNewName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Enter name" ControlToValidate="tbNewFileName" 
                    ValidationGroup="AddNewProduct">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Category"></asp:Label>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="dlNewCategory" runat="server" 
                    DataSourceID="sourceCategory" DataTextField="CategoryName" 
                    DataValueField="CategoryID" ValidationGroup="AddNewProduct">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Price"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="tbNewPrice" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="tbNewPrice" ErrorMessage="Enter price" ValidationGroup="AddNewProduct">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="tbNewPrice" ErrorMessage="Enter number 0 to 10000" 
                    MaximumValue="10000" MinimumValue="0" Type="Double" ValidationGroup="AddNewProduct">*</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="tbNewDescription" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td rowspan="2">
                <asp:Label ID="Label7" runat="server" Text="Product picture"></asp:Label>
                </td>
            <td>ImageName (ex.&quot;handbag1&quot;)</td>
            <td>
                <asp:TextBox ID="tbNewFileName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="tbNewFileName" ErrorMessage="Enter image name" ValidationGroup="AddNewProduct">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Choose file:
                <br />
            </td>
            <td>
            <asp:FileUpload ID="FileUpload" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="AddNewProduct" />
            </td>
        </tr>
        </table>

    <br />
    <asp:Button ID="Send" runat="server" Text="Send" onclick="Send_Click" />
    <asp:Label ID="lblUpload" runat="server" Text=""></asp:Label>
    <br />
    </asp:Content>

