using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login_Login : System.Web.UI.Page
{
    rbmsdbEntities db = new rbmsdbEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        var data = db.UserAccounts.Where(d => d.Email == txtEmail.Text && d.Password == txtPassword.Text).FirstOrDefault();
        if (data != null)
        {
            if (data.TypeId == 2)
            {
                Session["user_type"] = 2;
                Session["username"] = txtEmail.Text;
                Session["type"] = "User";
                Session["userid"] = data.Id;
                Session["username"] = data.Email;
                Session["name"] = data.Name;
                Session["phone"] = data.Phone;
                Session["designation"] = data.Designation;
                Response.Redirect("../Default.aspx");
            }
            else if (data.TypeId == 1)
            {
                Session["user_type"] = 1;
                Session["username"] = txtEmail.Text;
                Session["type"] = "Admin";
                Session["userid"] = data.Id;
                Session["username"] = data.Email;
                Session["name"] = data.Name;
                Session["phone"] = data.Phone;
                Session["designation"] = data.Designation;
                Response.Redirect("../Admin/Default.aspx");
            }           
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "",
"alert('Invalid username or password');location.href='Login.aspx'", true);
            Session.Clear();
        }
    }
}