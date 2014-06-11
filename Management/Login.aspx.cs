using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Management_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string loginName = ((Login)sender).UserName;
        string password = ((Login)sender).Password;
        string dbconnection = WebConfigurationManager.ConnectionStrings["VITTORINOConnectionString1"].ConnectionString;
        string customerlogin = "SELECT * FROM [Customer] WHERE UserName= '" + loginName + "' AND RoleID ='" + 1 + "' AND Password='" + password + "'";


        SqlConnection con = new SqlConnection(dbconnection);
        SqlCommand custCmd = new SqlCommand(customerlogin, con);

        SqlDataReader custReader;

        con.Open();
        custReader = custCmd.ExecuteReader();

        if (custReader.Read())
        {
            int userRole = Convert.ToInt32(custReader["RoleID"]);
            string userName = custReader["UserName"].ToString();

            //Create settion with 3 parameter
            string[] userdetails = new string[3] { custReader["CustomerID"].ToString(), 
                custReader["UserName"].ToString(), custReader["RoleID"].ToString() };
            Session["UserDetails"] = userdetails;

            FormsAuthentication.SetAuthCookie(userdetails[1].ToString(), true);
            Response.Redirect("Index.aspx");
        }
        else
        {
            ((Login)sender).FailureText = "Login Failed. Please check your username and password";
        }
        con.Close();
    }
}