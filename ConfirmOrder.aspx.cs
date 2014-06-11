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

public partial class ConfirmOrder : System.Web.UI.Page
{
    string dbconnection = WebConfigurationManager.ConnectionStrings["VITTORINOConnectionString1"].ConnectionString;
    SqlConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CartData.DataSource = Profile.SCart.Items;
            DataBind();
            TotalLabel.Text = string.Format("Total:{0,19:C}", Profile.SCart.Total);

            if (Profile.UserDetail != null)
            {
                tbFirstName.Text = Profile.UserDetail.FirstName;
                tbLastName.Text = Profile.UserDetail.LastName;
                tbEmail.Text = Profile.UserDetail.Email;
                tbPhone.Text = Profile.UserDetail.Phone;
                tbAddress.Text = Profile.UserDetail.Address;
            }
        }
    }

    protected void Confirm_Click(object sender, EventArgs e)
    {
        if (Context.User.Identity.Name != "")
        {
            RefleshUserDetailInfo();
            CreateOrderTable();
            Response.Redirect("Recipt.aspx");
        }
        else 
        {
            Response.Write(@"<script language='javascript'>alert('Please login first before you can complete your order.');</script>");
        }
    }

    private void RefleshUserDetailInfo()
    {
        Profile.UserDetail.FirstName = tbFirstName.Text;
        Profile.UserDetail.LastName = tbLastName.Text;
        Profile.UserDetail.Email = tbEmail.Text;
        Profile.UserDetail.Phone = tbPhone.Text;
        Profile.UserDetail.Address = tbAddress.Text;
    }

    private void CreateOrderTable()
    {
        

        try
        {
            string insertOrderSQL;
            string insertOrderDetailSQL1;

            con = new SqlConnection(dbconnection);
            insertOrderSQL = "INSERT INTO [Order] (CustomerID, OrderDate, TotalPrice, ItemCount, Address, PhoneNumber) VALUES (@CustomerID,@OrderDate,@TotalPrice,@ItemCount,@Address,@Phone)";
            insertOrderDetailSQL1 = "INSERT INTO [OrderDetails] (OrderID, ProductName, Price, Quantity) VALUES (@OrderID, @ProductName, @Price, @Quantity)";
            SqlCommand insCmdOrder = new SqlCommand(insertOrderSQL, con);
            SqlCommand insCmdOrderDetails;

            insCmdOrder.Parameters.AddWithValue("@CustomerID", Profile.UserDetail.CustomerID);
            insCmdOrder.Parameters.AddWithValue("@OrderDate", DateTime.Now);
            insCmdOrder.Parameters.AddWithValue("@TotalPrice", Profile.SCart.Total);
            insCmdOrder.Parameters.AddWithValue("@ItemCount", Profile.SCart.getItemNum());
            insCmdOrder.Parameters.AddWithValue("@Address", Profile.UserDetail.Address);
            insCmdOrder.Parameters.AddWithValue("@Phone", Profile.UserDetail.Phone);
            con.Open();
            insCmdOrder.ExecuteNonQuery();

            //Get this order id (@@identity: return record ID which is inserted last time)
            string query2 = "Select @@Identity";
            insCmdOrder.CommandText = query2;
            int tempOrderID = Convert.ToInt32(insCmdOrder.ExecuteScalar());

            for (int j = 0; j < Profile.SCart.getItemNum(); j++)
            {
                insCmdOrderDetails = new SqlCommand(insertOrderDetailSQL1, con);
                insCmdOrderDetails.Parameters.AddWithValue("@OrderID", tempOrderID);
                insCmdOrderDetails.Parameters.AddWithValue("@ProductName", Profile.SCart.Items[j].ProductName);
                insCmdOrderDetails.Parameters.AddWithValue("@Price", Profile.SCart.Items[j].Price);
                insCmdOrderDetails.Parameters.AddWithValue("@Quantity", Profile.SCart.Items[j].Quantity);
                insCmdOrderDetails.ExecuteNonQuery();
            }
        }
        finally
        {
            con.Close(); 
        }
    }
}