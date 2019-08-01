using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RegisterUser : System.Web.UI.Page
{
    rbmsdbEntities db = new rbmsdbEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["user_type"].ToString() != "1")
            {
                Response.Redirect("~/Login/Login.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("~/Login/Login.aspx");
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        UserAccount useraccount = new UserAccount();
        if (db.UserAccounts.Any(u => u.Email == txtEmail.Text))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Email already exists!" + "');", true);
            txtEmail.Focus();
        }
        else
        {
            useraccount.Name = txtName.Text;
            useraccount.Designation = txtDesignation.Text;
            useraccount.Phone = txtPhone.Text;
            useraccount.Email = txtEmail.Text;
            useraccount.Password = txtPassword.Text;
            useraccount.TypeId = 2;
            db.UserAccounts.Add(useraccount);
            db.SaveChanges();
        }
        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Registered Successfully!" + " Username: " + useraccount.Email + " | " + " Password: " + useraccount.Password + "');", true);

    }
}