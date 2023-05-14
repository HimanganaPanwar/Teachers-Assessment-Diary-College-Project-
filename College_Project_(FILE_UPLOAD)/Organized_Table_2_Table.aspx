<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Organized_Table_2_Table.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.Organized_Table_2_Table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript" language="javascript">
        function numeric(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && ((charCode >= 48 && charCode <= 57) || charCode == 46))
                return true;
            else {
                alert('Please Enter Numeric values.');
                return false;
            }
        }
    </script>

    <style>
        body {
            background-image: linear-gradient(to right, orange,yellow);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="BackButton" runat="server" Font-Bold="True" Font-Size="Medium" Text="<< BACK TO CRITERIA PAGE" CausesValidation="false" Style="height: 36px" OnClick="BackButton_Click" />
            <br />
            <br />

            <h2 style="color: white;">
                <u>(g) Extension Lectures given (if any):</u>
            </h2>

            <asp:Label ID="Label1" runat="server" Text="ID: "></asp:Label>
            <asp:Label ID="IDLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Label ID="Label4" runat="server" Text="Year: "></asp:Label>
            <asp:TextBox ID="YearTxt" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
            &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="YearTxt" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="Label5" runat="server" Text="Name of the Organization Body: "></asp:Label>
            <asp:TextBox ID="OrganizationNameTxt" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label6" runat="server" Text="Date: "></asp:Label>
            <asp:TextBox ID="CalendarTxt" runat="server" Width="115px"></asp:TextBox>
            <asp:ImageButton ID="CalendarImageButton" runat="server" ImageUrl="~/CalendarImage/Calendar.png" OnClick="CalendarImageButton_Click" />
            <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
            <br />
            <br />

            <asp:Label ID="Label7" runat="server" Text="Level: "></asp:Label>
            <asp:TextBox ID="LevelTxt" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label8" runat="server" Text="Subject of the Lecture: "></asp:Label>
            <asp:TextBox ID="SubjectTxt" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="Select File: "></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />

            <asp:Button ID="Insert_Btn" runat="server" Text="Submit" OnClick="Insert_Btn_Click" BackColor="LightBlue" />
            &emsp;
            <asp:Button ID="Reset_Btn" runat="server" Text="Reset" BackColor="LightGray" CausesValidation="false" OnClick="Reset_Btn_Click" />
            <br />
            <br />

            <asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Panel ID="Panel1" runat="server" DefaultButton="SearchBtn">
                <asp:Label ID="Label10" runat="server" Text="Search: " Font-Bold="true" Font-Underline="true"></asp:Label>
                <asp:TextBox ID="SearchTxt" runat="server" Width="207px"></asp:TextBox>
                &emsp;&emsp;&emsp;
                <asp:Button ID="SearchBtn" runat="server" Text="Search Record" OnClick="SearchBtn_Click" CausesValidation="false" Font-Bold="true" />
            </asp:Panel>
            <br />
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView1_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                <Columns>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="false" CommandName="EditRow" CommandArgument='<%# Eval("S_No") %>'>EDIT</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="false" CommandName="DeleteRow" CommandArgument='<%# Eval("S_No") %>' OnClientClick="return confirm('ARE YOU SURE YOU WANT TO DELETE THIS ROW');">DELETE</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="false" CommandName="UpdateRow" CommandArgument='<%# Eval("S_No") %>' OnClientClick="return confirm('ARE YOU SURE YOU WANT TO UPDATE THIS ROW');">UPDATE</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="false" CommandName="CancelUpdate" CommandArgument='<%# Eval("S_No") %>'>CANCEL</asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="S.No." InsertVisible="False" SortExpression="S_No">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("S_No") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("S_No") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Lecturer ID" SortExpression="Teacher_ID">
                        <EditItemTemplate>
                            <asp:Label ID="EditTeacher_IDLabel" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Year" SortExpression="Year">
                        <EditItemTemplate>
                            <asp:TextBox ID="YearEditTxt" runat="server" Text='<%# Bind("Year") %>' onkeypress="return numeric(event)"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Name of Organisation body" SortExpression="Organisation_Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="Organisation_NameEditTxt" runat="server" Text='<%# Bind("Organisation_Name") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Organisation_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date" SortExpression="Date_Value">
                        <EditItemTemplate>
                            <asp:TextBox ID="Date_ValueEditTxt" runat="server" Text='<%# Bind("Date_Value") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Date_Value") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Level" SortExpression="Level">
                        <EditItemTemplate>
                            <asp:TextBox ID="LevelEditTxt" runat="server" Text='<%# Bind("Level") %>' onkeypress="return numeric(event)"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Level") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject of the Lecture" SortExpression="Lecture_Subject">
                        <EditItemTemplate>
                            <asp:TextBox ID="Lecture_SubjectEditTxt" runat="server" Text='<%# Bind("Lecture_Subject") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Lecture_Subject") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                        <EditItemTemplate>
                            <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="File Name" SortExpression="FileName">
                        <EditItemTemplate>
                            <asp:TextBox ID="EditFileName" runat="server" Text='<%# Bind("FileName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelFileName" runat="server" Text='<%# Bind("FileName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="ViewDocument" runat="server" Text="VIEW DOCUMENT" CommandName="DownloadDoc" CommandArgument='<%# Eval("S_No") %>' CausesValidation="false"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>

        </div>
    </form>
</body>
</html>
