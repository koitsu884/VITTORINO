using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class register : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    private string s;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Confirm_Click(object sender, EventArgs e)
    {
        s = WebConfigurationManager.ConnectionStrings["VITTORINOConnectionString1"].ConnectionString;
        con = new SqlConnection(s);
        con.Open();

        string hashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text, "SHA1");

        string cmdString = "insert into Customer values('" + UserName.Text + "','" + hashPassword + "','" + 2 + "','" + FirstName.Text +
            "','" + LastName.Text + "','" + Email.Text + "','" + PhoneNumber.Text + "','" + Address.Text +  "')";

        cmd = new SqlCommand(cmdString, con);

        cmd.ExecuteNonQuery();
        

        Response.Write(@"<script language='javascript'>alert('Registration Successful!');</script>");

        con.Close();

        if (Profile.UserDetail == null)
        {
            Profile.UserDetail = new VITTORINO_User.UserDetail();
        }
    }

    void RedirectFromLoginPage(string username, string role, bool persistent)
    {
        //Create ticket for authenticate
        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
            1,//Version
            username,
            DateTime.Now,
            DateTime.Now.AddMinutes(60),    //set expire time
            persistent,
            role);

        //Add authentication information to cookie (Session may be better to use...)
        HttpCookie cookie = new HttpCookie(
            FormsAuthentication.FormsCookieName,
            FormsAuthentication.Encrypt(ticket));

        if (persistent)
        {
            cookie.Expires = DateTime.Now.AddYears(50); //set 50year if persistent is true
        }
        Response.Cookies.Add(cookie);
        Response.Redirect("~/accountCreated.aspx");

        //Redirect to the page where user intended to access
        //Response.Redirect(FormsAuthentication.GetRedirectUrl(username, persistent));
    }
}