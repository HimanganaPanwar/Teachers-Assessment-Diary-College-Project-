<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resources_Table_1.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.Resources_Table_1" %>

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
            <asp:Button ID="BackButton" runat="server" Font-Bold="True" Font-Size="Medium" Text="<< BACK TO CRITERIA PAGE" CausesValidation="false" style="height: 36px" OnClick="BackButton_Click" />
            <br />
            <br />

            <h2 style="color: white;">
                <u>(h) Participation Resource Person / Panel Expert (if any):</u>
            </h2>

            <asp:Label ID="Label1" runat="server" Text="ID: "></asp:Label>
            <asp:Label ID="IDLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Label ID="Label4" runat="server" Text="Year: "></asp:Label>
            <asp:TextBox ID="YearTxt" runat="server" onkeypress="return numeric(event)"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="YearTxt" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="Label9" runat="server" Text="Organising Institution: "></asp:Label>
            <asp:TextBox ID="Organising_InstitutionTxt" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label5" runat="server" Text="Theme: "></asp:Label>
            <asp:TextBox ID="ThemeTxt" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label6" runat="server" Text="Date: "></asp:Label>
            <asp:TextBox ID="CalendarTxt" runat="server" Width="115px"></asp:TextBox>
            <asp:ImageButton ID="CalendarImageButton" runat="server" ImageUrl="~/CalendarImage/Calendar.png" OnClick="CalendarImageButton_Click" />
            <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
            <br />
            <br />

            <asp:Label ID="Label7" runat="server" Text="Level: "></asp:Label>
            <asp:TextBox ID="LevelTxt" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="Select File: "></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />

            <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="Insert_Btn_Click" BackColor="LightBlue" />
            &emsp;
            <asp:Button ID="ResetBtn" runat="server" Text="Reset" BackColor="LightGray" OnClick="ResetBtn_Click" />
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
                            <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="false" CommandName="DeleteRow" CommandArgument='<%# Eval("S_No") %>' OnClientClick="return confirm('ARE YOU SURE YOU WANT TO DELETE THIS ROW?');">DELETE</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="false" CommandName="UpdateRow" CommandArgument='<%# Eval("S_No") %>' OnClientClick="return confirm('ARE YOU SURE YOU WANT TO UPDATE THIS ROW?');">UPDATE</asp:LinkButton>
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
                            <asp:Label ID="Teacher_IDEditLabel" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
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

                    <asp:TemplateField HeaderText="Organising Institution" SortExpression="Organising_Institution">
                        <EditItemTemplate>
                            <asp:TextBox ID="Organising_InstitutionEditTxt" runat="server" Text='<%# Bind("Organising_Institution") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Organising_Institution") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Theme" SortExpression="Theme">
                        <EditItemTemplate>
                            <asp:TextBox ID="ThemeEditTxt" runat="server" Text='<%# Bind("Theme") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Theme") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date" SortExpression="Date_Value">
                        <EditItemTemplate>
                            <asp:TextBox ID="Date_ValueEditTxt" runat="server" Text='<%# Bind("Date_Value") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Date_Value") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Level" SortExpression="Level">
                        <EditItemTemplate>
                            <asp:TextBox ID="LevelEditTxt" runat="server" Text='<%# Bind("Level") %>' onkeypress="return numeric(event)"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Level") %>'></asp:Label>
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