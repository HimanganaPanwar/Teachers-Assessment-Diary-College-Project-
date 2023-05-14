<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProblems.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.ViewProblems" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="SearchBtn">
        <div>
            <asp:Button ID="BackBtn" runat="server" Text="<< BACK TO PROFILES" PostBackUrl="~/TEACHERS_PROFILES.aspx" Font-Bold="true" Font-Underline="true" OnClick="BackBtn_Click" />

            <h1><u>Problems Reported</u></h1>

            <asp:Label ID="Label1" runat="server" Text="Search any previous problem/errors: "></asp:Label>
            <asp:TextBox ID="SearchProblemTxt" runat="server"></asp:TextBox>

            <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" />

            <br />
            <br />

            <%--<asp:RadioButton ID="PendingRadioBtn" runat="server" Text="Pending" GroupName="pendingSolved" Checked="true" />
            <asp:RadioButton ID="SolvedRadioBtn" runat="server" Text="Solved" GroupName="pendingSolved" />--%>
            <asp:RadioButtonList ID="StatusRadioBtn" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="StatusRadioBtn_SelectedIndexChanged">
                <asp:ListItem Text="Pending" Value="Pending" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Solved" Value="Solved"></asp:ListItem>
            </asp:RadioButtonList>

            <br />

            <asp:Label ID="DataFoundStatus" runat="server" Text="" Font-Bold="true"></asp:Label>

            <br />

            <asp:GridView ID="GridView1" runat="server" DataKeyNames="AttachImageData" OnRowDataBound="OnRowDataBound" AllowPaging="true" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField HeaderText="S.No." DataField="S_No" SortExpression="S_No" />
                    <asp:BoundField HeaderText="Lecturer ID" DataField="Teacher_ID" />
                    <asp:BoundField HeaderText="Date" DataField="Report_Date" />
                    <asp:BoundField HeaderText="Title" DataField="Title" />
                    <asp:BoundField HeaderText="Description" DataField="Description" />

                    <asp:TemplateField HeaderText="Image Attached">
                        <ItemTemplate>
                            <asp:LinkButton ID="ViewImage" runat="server" CommandName="AttachedImg" OnClick="ViewImage_Click" Text='<%# Eval("AttachImageData") %>' CommandArgument='<%# Eval("S_No") %>' CausesValidation="false"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="ViewErrorBtn" runat="server" Text="VIEW" CommandName="ViewError" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField HeaderText="Status" DataField="Status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
