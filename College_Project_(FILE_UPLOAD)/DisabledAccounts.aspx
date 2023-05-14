<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisabledAccounts.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.DisabledAccounts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>

        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("You sure you wanna enable this account?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
            return false;
        }

        function wasDisabled() {
            alert('Account was enabled successfully!');
            return false;
        }

        function alertMessage() {
            alert('Account was not enabled!');
            return false;   //TO PREVENT PAGE REFRESH / PAGE LOADING
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="SearchAccountBtn">
        <div>
            <asp:Button ID="backBtn" runat="server" Text="<< BACK TO PROFILES" PostBackUrl="~/TEACHERS_PROFILES.aspx" OnClick="backBtn_Click" />

            <br />
            <br />

            <asp:Label ID="Label1" runat="server" Text="DISABLED ACCOUNTS" Font-Bold="true" Font-Size="X-Large" Font-Underline="true"></asp:Label>

            <br />
            <br />

            <asp:Label ID="Label3" runat="server" Text="Logged in as: "></asp:Label>
            <asp:Label ID="LoggedAdminLbl" runat="server" Text=""></asp:Label>

            <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="Search Account: "></asp:Label>
            <asp:TextBox ID="SearchAccountTxt" runat="server"></asp:TextBox>
            &emsp;
            <asp:Button ID="SearchAccountBtn" runat="server" Text="Search" OnClick="SearchAccountBtn_Click" />

            <br />
            <br />

            <asp:Label ID="SearchStatusLbl" runat="server" Text="" Font-Bold="true"></asp:Label>

            <br />
            <br />

            <asp:GridView ID="GridView1" runat="server" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField HeaderText="Lecturer ID" DataField="U_ID" SortExpression="U_ID" />
                    <asp:BoundField HeaderText="First Name" DataField="First_Name" />
                    <asp:BoundField HeaderText="Last Name" DataField="Last_Name" />
                    <asp:BoundField HeaderText="Email" DataField="Email" />
                    <asp:BoundField HeaderText="Phone Number" DataField="PhoneNo" />
                    <asp:BoundField HeaderText="Account Status" DataField="AccountStatus" />

                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="EnableAccountBtn" runat="server" Text="ENABLE A/C" OnClientClick="Confirm()" CommandName="EnableAccount" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
