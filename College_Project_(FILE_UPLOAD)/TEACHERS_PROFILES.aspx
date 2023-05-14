<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TEACHERS_PROFILES.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.TEACHERS_PROFILES" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script type="text/javascript" language="javascript">
        window.onload = function () {
            noBack();
        }
        function noBack() {
            window.history.forward();
        }
    </script>

</head>
<body>

    <form id="form1" runat="server" defaultbutton="SearchBtn">
        <div>

            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search using First Name"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:Button ID="SearchBtn" Text="Search" runat="server" OnClick="btnSearch_Click" BackColor="LightBlue"/>
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:Button ID="LogoutBtn" runat="server" Text="Logout" OnClick="LogoutBtn_Click" BackColor="LightGray" />

            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

            <asp:Button ID="ViewErrorsBtn" runat="server" Text="View Errors" OnClick="ViewErrorsBtn_Click" />

            &emsp;

            <asp:Button ID="UpdatePasswordBtn" runat="server" Text="Update Admin Password" OnClick="UpdatePasswordBtn_Click" />

            &emsp;

            <asp:Button ID="ViewDisabledAccounts" runat="server" Text="View Disabled Accounts" OnClick="ViewDisabledAccounts_Click" />

            <br />
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand"  AllowPaging="true">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="U_ID"/>
                    <asp:BoundField HeaderText="First Name" DataField="First_Name"/>
                    <asp:BoundField HeaderText="Last Name" DataField="Last_Name"/>
                    <asp:BoundField HeaderText="Email" DataField="Email"/>
                    <asp:ImageField DataImageUrlField="Profile_Image_Data" HeaderText="Profile">
                        <ControlStyle Height="150px" Width="180px" />
                    </asp:ImageField>
                    <asp:TemplateField>  
                        <ItemTemplate>  
                            <asp:Button ID="btnEdit" runat="server" Width="60" Text="VIEW" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />  
                        </ItemTemplate>  
                    </asp:TemplateField> 
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html> 