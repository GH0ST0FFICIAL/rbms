<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MakeRequisition.aspx.cs" Inherits="MakeRequisition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="breadcrumbs">
        <div class="col-sm-4">
            <div class="page-header float-left">
                <div class="page-title">
                    <h1>Make Requisition</h1>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="page-header float-right">
                <div class="page-title">
                    <ol class="breadcrumb text-right">
                        <li><a href="#">Manage</a></li>
                        <li><a href="#">Requisition</a></li>
                        <li class="active">Make Requisition</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <strong>Requisition</strong> Form
            </div>
            <div class="card-body card-block">
                <div class="row form-group">
                    <div class="col col-md-3">
                        <label for="txtItemName" class="form-control-label">Item Name</label>
                    </div>
                    <div class="col-12 col-md-9">
                        <asp:TextBox ID="txtItemName" type="text" placeholder="Item" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" Text="required"
                            ControlToValidate="txtItemName" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3">
                        <label for="txtQuantity" class="form-control-label">Quantity</label>
                    </div>
                    <div class="col-12 col-md-9">
                        <asp:TextBox ID="txtQuantity" type="text" placeholder="0" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" Text="required"
                            ControlToValidate="txtQuantity" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3">
                        <label for="txtDescription" class=" form-control-label">Description</label>
                    </div>
                    <div class="col-12 col-md-9">
                        <asp:TextBox ID="txtDescription" type="text" placeholder="Description" class="form-control" runat="server" TextMode="MultiLine" Rows="3" MaxLength="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" Text="required"
                            ControlToValidate="txtDescription" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col col-md-3">
                        <label for="txtUnitPrice" class=" form-control-label">Unit Cost (BDT)</label>
                    </div>
                    <div class="col-12 col-md-9">
                        <asp:TextBox ID="txtUnitPrice" type="number" placeholder="0" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            runat="server" Text="required"
                            ControlToValidate="txtUnitPrice" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <asp:Button ID="btnAdd" class="btn btn-primary btn-sm" runat="server" Text="Add Item" OnClick="btnAdd_Click" OnClientClick="if ( ! Done()) return false;"
                        meta:resourcekey="btnDoneResource1" />
                </div>
            </div>
            <div class="card-body card-block">
                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemId" EmptyDataText="There are no data records to display." OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Item Id" SortExpression="ItemId" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item" SortExpression="ItemName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Quantity") %>' TextMode="Number"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Description") %>' Rows="4" TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Unit Cost (BDT)" SortExpression="UnitPrice">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("UnitPrice") %>' TextMode="Number"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Cost (BDT)" SortExpression="TotalPrice">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("TotalPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Update" OnClientClick="if ( ! Done()) return false;"
                                    meta:resourcekey="btnDoneResource1"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" OnClientClick="if ( ! Done()) return false;"
                                    meta:resourcekey="btnDoneResource1"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Remove" OnClientClick="if ( ! Done()) return false;"
                                    meta:resourcekey="btnDoneResource1"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Panel ID="panelSubtotal" Visible="false" runat="server">
                    <div class="row form-group" style="margin-bottom: 60px">
                        <div class="col col-md-3">
                            Total Amount (BDT): <strong>
                                <asp:Label ID="lblSubtotal" runat="server"></asp:Label></strong>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="panelConfirm" Visible="false" runat="server">
                    <div class="card-footer">
                        <asp:Button ID="btnConfirm" CausesValidation="false" class="btn btn-success btn-sm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" OnClientClick="if ( ! Done()) return false;"
                            meta:resourcekey="btnDoneResource1" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

    <script>
        function Done() {
            return confirm("Are you sure?");
        }
    </script>
</asp:Content>

