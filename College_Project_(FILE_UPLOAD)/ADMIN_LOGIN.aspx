<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADMIN_LOGIN.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.ADMIN_LOGIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login As Admin</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">  
        $(document).ready(function () {
            $('#show_password').hover(function show() {
                //Change the attribute to text  
                $('#txtPassword').attr('type', 'text');
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            },
                function () {
                    //Change the attribute back to password  
                    $('#txtPassword').attr('type', 'password');
                    $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                });
            //CheckBox Show Password  
            $('#ShowPassword').click(function () {
                $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
            });
        });
    </script>

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            background: url(Images/6.jfif);
            background-size: cover;
            font-family: sans-serif;
        }

        .loginbox {
            width: 320px;
            height: 420px;
            background: url(Images/9.jfif);
            background-size: cover;
            color: white;
            top: 50%;
            left: 50%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 60px 35px;
        }

        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            position: absolute;
            top: -50px;
            left: calc(50% - 50px);
        }

        h1 {
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 22px;
        }

        .loginbox p {
            margin: 0;
            padding: 0;
            font-weight: bold;
        }

        .loginbox input {
            width: 100%;
            margin-bottom: 20px;
        }

            .loginbox input[type="text"], input[type="password"] {
                border: none;
                border-bottom: 1px solid #fff;
                background: transparent;
                outline: none;
                height: 40px;
                color: #fff;
                font-size: 16px;
            }

            .loginbox input[type="submit"]:hover {
                cursor: pointer;
                background: #ced4da;
                color: black;
            }

        .loginbox a {
            text-decoration: none;
            font-size: 12px;
            line-height: 20px;
            color: darkgrey;
        }

            .loginbox a:hover {
                color: #c4b774;
            }

        .auto-style1 {
            display: block;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
        }
    </style>
</head>
<body>
    <div class="loginbox">

        <img src="Images/icon2.png" class="avatar" />

        <h1>Login As Admin</h1>

        <form id="form1" runat="server" defaultbutton="submit">

            <asp:Label ID="Username" runat="server" Text="Username"></asp:Label>

            <asp:TextBox ID="UsernameTxt" runat="server" placeholder="Enter Username"></asp:TextBox>

            <asp:Label ID="Pass_word" runat="server" Text="Password"></asp:Label>

            <div class="input-group">

                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="auto-style1" Width="200px" placeholder="Enter Password"></asp:TextBox>
                
                <div class="input-group-append">
                    <asp:Button ID="show_password" runat="server" Height="40px" Width="50px" Text="Show" Font-Size="Smaller" />
                </div>

            </div>

            <asp:Button ID="submit" runat="server" Text="Login" OnClick="btnLogin_Click" />
            <br />

            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <br />

            <a href="ForgotPassword_Page.aspx">Lost Your Password?</a>
            <br />

            <a href="REGISTRATION_PAGE.aspx">Don't have an account</a>
        </form>
    </div>
</body>
</html>
