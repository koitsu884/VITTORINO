using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class SearchResult : System.Web.UI.Page
{
    string dbconnection = WebConfigurationManager.ConnectionStrings["VITTORINOConnectionString1"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (PreviousPage != null)
        {
           /* Control placeHolder =
                PreviousPage.Controls[0].FindControl("ContentPlaceHolder1");
            TextBox SourceTextBox =
                (TextBox)placeHolder.FindControl("tbSearch");
            TextBox SourceTextBox =
                (TextBox)PreviousPage.FindControl("tbSearch");
            if (SourceTextBox == null)
            {
                return;
            }*/
            String searchText = Session["search"].ToString();
            if (searchText == null)
                return;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    //cmd.CommandText = "SELECT [ProductID], [ProductName], [Price], [ThumbURL], [Description]  FROM [Products] INNER JOIN [ProductPictures] ON Products.ImageName = ProductPictures.ImageName WHERE [ProductName] LIKE '%" + SourceTextBox.Text + "%'";
                    cmd.CommandText = "SELECT [ProductID], [ProductName], [Price], [ThumbURL], [Description]  FROM [Products] INNER JOIN [ProductPictures] ON Products.ImageName = ProductPictures.ImageName WHERE [ProductName] LIKE '%" + searchText + "%'";
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                }
            }
        }


    }
}