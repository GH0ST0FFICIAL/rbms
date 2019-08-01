<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RBMS | Login</title>
    <link rel="stylesheet" href="css/style.css?v={3/version-1}" />

    <link href='//fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <!-- For-Mobile-Apps-and-Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Simple Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //For-Mobile-Apps-and-Meta-Tags -->

</head>
<body>

    <form id="form1" runat="server">
        <div class="container w3">
            <h2>Login Now</h2>
            <div class="username">
                <br />
                <span class="username">Email:</span>

                <asp:TextBox ID="txtEmail" type="text" class="name" runat="server" placeholder="Email" required="true"></asp:TextBox>
                <div class="clear"></div>
            </div>
            <div class="password-agileits">
                <span class="username">Password:</span>
                <asp:TextBox ID="txtPassword" type="password" runat="server" class="password" placeholder="Password" required="true"></asp:TextBox>
                <div class="clear"></div>
            </div>
            <div class="login-w3">
                <asp:Button ID="btnLogin" class="login" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </div>
            <br />
            <div class="clear"></div>
        </div>
    </form>
</body>
</html>
