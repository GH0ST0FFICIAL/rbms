<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="RegisterUser.aspx.cs" Inherits="Admin_RegisterUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="breadcrumbs">
        <div class="col-sm-4">
            <div class="page-header float-left">
                <div class="page-title">
                    <h1>Register User</h1>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="page-header float-right">
                <div class="page-title">
                    <ol class="breadcrumb text-right">
                        <li><a href="#">Manage</a></li>
                        <li class="active">Register User</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <strong>Registration</strong> Form
            </div>
            <div class="card-body card-block">
                <form class="form-horizontal">
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="txtName" class=" form-control-label">Name</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <asp:TextBox ID="txtName" required="true" type="text" placeholder="Name" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="txtDesignation" class=" form-control-label">Designation</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <asp:TextBox ID="txtDesignation" required="true" type="text" placeholder="Designation" class="form-control" runat="server" MaxLength="200"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="txtPhone" class=" form-control-label">Phone</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <asp:TextBox ID="txtPhone" type="text" placeholder="Phone" class="form-control" runat="server" MaxLength="20"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="txtEmail" class=" form-control-label">Email</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <asp:TextBox ID="txtEmail" required="true" type="text" placeholder="Email" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="txtPassword" class=" form-control-label">Password</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <asp:TextBox ID="txtPassword" required="true" type="text" placeholder="Password" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                        </div>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnRegister" runat="server" type="submit" class="btn btn-primary btn-sm" Text="Register" OnClick="btnRegister_Click" />
                    </div>
            </div>
        </div>
    </div>
</asp:Content>

