using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MakeRequisition : System.Web.UI.Page
{
    rbmsdbEntities db = new rbmsdbEntities();
    public static List<Items> itemList = new List<Items>();

    string requisitionNo = Guid.NewGuid().ToString("N");
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Items items = new Items();

        items.ItemName = txtItemName.Text;
        items.Quantity = Convert.ToInt32(txtQuantity.Text);
        items.Description = txtDescription.Text;
        items.UnitPrice = Convert.ToInt32(txtUnitPrice.Text);

        int quantity = Convert.ToInt32(txtQuantity.Text);
        int unitprice = Convert.ToInt32(txtUnitPrice.Text);
        int result = quantity * unitprice;

        items.TotalPrice = Convert.ToInt32(result);

        var timeZone = TimeZoneInfo.FindSystemTimeZoneById("Bangladesh Standard Time");
        var now = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, timeZone);
        string date = now.ToString("yyyy-MM-dd hh:mm:ss tt");

        items.Date = date;

        items.UserId = Convert.ToInt32(Session["userid"]);

        itemList.Add(items);

        GridView1.DataSource = itemList;
        GridView1.DataBind();
        //clearInput();
        int sum = 0;
        //for (int i = 0; i < GridView1.Rows.Count; ++i)
        //{
        //    sum += Convert.ToInt32(GridView1.Rows[i].Cells[5].Text);
        //}
        foreach (GridViewRow row1 in GridView1.Rows)
        {
            sum += int.Parse(((Label)(row1.Cells[5].FindControl("Label6"))).Text);
        }
        panelSubtotal.Visible = true;
        panelConfirm.Visible = true;
        lblSubtotal.Text = sum.ToString();
        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Items Added!" + "');", true);
    }
    private void clearInput()
    {
        txtItemName.Text = string.Empty;
        txtQuantity.Text = string.Empty;
        txtDescription.Text = string.Empty;
        txtUnitPrice.Text = string.Empty;
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        RequisitionInfo rinfo = new RequisitionInfo();

        foreach (var item in (List<Items>)itemList.ToList())
        {
            rinfo.RequisitionNo = requisitionNo;
            rinfo.ItemName = item.ItemName;
            rinfo.Quantity = item.Quantity;
            rinfo.Description = item.Description;
            rinfo.UnitPrice = item.UnitPrice;
            rinfo.TotalPrice = item.TotalPrice;
            rinfo.Date = Convert.ToDateTime(item.Date);
            rinfo.UserId = item.UserId;
            rinfo.TotalRequisition = Convert.ToDecimal(lblSubtotal.Text);

            db.RequisitionInfoes.Add(rinfo);
            db.SaveChanges();
            ScriptManager.RegisterStartupScript(this, GetType(), "",
"alert('Requisition Confirmed');location.href='MakeRequisition.aspx'", true);
            itemList.Clear();
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblItemId = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;
        TextBox txtItemName = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
        TextBox txtQuantity = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
        TextBox txtDescription = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
        TextBox txtUnitPrice = GridView1.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;

        int itemId = Convert.ToInt32(lblItemId.Text);
        var data = itemList.Where(d => d.ItemId == itemId).FirstOrDefault();

        if (data!=null)
        {
            data.ItemName = txtItemName.Text;
            data.Quantity = Convert.ToInt32(txtQuantity.Text);
            data.Description = txtDescription.Text;
            data.UnitPrice = Convert.ToInt32(txtUnitPrice.Text);
            data.TotalPrice = data.Quantity * data.UnitPrice;
            GridView1.EditIndex = -1;
            GridView1.DataSource = itemList;
            GridView1.DataBind();
            int sum = 0;
            //for (int i = 0; i < GridView1.Rows.Count; ++i)
            //{
            //    sum += Convert.ToInt32(GridView1.Rows[i].Cells[5].Text);
            //}
            foreach (GridViewRow row1 in GridView1.Rows)
            {
                sum += int.Parse(((Label)(row1.Cells[5].FindControl("Label6"))).Text);
            }
            lblSubtotal.Text = sum.ToString();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Data Updated!');", true);
        }

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = itemList;
        GridView1.DataBind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridView1.DataSource = itemList;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblItemId = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;
        int itemId = Convert.ToInt32(lblItemId.Text);
        var data = itemList.Where(d => d.ItemId == itemId).FirstOrDefault();
        itemList.Remove(data);
        GridView1.DataSource = itemList;
        GridView1.DataBind();
        int sum = 0;
        //for (int i = 0; i < GridView1.Rows.Count; ++i)
        //{
        //    sum += Convert.ToInt32(GridView1.Rows[i].Cells[5].Text);
        //}
        foreach (GridViewRow row1 in GridView1.Rows)
        {
            sum += int.Parse(((Label)(row1.Cells[5].FindControl("Label6"))).Text);
        }
        lblSubtotal.Text = sum.ToString();
    }
}