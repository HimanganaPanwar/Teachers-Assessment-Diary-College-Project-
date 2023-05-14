<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Extra_Curricular_Activities.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.Extra_Curricular_Activities" %>

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
                <u>V. Extra-Curricular:</u>
            </h2>

            <asp:Label ID="Label1" runat="server" Text="Teacher ID: "></asp:Label>
            <asp:Label ID="IDLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Panel ID="Panel1" runat="server" DefaultButton="Insert_Btn">
                <asp:Label ID="Label4" runat="server" Text="Year: "></asp:Label>
                <asp:TextBox ID="Year_Text" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Year_Text"></asp:RequiredFieldValidator>
                <br />
                <br />

                <asp:Label ID="Label5" runat="server" Text="Activity Name: "></asp:Label>
                <asp:TextBox ID="Activity_Name_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="Label6" runat="server" Text="Convener Member: "></asp:Label>
                <asp:TextBox ID="Convener_Member_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="Label7" runat="server" Text="Contribution: "></asp:Label>
                <asp:TextBox ID="Contribution_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
                <br />
                <br />

                <asp:Button ID="Insert_Btn" runat="server" Text="Submit" OnClick="Insert_Btn_Click" BackColor="LightBlue" />
                &emsp;
                <asp:Button ID="Reset_Btn" runat="server" Text="Reset" CausesValidation="false" BackColor="LightGray" OnClick="Reset_Btn_Click"/>
                <br />
                <br />

                <asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label>
                <br />
                <br />
            </asp:Panel>

            <asp:Panel ID="Panel2" runat="server" DefaultButton="SearchBtn">
                <asp:Label ID="Label8" runat="server" Text="Search: " Font-Bold="true" Font-Underline="true"></asp:Label>
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

                    <asp:TemplateField HeaderText="Name of Activity" SortExpression="Activity_Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="Activity_NameEditTxt" runat="server" Text='<%# Bind("Activity_Name") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Activity_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Convener/Member" SortExpression="Convener_Member">
                        <EditItemTemplate>
                            <asp:TextBox ID="Convener_MemberEditTxt" runat="server" Text='<%# Bind("Convener_Member") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Convener_Member") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Your Contribution" SortExpression="Contribution">
                        <EditItemTemplate>
                            <asp:TextBox ID="ContributionEditTxt" runat="server" Text='<%# Bind("Contribution") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Contribution") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="UploadedOn" SortExpression="UploadedOn">
                        <EditItemTemplate>
                            <asp:TextBox ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
