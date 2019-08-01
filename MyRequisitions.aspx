<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyRequisitions.aspx.cs" Inherits="MyRequisitions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="../js/printPage.js"></script>
    <div class="breadcrumbs">
        <div class="col-sm-4">
            <div class="page-header float-left">
                <div class="page-title">
                    <h1>My Requisitions</h1>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="page-header float-right">
                <div class="page-title">
                    <ol class="breadcrumb text-right">
                        <li><a href="#">Manage</a></li>
                        <li><a href="#">Requisition</a></li>
                        <li class="active">My Requisitions</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <asp:Panel ID="panelMyRequisition" Visible="true" runat="server">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" EmptyDataText="There are no data records to display." OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" Visible="False" />
                                        <asp:TemplateField HeaderText="RequisitionNo" SortExpression="RequisitionNo">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RequisitionNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" Visible="False" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" Visible="False" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" Visible="False" />
                                        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" Visible="False" />
                                        <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" Visible="False" />
                                        <asp:TemplateField HeaderText="TotalRequisition" SortExpression="TotalRequisition">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("TotalRequisition", "{0:C}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date" SortExpression="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" Visible="False" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="View Details"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                            <asp:Panel ID="panelRequisitionDetails" Visible="false" runat="server">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <asp:Button ID="btnBack" class="btn btn-primary btn-sm" runat="server" Text="Go Back" OnClick="btnBack_Click" />
                                    </div>
                                </div>
                                <div class="card-body card-block" id="printableArea">
                                    <div style="margin-bottom: 40px">
                                        <h3 class="text-center">SOLUTIONNEST REQUISITION FORM</h3>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-12">
                                            Requisition ID: <strong>
                                                <asp:Label ID="lblRequisitionNo2" runat="server"></asp:Label></strong>
                                        </div>
                                    </div>
                                    <div>
                                        <h4>Requisitioner Information</h4>
                                        <hr />
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-12 col-md-9">
                                            Date:
                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-12 col-md-9">
                                            <asp:Label ID="lblRequisitionerName" runat="server" Text=""></asp:Label>, 
                                            <asp:Label ID="lblDesignation" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-12 col-md-9">
                                            <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                                        </div>
                                        ,
                        <div class="col-12 col-md-9">
                        </div>
                                    </div>
                                    <div>
                                        <h4>Items Information</h4>
                                        <hr />
                                    </div>
                                    <div style="margin-bottom: 20px">
                                        <asp:GridView ID="GridView2" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" EmptyDataText="There are no data records to display.">
                                            <Columns>
                                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                                                <asp:BoundField DataField="RequisitionNo" HeaderText="RequisitionNo" SortExpression="RequisitionNo" Visible="False" />
                                                <asp:BoundField DataField="ItemName" HeaderText="Item" SortExpression="ItemName" />
                                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Cost (BDT)" SortExpression="UnitPrice" DataFormatString="{0:C}" HtmlEncode="false" />
                                                <asp:BoundField DataField="TotalPrice" HeaderText="Total Cost (BDT)" SortExpression="TotalPrice" DataFormatString="{0:C}" HtmlEncode="false" />
                                                <asp:BoundField DataField="TotalRequisition" HeaderText="TotalRequisition" SortExpression="TotalRequisition" Visible="False" />
                                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" Visible="False" />
                                                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" Visible="False" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <div class="row form-group" style="margin-bottom: 60px">
                                        <div class="col col-md-3">
                                            Total Amount (BDT): <strong>
                                                <asp:Label ID="lblSubtotal" runat="server"></asp:Label></strong>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-6">
                                            <table class="col-md-12">
                                                <tr>
                                                    <td>Requisitioner Signature</td>
                                                    <td>Approval Signature</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <input id="btnPrint" type="button" value="Print" class="btn btn btn-warning btn-sm" onclick="printDiv('printableArea')" />
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- .animated -->
    </div>
    <!-- .content -->
</asp:Content>
