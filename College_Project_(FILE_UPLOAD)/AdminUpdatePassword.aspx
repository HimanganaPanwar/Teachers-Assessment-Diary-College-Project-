<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUpdatePassword.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.AdminUpdatePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="BackBtn" runat="server" Text="<< BACK TO PROFILES" PostBackUrl="~/TEACHERS_PROFILES.aspx" OnClick="BackBtn_Click" />

            <br />
            <br />

            <asp:Label ID="Label4" runat="server" Text="Update Admin Password" Font-Underline="True" Font-Bold="True" Font-Size="X-Large"></asp:Label>

            <br />
            <br />

            <asp:Label ID="Label5" runat="server" Text="Currently logged in as: "></asp:Label>
            <asp:Label ID="LoggedAdminID" runat="server" Text=""></asp:Label>

            <br />
            <br />
            
            <asp:Label ID="Label1" runat="server" Text="Select Admin: "></asp:Label>
            <asp:DropDownList ID="selectAdminDDL" runat="server">
                <asp:ListItem Value="" Selected="True">---- Select Admin ----</asp:ListItem>
                <asp:ListItem Value="admin1@gmail.com">admin1@gmail.com</asp:ListItem>
                <asp:ListItem Value="admin2@gmail.com">admin2@gmail.com</asp:ListItem>
            </asp:DropDownList>

            <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="New Password: "></asp:Label>
            <asp:TextBox ID="newPasswordTxt" runat="server" TextMode="Password"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label3" runat="server" Text="Confirm Password: "></asp:Label>
            <asp:TextBox ID="confirmPasswordTxt" runat="server" TextMode="Password"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="updateStatusLbl" runat="server" Text="" Font-Bold="true"></asp:Label>

            <br />
            <br />

            <asp:Button ID="updatePasswordBtn" runat="server" Text="Update Password" OnClick="updatePasswordBtn_Click" />

            &emsp;

            <asp:Button ID="cancelBtn" runat="server" Text="Cancel" OnClick="cancelBtn_Click" />
        </div>
    </form>
</body>
</html>
