using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        logout.ServerClick += Logout_ServerClick;
    }
    private void Logout_ServerClick(object sender, EventArgs e)
    {
        Session.Clear();
        Session["user_type"] = null;
        Session["userid"] = null;
        Response.Redirect("~/Login/Login.aspx");
    }
}
