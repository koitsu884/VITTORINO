using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Confirm_Click(object sender, EventArgs e)
    {
        if(Profile.SCart.getItemNum() != 0)
            Server.Transfer("~/ConfirmOrder.aspx");
    }
}