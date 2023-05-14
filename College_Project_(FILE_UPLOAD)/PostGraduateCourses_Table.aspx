
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostGraduateCourses_Table.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.PostGraduateCourses_Table" %>

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
            <asp:Button ID="BackButton" runat="server" Font-Bold="True" Font-Size="Medium" Text="<- Back to Criteria Page" CausesValidation="false" Style="height: 36px" OnClick="BackButton_Click" />
            <br />
            <br />

            <h2 style="color: white;">
                <u>> Post-graduate Courses:</u>
            </h2>
            <br />

            <asp:Panel ID="InsertionPanel" runat="server" DefaultButton="SubmitBtn">
                <asp:Label ID="Label1" runat="server" Text="Teacher ID: "></asp:Label>
                <asp:Label ID="IDLabel" runat="server" Text=""></asp:Label>
                <br />
                <br />

                <asp:Label ID="Label4" runat="server" Text="Year: "></asp:Label>
                <asp:TextBox ID="Year_Text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Year_Text"></asp:RequiredFieldValidator>
                <br />
                <br />

                <asp:Label ID="Label5" runat="server" Text="Class: "></asp:Label>
                <asp:TextBox ID="ClassTxt" runat="server" Style='text-transform: uppercase'></asp:TextBox>
                &emsp;
                <asp:Label ID="Label10" runat="server" Text="Paper: "></asp:Label>
                <asp:TextBox ID="PaperTxt" runat="server" Style='text-transform: uppercase'></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="Label7" runat="server" Text="Nomenclature: "></asp:Label>
                <asp:TextBox ID="Nomenclature_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="Label6" runat="server" Text="Periods Per Week: "></asp:Label>
                <asp:TextBox ID="PeriodsPerWeek_Text" runat="server" TextMode="Number"></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="Label8" runat="server" Text="Lecture Method: "></asp:Label>
                <asp:TextBox ID="Lecture_Method_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
                <br />
                <br />

                <asp:Label ID="Label9" runat="server" Text="Seminar Presentation Method: "></asp:Label>
                <asp:TextBox ID="Seminar_Presentation_Method_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
                <br />
                <br />

                <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="Insert_Btn_Click" />
                &emsp;
                <asp:Button ID="ResetBtn" runat="server" Text="Reset" CausesValidation="false" OnClick="ResetBtn_Click" />
                <br />
                <br />

                <asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label>
                <br />
                <br />
            </asp:Panel>

            <asp:Panel ID="SearchPanel" runat="server" DefaultButton="SearchBtn">
                <asp:Label ID="Label12" runat="server" Text="Search: " Font-Bold="true" Font-Underline="true"></asp:Label>
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

                    <asp:TemplateField HeaderText="S No" InsertVisible="False" SortExpression="S_No">
                        <EditItemTemplate>
                            <asp:Label ID="S_NoEditLabel" runat="server" Text='<%# Eval("S_No") %>'></asp:Label>
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
                            <asp:TextBox ID="YeareditTxt" runat="server" Text='<%# Bind("Year") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Class" SortExpression="Class">
                        <EditItemTemplate>
                            <asp:TextBox ID="ClassEditTxt" runat="server" Text='<%# Bind("Class") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Class") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Paper" SortExpression="Paper">
                        <EditItemTemplate>
                            <asp:TextBox ID="PaperEditTxt" runat="server" Text='<%# Bind("Paper") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Paper") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nomenclature" SortExpression="Nomenclature">
                        <EditItemTemplate>
                            <asp:TextBox ID="NomenclatureEditTxt" runat="server" Text='<%# Bind("Nomenclature") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Nomenclature") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Periods Per Week" SortExpression="PeriodsPerWeek">
                        <EditItemTemplate>
                            <asp:TextBox ID="PeriodsPerWeekEditTxt" runat="server" Text='<%# Bind("PeriodsPerWeek") %>' TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("PeriodsPerWeek") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Lecture Method" SortExpression="Lecture_Method">
                        <EditItemTemplate>
                            <asp:TextBox ID="Lecture_MethodEditTxt" runat="server" Text='<%# Bind("Lecture_Method") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Lecture_Method") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Seminar Presentation Method" SortExpression="Seminar_Presentation_Method">
                        <EditItemTemplate>
                            <asp:TextBox ID="Seminar_Presentation_MethodEditTxt" runat="server" Text='<%# Bind("Seminar_Presentation_Method") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Seminar_Presentation_Method") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                        <EditItemTemplate>
                            <asp:Label ID="UploadedOnEditTxt" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
