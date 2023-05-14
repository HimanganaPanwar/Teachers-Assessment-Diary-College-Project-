<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportProblem.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.ReportProblem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Problem Page</title>
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
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="BackBtn" runat="server" Text="<< BACK" OnClick="BackBtn_Click" />
            <br />
            <br />

            <asp:Label ID="ReportProblemLbl" runat="server" Text="REPORT PROBLEM" Font-Bold="true" Font-Underline="true" Font-Size="XX-Large"></asp:Label>
            <br />
            <br />

            <asp:Label ID="Label1" runat="server" Text="TEACHER ID: "></asp:Label>
            <asp:Label ID="TeacherIDLbl" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Label ID="DateLbl" runat="server" Text="DATE" AssociatedControlID="DateCalendar"></asp:Label>
            <asp:TextBox ID="DateTxt" runat="server"></asp:TextBox>
            <asp:ImageButton ID="DateImageBtn" runat="server" ImageUrl="~/Images/1.png" Height="27px" Width="29px" OnClick="DateImageBtn_Click" />
            <asp:Calendar ID="DateCalendar" runat="server" OnDayRender="DateCalendar_DayRender" OnSelectionChanged="DateCalendar_SelectionChanged"></asp:Calendar>
            <br />
            <br />

            <asp:TextBox ID="TitleTxt" runat="server" placeholder="Title" Width="400px"></asp:TextBox>
            <br />
            <br />

            <asp:TextBox ID="DescTxt" runat="server" TextMode="MultiLine" Columns="80" Rows="10" placeholder="Description...."></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="ATTACH PHOTO(optional): "></asp:Label>
            <asp:FileUpload ID="AttachPhoto" runat="server" />
            <asp:Label ID="ImageStatusLbl" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="SubmitBtn_Click" />
            <br />
            <br />

            <asp:Label ID="UploadStatusLbl" runat="server" Text="" Font-Bold="true"></asp:Label>

            <br />
            <br />

            <asp:RadioButtonList ID="StatusRadioBtn" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="StatusRadioBtn_SelectedIndexChanged">
                <asp:ListItem Text="Pending" Value="Pending" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Solved" Value="Solved"></asp:ListItem>
            </asp:RadioButtonList>

            <asp:GridView ID="GridView1" runat="server" DataKeyNames="AttachImageData" OnRowDataBound="OnRowDataBound" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField HeaderText="S.No." DataField="S_No" SortExpression="S_No" />
                    <asp:BoundField HeaderText="Lecturer ID" DataField="Teacher_ID" />
                    <asp:BoundField HeaderText="Date" DataField="Report_Date" />
                    <asp:BoundField HeaderText="Title" DataField="Title" />
                    <asp:BoundField HeaderText="Description" DataField="Description" />
                    <asp:TemplateField HeaderText="Image Attached">
                        <ItemTemplate>
                            <asp:LinkButton ID="ViewImage" runat="server" CommandName="AttachedImg" OnClick="ViewImage_Click" Text='<%# Eval("AttachImageData") %>' CommandArgument='<%# Eval("Teacher_ID") %>' CausesValidation="false"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Status" DataField="Status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
