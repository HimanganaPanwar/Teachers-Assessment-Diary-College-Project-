<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResearchActivities_4_Table.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.ResearchActivities_4_Table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RESEARCH ACTIVITIES TABLE </title>

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
            <asp:Button ID="BackButton" runat="server" Font-Bold="True" Font-Size="Medium" Text="<- Back to Criteria Page" CausesValidation="false" Style="height: 36px" OnClick="BackButton_Click" />
            <br />
            <br />

            <h2 style="color: white;">
                <u>(a) Seminars, Workshops, Conference Attended / Papers Presented:</u>
            </h2>

            <asp:Label ID="Label1" runat="server" Text="Teacher ID: "></asp:Label>
            <asp:Label ID="IDLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Label ID="Label4" runat="server" Text="Document Type: "></asp:Label>
            <asp:DropDownList ID="DropDownListInsert" runat="server" AutoPostBack="true" DataTextField="DocType" DataValueField="DocType">
                <asp:ListItem Value="0">--Select Document Type--</asp:ListItem>
                <asp:ListItem>Seminars</asp:ListItem>
                <asp:ListItem>Workshops</asp:ListItem>
                <asp:ListItem>Conference Attended</asp:ListItem>
                <asp:ListItem>Papers Presented</asp:ListItem>
            </asp:DropDownList>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ErrorMessage="PLEASE SELECT DOCUMENT TYPE" ControlToValidate="DropDownListInsert" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="Label5" runat="server" Text="Organising Body: "></asp:Label>
            <asp:TextBox ID="OrganisingBody_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label6" runat="server" Text="Theme of Seminar: "></asp:Label>
            <asp:TextBox ID="ThemeOfSeminar_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label7" runat="server" Text="Date: "></asp:Label>
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

            <asp:Label ID="Label8" runat="server" Text="Level :"></asp:Label>
            <asp:TextBox ID="Level_Text" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label9" runat="server" Text="Title of Paper(if Presented): "></asp:Label>
            <asp:TextBox ID="PaperTitle_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="Select Document: "></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />

            <asp:Button ID="Submit_Btn" runat="server" Text="Submit" OnClick="Insert_Btn_Click" Font-Bold="true" />
            <br />
            <br />

            <asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:RadioButtonList ID="SearchDocTypeRadioButton" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="SearchDocTypeRadioButton_SelectedIndexChanged">
                <asp:ListItem Text="All" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Seminars" Value="Seminars"></asp:ListItem>
                <asp:ListItem Text="Workshops" Value="Workshops"></asp:ListItem>
                <asp:ListItem Text="Conference Attended" Value="Conference Attended"></asp:ListItem>
                <asp:ListItem Text="Papers Presented" Value="Papers Presented"></asp:ListItem>
            </asp:RadioButtonList>
            <br />

            <p>OR</p>

            <asp:Label ID="Label10" runat="server" Text="Other: " Font-Bold="true" Font-Underline="true"></asp:Label>&emsp;
            <asp:TextBox ID="SearchTxt" runat="server" Width="207px"></asp:TextBox>
            &emsp;&emsp;&emsp;
            <asp:Button ID="SearchBtn" runat="server" Text="Search Record" OnClick="SearchBtn_Click" CausesValidation="false" Font-Bold="true" />
            <br />
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView1_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                <Columns>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandName="EditRow" CommandArgument='<%# Eval("S_No") %>' CausesValidation="false">EDIT</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="DeleteRow" CommandArgument='<%# Eval("S_No") %>' OnClientClick="return confirm('are u sure u want to delete this row');" CausesValidation="false">DELETE</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonUpdate" runat="server" CommandName="UpdateRow" CommandArgument='<%# Eval("S_No") %>' CausesValidation="false" OnClientClick="return confirm('ARE YOU SURE YOU WANT TO UPDATE THIS ROW?');">UPDATE</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancel" runat="server" CommandName="CancelUpdate" CommandArgument='<%# Eval("S_No") %>' CausesValidation="false">CANCEL</asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="S_No" InsertVisible="False" SortExpression="S_No">
                        <EditItemTemplate>
                            <asp:Label ID="EditS_No" runat="server" Text='<%# Eval("S_No") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("S_No") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Teacher_ID" SortExpression="Teacher_ID">
                        <EditItemTemplate>
                            <asp:Label ID="EditTeacher_IDLabel" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="DocumentType" SortExpression="DocumentType">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownListDoc_TypeEdit" runat="server" AutoPostBack="true" SelectedValue='<%# Bind("DocumentType") %>' DataTextField="DocType" DataValueField="DocType">
                                <asp:ListItem Value="0">--Select Document Type--</asp:ListItem>
                                <asp:ListItem>Seminars</asp:ListItem>
                                <asp:ListItem>Workshops</asp:ListItem>
                                <asp:ListItem>Conference Attended</asp:ListItem>
                                <asp:ListItem>Papers Presented</asp:ListItem>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="PLEASE SELECT DOCUMENT TYPE" ControlToValidate="DropDownListDoc_TypeEdit"></asp:RequiredFieldValidator>

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("DocumentType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="OrganisingBody" SortExpression="OrganisingBody">
                        <EditItemTemplate>
                            <asp:TextBox ID="EditOrganisingBody" runat="server" Text='<%# Bind("OrganisingBody") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("OrganisingBody") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ThemeOfSeminar" SortExpression="ThemeOfSeminar">
                        <EditItemTemplate>
                            <asp:TextBox ID="EditThemeOfSeminar" runat="server" Text='<%# Bind("ThemeOfSeminar") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ThemeOfSeminar") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date" SortExpression="Date">
                        <EditItemTemplate>
                            <asp:Label ID="EditDateLabel" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Level" SortExpression="Level">
                        <EditItemTemplate>
                            <asp:TextBox ID="EditLevel" runat="server" Text='<%# Bind("Level") %>' onkeypress="return numeric(event)"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Level") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="TitleOfPaper" SortExpression="TitleOfPaper">
                        <EditItemTemplate>
                            <asp:TextBox ID="EditTitleOfPaper" runat="server" Text='<%# Bind("TitleOfPaper") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("TitleOfPaper") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="File Name On" SortExpression="FileName">
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
