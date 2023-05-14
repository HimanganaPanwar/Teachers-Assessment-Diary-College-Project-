<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Email_Password_Page.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.Email_Password_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="ChangePassword_Btn">
        <div>
            <asp:Button ID="BackButton" runat="server" Text="<< BACK TO GENERAL INFORMATION" OnClick="BackButton_Click1" CausesValidation="false" BackColor="LightSkyBlue" Font-Bold="true" />
            <br />
            <br />

            <asp:Label ID="Label1" runat="server" Text="Change Your Password" Font-Bold="true" Font-Underline="true" Font-Size="Larger"></asp:Label>
            <br />
            <br />

            <asp:Label ID="Label3" runat="server" Text="Bold labels with * are required fields."></asp:Label>
            <br />
            <br />

            <asp:Label ID="Label4" runat="server" Text="Lecturer ID: " Font-Bold="true"></asp:Label>
            <br />
            <asp:Label ID="Lecturer_ID_Label" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="Old Password*" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="Old_Password_Txt" runat="server"  Width="240px" TextMode="Password"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="Old_Password_Txt"></asp:RequiredFieldValidator>

            <br />
            <br />

            <asp:Label ID="Label5" runat="server" Text="New Password*" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="New_Password_Txt" runat="server" Width="240px" TextMode="Password"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="New_Password_Txt"></asp:RequiredFieldValidator>

            <br />
            <br />

            <asp:Label ID="Label6" runat="server" Text="Confirm New Password*" Font-Bold="true"></asp:Label>
            <br />
            <asp:TextBox ID="Confirm_New_Password_Txt" runat="server" Width="240px" TextMode="Password"></asp:TextBox>

            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="New Password Mismatch" ForeColor="Red" ControlToCompare="New_Password_Txt"
                ControlToValidate="Confirm_New_Password_Txt"></asp:CompareValidator>
            <br />
            <br />

            <asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Button ID="ChangePassword_Btn" runat="server" Text="Change Password" BackColor="LightBlue" Width="213px" OnClick="ChangePassword_Btn_Click"/>

            &emsp;&emsp;

            <asp:Button ID="Cancel_Btn" runat="server" Text="Cancel" BackColor="LightGray" CausesValidation="false" Width="213px" OnClick="Cancel_Btn_Click"/>
        </div>
    </form>
</body>
</html>
