<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examinership.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.Examinership" %>

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

            <asp:Label ID="Label1" runat="server" Text="Teacher ID: "></asp:Label>
            <asp:Label ID="IDLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <h2 style="color: white;">
                <u>VI. Examiner Ship (if any):</u>
            </h2>

            <asp:Label ID="Label4" runat="server" Text="Year: "></asp:Label>
            <asp:TextBox ID="Year_Text" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Font-Bold="true" ControlToValidate="Year_Text"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="Label5" runat="server" Text="Class: "></asp:Label>
            <asp:TextBox ID="Class_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label6" runat="server" Text="Paper: "></asp:Label>
            <asp:TextBox ID="Paper_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label7" runat="server" Text="Name of the Institution: "></asp:Label>
            <asp:TextBox ID="Institution_Name_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="Select Document: "></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />

            <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="Insert_Btn_Click" BackColor="LightBlue"/>
            &emsp;
            <asp:Button ID="ResetBtn" runat="server" Text="Reset" BackColor="LightGray" CausesValidation="false" OnClick="ResetBtn_Click"/>
            <br />
            <br />

            <asp:Label ID="StatusLabel" runat="server" Text="" Font-Bold="true"></asp:Label>
            <br />
            <br />

            <asp:Panel ID="Panel1" runat="server" DefaultButton="SearchBtn">
                <asp:Label ID="Label9" runat="server" Text="Search: " Font-Bold="true" Font-Underline="true"></asp:Label>
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

                    <asp:TemplateField HeaderText="Class" SortExpression="Class">
                        <EditItemTemplate>
                            <asp:TextBox ID="ClassEditTxt" runat="server" Text='<%# Bind("Class") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Class") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Paper" SortExpression="Paper">
                        <EditItemTemplate>
                            <asp:TextBox ID="PaperEditTxt" runat="server" Text='<%# Bind("Paper") %>' Style='text-transform: uppercase'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Paper") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Name of the Institution" SortExpression="Institution_Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="Institution_NameEditTxt" runat="server" Text='<%# Bind("Institution_Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Institution_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                        <EditItemTemplate>
                            <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
