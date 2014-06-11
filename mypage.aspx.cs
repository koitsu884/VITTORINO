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

public partial class mypage : System.Web.UI.Page
{
    string dbconnection = WebConfigurationManager.ConnectionStrings["VITTORINOConnectionString1"].ConnectionString;
    static string currentPassword = "";
    static string currentCustomerID = ""; 
    //static int currentCustomerID;

    protected void Page_Load(object sender, EventArgs e)
    {


            if (Profile.UserDetail != null)
            {
                currentCustomerID = Profile.UserDetail.CustomerID.ToString();
                tbUserName.Text = Profile.UserDetail.UserName;
                currentPassword = Profile.UserDetail.Password;
                tbFirstName.Text = Profile.UserDetail.FirstName;
                tbLastName.Text = Profile.UserDetail.LastName;
                tbEmail.Text = Profile.UserDetail.Email;
                tbPhone.Text = Profile.UserDetail.Phone;
                tbAddress.Text = Profile.UserDetail.Address;

                return;
            }

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        lblResult.Text = "";
        SqlConnection conn = new SqlConnection(dbconnection);
        string updateuser = "UPDATE [Customer] SET UserName = @userName,"
                            + "Password = @password, "
                            + "FirstName = @firstName, "
                            + "LastName = @lastName, "
                            + "EmailAddress = @email, "
                            + "PhoneNumber = @phone, "
                            + "Address = @address "
                            + "WHERE CustomerID = @custid";

        SqlCommand updatecmd = new SqlCommand(updateuser, conn);
   
        //updatecmd.Parameters.AddWithValue("@custid", int.Parse(currentCustomerID));
        updatecmd.Parameters.AddWithValue("@custid", currentCustomerID);
        updatecmd.Parameters.AddWithValue("@userName", tbUserName.Text);
        if (tbNewPassword.Text == "")
        {
            updatecmd.Parameters.AddWithValue("@password", currentPassword);
        }
        else
        {
            updatecmd.Parameters.AddWithValue("@password", tbNewPassword.Text);
            currentPassword = tbNewPassword.Text;
        }
        
        updatecmd.Parameters.AddWithValue("@firstName", tbFirstName.Text);
        updatecmd.Parameters.AddWithValue("@lastName", tbLastName.Text);
        updatecmd.Parameters.AddWithValue("@phone", tbPhone.Text);
        updatecmd.Parameters.AddWithValue("@email", tbEmail.Text);
        updatecmd.Parameters.AddWithValue("@address", tbAddress.Text);

        try
        {
            conn.Open();
            updatecmd.ExecuteNonQuery();

            Profile.UserDetail.CustomerID = Convert.ToInt32(currentCustomerID);
            Profile.UserDetail.UserName = tbUserName.Text;
            Profile.UserDetail.Password = currentPassword;
            Profile.UserDetail.FirstName = tbFirstName.Text;
            Profile.UserDetail.LastName = tbLastName.Text;
            Profile.UserDetail.Email = tbEmail.Text;
            Profile.UserDetail.Phone = tbPhone.Text;
            Profile.UserDetail.Address = tbAddress.Text;

            lblResult.Text = "Updated Successful!";
        }
        catch (Exception error)
        {
            lblResult.Text = "Error occured during updating. ";
            lblResult.Text += error.Message;
        }
        finally
        {
            conn.Close();
        }
    }
}