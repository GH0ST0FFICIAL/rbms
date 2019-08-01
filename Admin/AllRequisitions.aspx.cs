using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AllRequisitions : System.Web.UI.Page
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

        showData();
    }
    private void showData()
    {
        var data = db.RequisitionInfoes.GroupBy(d => d.RequisitionNo).Select(d => d.FirstOrDefault()).OrderByDescending(d => d.Date).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected override void InitializeCulture()
    {
        CultureInfo ci = new CultureInfo("bn-BD");
        ci.NumberFormat.CurrencySymbol = " &#2547";
        //ci.NumberFormat.CurrencySymbol = " BDT";
        Thread.CurrentThread.CurrentCulture = ci;
        base.InitializeCulture();

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        showData();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label lblRequisitionNo = (Label)GridView1.SelectedRow.Cells[0].FindControl("Label1") as Label;
        Label lblRequisitionDate = (Label)GridView1.SelectedRow.Cells[8].FindControl("Label2") as Label;
        Label lblRequisitionSubTotal = (Label)GridView1.SelectedRow.Cells[1].FindControl("Label3") as Label;
        Label lblUserId = (Label)GridView1.SelectedRow.Cells[9].FindControl("Label4") as Label;


        string requisitionNo = lblRequisitionNo.Text;
        var data = db.RequisitionInfoes.Where(d => d.RequisitionNo == requisitionNo).ToList();
        if (data != null)
        {
            panelRequisition.Visible = false;
            panelRequisitionDetails.Visible = true;

            int requisitionerId = Convert.ToInt32(lblUserId.Text);
            var requisitioner = db.UserAccounts.Where(d => d.Id == requisitionerId).FirstOrDefault();

            lblRequisitionerName.Text = requisitioner.Name;
            lblDesignation.Text = requisitioner.Designation;
            lblPhone.Text = requisitioner.Phone;
            lblRequisitionNo2.Text = requisitionNo;
            lblDate.Text = lblRequisitionDate.Text;
            lblSubtotal.Text = lblRequisitionSubTotal.Text;

            GridView2.DataSource = data;
            GridView2.DataBind();
        }

    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        panelRequisition.Visible = true;
        panelRequisitionDetails.Visible = false;
    }
}