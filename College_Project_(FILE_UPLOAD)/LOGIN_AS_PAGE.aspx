<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOGIN_AS_PAGE.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.LOGIN_AS_PAGE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoginAs</title>
    <style type="text/css">
            body{  
                background:url(Images/5.jfif);
                background-size:cover; 
            }

            h1{
                text-align:center;
            }

            .Box
		    {
			    border: 5px solid grey;
                background-color: transparent;
			    background-position: center;
			    height: 450px;
			    width: 400px;
                color: white;
			    margin-top: 150px;
                margin-left: 500px;
		    }

            .btn{
                height: 50px;
                width: 150px;
                font-size: 20px;
                margin-top: 55px;
                margin-left: 120px;
            }
            btn:hover{}
        </style>
        <link rel="stylesheet"  href="StyleSheet1.css"/>
    </head>
    <body>
        <form id="form1" runat="server">
            <div class="Box">
                <hr />
                <h1>LOGIN AS...</h1>
                <hr />
                <asp:Button ID="AdminLoginBtn" runat="server" Text="ADMIN" Font-Bold="true" CssClass="btn" OnClick="AdminLoginBtn_Click" /><br /><br /><br /><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                ------------------ OR ------------------<br />
                <asp:Button ID="LecturerLoginBtn" runat="server" Text="LECTURER"  Font-Bold="true" CssClass="btn" OnClick="LecturerLoginBtn_Click" />
            </div>
        </form>
    </body>
</html>