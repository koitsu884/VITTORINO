using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Context.User.Identity.Name == "")
        {
            lblResult.Text = "Please login first.";
            //Response.Write(@"<script language='javascript'>alert('Please login first.');</script>");
            return;
        }

        double Price = double.Parse(((Label)DataList1.Controls[0].FindControl("PriceLabel")).Text);
        string ProductName = ((Label)DataList1.Controls[0].FindControl("ProductNameLabel")).Text;
        string ProductImageUrl = ((Label)DataList1.Controls[0].FindControl("ImageUrlLabel")).Text;
        int ProductID = int.Parse(Request.QueryString["ProductID"]);
        int Quantity = int.Parse(((TextBox)DataList1.Controls[0].FindControl("txtQuantity")).Text);
        if (Profile.SCart == null)
        {
            Profile.SCart = new VITTORINO_ShoppingCart.Cart();
        }
        Profile.SCart.Insert(ProductID, Price, Quantity, ProductName, ProductImageUrl);
        Server.Transfer("~/ShoppingCart.aspx");
    }
}