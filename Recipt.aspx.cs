using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Recipt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        receipt.DataSource = Profile.SCart.Items;
        DataBind();
        TotalLabel.Text = string.Format("Total:{0,19:C}", Profile.SCart.Total);
        Profile.SCart.ClearItem();
    }
}