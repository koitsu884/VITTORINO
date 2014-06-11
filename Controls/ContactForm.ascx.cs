using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class ContactForm : System.Web.UI.UserControl
{
    string dbconnection = WebConfigurationManager.ConnectionStrings["VITTORINOConnectionString1"].ConnectionString;
    SqlConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (!string.IsNullOrEmpty(PhoneNumber.Text))
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
    protected void Send_Click(object sender, EventArgs e)
    {
        try
        {
            con = new SqlConnection(dbconnection);
            string insertSQL = "INSERT INTO [Recommandation] (CustomerName, Comment) VALUES (@CustomerName,@Comment)";
            SqlCommand insCmd = new SqlCommand(insertSQL, con);

            insCmd.Parameters.AddWithValue("@CustomerName", Name.Text);
            insCmd.Parameters.AddWithValue("@Comment", Comments.Text);

            con.Open();
            insCmd.ExecuteNonQuery();
        }
        finally
        {
            con.Close();
        }
    }
}