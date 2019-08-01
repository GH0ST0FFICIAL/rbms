using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Items
/// </summary>
public class Items
{
    public Items()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    
    public int ItemId { get; set; }
    public string RequisitionNo { get; set; }
    public string ItemName { get; set; }
    public int Quantity { get; set; }
    public string Description { get; set; }
    public int UnitPrice { get; set; }
    public int TotalPrice { get; set; }
    public string Date { get; set; }
    public int UserId { get; set; }

}