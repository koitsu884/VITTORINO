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


public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (SiteMap.CurrentNode != null)
        {
            if (SiteMap.CurrentNode.ParentNode == null)
            {
                SiteMapPath1.Visible = false;
            }
        }
        if (Profile.SCart != null)
        {
            int cartCnt = Profile.SCart.getItemNum();
            lblCart.Text = cartCnt + " items in the cart";
        }

    }
    protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
    {
        string loginName = ((Login)sender).UserName;
        string password = ((Login)sender).Password;
        string hashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
        string dbconnection = WebConfigurationManager.ConnectionStrings["VITTORINOConnectionString1"].ConnectionString;
        string customerlogin = "SELECT  * FROM Customer INNER JOIN Role ON Customer.RoleID = Role.Id WHERE UserName= '" + loginName + "' AND Password='" + hashPassword + "'";
        //string customerlogin = "SELECT UserName, RoleID, RoleName Password FROM [Customer] WHERE UserName= '" + loginName + "' AND RoleID ='" + 2 + "' AND Password='" + password + "'";

        SqlConnection con = new SqlConnection(dbconnection);
        SqlCommand custCmd = new SqlCommand(customerlogin, con);

        SqlDataReader custReader;

        con.Open();
        custReader = custCmd.ExecuteReader();

        if (custReader.Read())
        {
            int userRole = Convert.ToInt32(custReader["RoleID"]);
            string userName = custReader["UserName"].ToString();
            string roleName = custReader["RoleName"].ToString();


            if (Profile.UserDetail == null)
            {
                Profile.UserDetail = new VITTORINO_User.UserDetail();
            }

            Profile.UserDetail.CustomerID = Convert.ToInt32(custReader["CustomerID"]);
            Profile.UserDetail.Password = custReader["Password"].ToString();
            Profile.UserDetail.UserName = custReader["UserName"].ToString();
            Profile.UserDetail.RoleName = custReader["RoleName"].ToString();
            Profile.UserDetail.FirstName = custReader["FirstName"].ToString();
            Profile.UserDetail.LastName = custReader["LastName"].ToString();
            Profile.UserDetail.Email = custReader["EmailAddress"].ToString();
            Profile.UserDetail.Phone = custReader["PhoneNumber"].ToString();
            Profile.UserDetail.Address = custReader["Address"].ToString();


            //RedirectFromLoginPage(Profile.UserDetail.UserName, Profile.UserDetail.RoleName, false);
            RedirectFromLoginPage(custReader["UserName"].ToString(), roleName, false);
            //FormsAuthentication.RedirectFromLoginPage(userdetails[1].ToString(), true);
            //FormsAuthentication.SetAuthCookie(userdetails[0].ToString(), true);
            //Response.Redirect("Index.aspx");
        }
        else
        {
            ((Login)sender).FailureText = "Login Failed. Please check your username and password";
        }

        con.Close();
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
        Response.Redirect("~/Index.aspx");

        //Redirect to the page where user intended to access
        //Response.Redirect(FormsAuthentication.GetRedirectUrl(username, persistent));
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["search"] = tbSearch.Text;
        Server.Transfer("~/SearchResult.aspx");
    }
}
