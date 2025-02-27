﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class RequisitionInfo
{
    public int Id { get; set; }
    public string RequisitionNo { get; set; }
    public string ItemName { get; set; }
    public Nullable<int> Quantity { get; set; }
    public string Description { get; set; }
    public Nullable<decimal> UnitPrice { get; set; }
    public Nullable<decimal> TotalPrice { get; set; }
    public Nullable<decimal> TotalRequisition { get; set; }
    public Nullable<System.DateTime> Date { get; set; }
    public Nullable<int> UserId { get; set; }

    public virtual UserAccount UserAccount { get; set; }
}

public partial class UserAccount
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public UserAccount()
    {
        this.RequisitionInfoes = new HashSet<RequisitionInfo>();
    }

    public int Id { get; set; }
    public string Name { get; set; }
    public string Designation { get; set; }
    public string Phone { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public Nullable<int> TypeId { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<RequisitionInfo> RequisitionInfoes { get; set; }
    public virtual UserType UserType { get; set; }
}

public partial class UserType
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public UserType()
    {
        this.UserAccounts = new HashSet<UserAccount>();
    }

    public int Id { get; set; }
    public string Type { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<UserAccount> UserAccounts { get; set; }
}
