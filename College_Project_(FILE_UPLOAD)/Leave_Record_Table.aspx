<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leave_Record_Table.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.Leave_Record_Table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LEAVE RECORD TABLE </title>

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
        <div id="googlemaps">
        </div>
        <div id="contactform">
            <asp:Button ID="BackButton" runat="server" Font-Bold="True" CausesValidation="false" Font-Size="Medium" Text="<< BACK TO CRITERIA" OnClick="BackButton_Click" />
            <br />
            <br />

            <h2 style="color: white;">
                <u>> Leave Record:</u>
            </h2>
            <br />

            <asp:Panel ID="InsertionPanel" runat="server" DefaultButton="FirstInsertButton">
                <asp:Label ID="TeacherIDFirstInsertLabel" runat="server" Text="Teacher ID: "></asp:Label>
                <asp:Label ID="TeacherIDFirstInsertTxt" runat="server" Text=""></asp:Label>
                <br />
                <br />

                <asp:Label ID="YearFirstInsertLabel" runat="server" Text="Year: "></asp:Label>
                <asp:TextBox ID="YearFirstInsertTxt" runat="server" onkeypress="return numeric(event)"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="YearFirstInsertTxt"></asp:RequiredFieldValidator>
                <br />
                <br />

                <asp:Label ID="Casual_LeaveFirstInsertLabel" runat="server" Text="Casual Leave (no. of casual leaves taken): "></asp:Label>
                <asp:TextBox ID="Casual_LeaveFirstInsertTxt" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="Extraordinary_LeaveFirstInsertLabel" runat="server" Text="Extraordinary Leave: Periods (with Days)"></asp:Label>
                <asp:TextBox ID="Extraordinary_LeaveFirstInsertTxt" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="Academic_LeaveFirstInsertLabel" runat="server" Text="Academic Leave(no.): "></asp:Label>
                <asp:TextBox ID="Academic_LeaveFirstInsertTxt" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="Duty_LeaveFirstInsertLabel" runat="server" Text="Duty Leave: "></asp:Label>
                <asp:TextBox ID="Duty_LeaveFirstInsertTxt" runat="server" TextMode="Number"></asp:TextBox>
                <br />
                <br />

                <asp:Button ID="FirstInsertButton" runat="server" Text="Insert" OnClick="FirstInsertButton_Click"></asp:Button>
                &emsp;
                <asp:Button ID="ResetButton" runat="server" Text="Reset" OnClick="ResetButton_Click"></asp:Button>
                <br />
                <br />

                <asp:Label ID="StatusDisplayLabel" runat="server" Text=""></asp:Label>
                <br />
                <br />
            </asp:Panel>

            <asp:Panel ID="SearchPanel" runat="server" DefaultButton="SearchBtn">
                <asp:Label ID="Label8" runat="server" Text="Search: " Font-Bold="true" Font-Underline="true"></asp:Label>
                <asp:TextBox ID="SearchTxt" runat="server" Width="207px"></asp:TextBox>
                &emsp;&emsp;&emsp;
                <asp:Button ID="SearchBtn" runat="server" Text="Search Record" OnClick="SearchBtn_Click" CausesValidation="false" Font-Bold="true" />
                <br />
                <br />
            </asp:Panel>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView1_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging1">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="false" CommandName="EditRow" CommandArgument='<%# Eval("S_No") %>'>EDIT</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="DeleteRow" CausesValidation="false" CommandArgument='<%# Eval("S_No") %>' OnClientClick="return confirm('are u sure u want to delete this row');">DELETE</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonUpdate" runat="server" CommandName="UpdateRow" CausesValidation="false" CommandArgument='<%# Eval("S_No") %>' OnClientClick="return confirm('ARE YOU SURE YOU WANT TO UPDATE THIS ROW?');">UPDATE</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonCancel" runat="server" CommandName="CancelUpdate" CausesValidation="false" CommandArgument='<%# Eval("S_No") %>'>CANCEL</asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="S No" InsertVisible="False" SortExpression="S_No">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("S_No") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("S_No") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Lecturer ID" SortExpression="Teacher_ID" InsertVisible="false">
                        <EditItemTemplate>
                            <asp:Label ID="EditTeacherID" runat="server" Text='<%# Eval("Teacher_ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Year" SortExpression="Year">
                        <EditItemTemplate>
                            <asp:TextBox ID="YearUpdateTxt" runat="server" Text='<%# Bind("Year") %>' onkeypress="return numeric(event)"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Casual Leave" SortExpression="Casual_Leave">
                        <EditItemTemplate>
                            <asp:TextBox ID="Casual_LeaveUpdateTxt" runat="server" Text='<%# Bind("Casual_Leave") %>' onkeypress="return numeric(event)"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Casual_Leave") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Extraordinary Leave" SortExpression="Extraordinary_Leave">
                        <EditItemTemplate>
                            <asp:TextBox ID="Extraordinary_LeaveUpdateTxt" runat="server" Text='<%# Bind("Extraordinary_Leave") %>' onkeypress="return numeric(event)"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Extraordinary_Leave") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Academic Leave" SortExpression="Academic_Leave">
                        <EditItemTemplate>
                            <asp:TextBox ID="Academic_LeaveUpdateTxt" runat="server" Text='<%# Bind("Academic_Leave") %>' onkeypress="return numeric(event)"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Academic_Leave") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Duty Leave" SortExpression="Duty_Leave">
                        <EditItemTemplate>
                            <asp:TextBox ID="Duty_LeaveUpdateTxt" runat="server" Text='<%# Bind("Duty_Leave") %>' onkeypress="return numeric(event)"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Duty_Leave") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>

            </center>
        </div>
    </form>
</body>
</html>
