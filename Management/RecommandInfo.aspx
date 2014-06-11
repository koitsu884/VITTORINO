<%@ Page Title="" Language="C#" MasterPageFile="~/Management.master" AutoEventWireup="true" CodeFile="RecommandInfo.aspx.cs" Inherits="Management_RecommandInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" 
                SortExpression="CustomerName" />
            <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Columns="100" Rows="5" 
                        Text='<%# Bind("Comment") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:VITTORINOConnectionString1 %>" 
    DeleteCommand="DELETE FROM Recommandation WHERE (ID = @ID)" 
    SelectCommand="SELECT Recommandation.* FROM Recommandation" 
    UpdateCommand="UPDATE Recommandation SET CustomerName = @CustomerName, Comment = @Comment WHERE (ID = @ID)">
        <DeleteParameters>
            <asp:Parameter Name="ID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerName" />
            <asp:Parameter Name="Comment" />
            <asp:Parameter Name="ID" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

