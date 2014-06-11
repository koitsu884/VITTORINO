<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manage data</title>
</head>
<body>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        DataSourceID="VITTORINOEntities">
    </asp:DetailsView>
    <asp:EntityDataSource ID="VITTORINOEntities" runat="server">
    </asp:EntityDataSource>
    </body>
</html>
