<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Publications_Projects_Table.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.Publications_Projects_Table" %>

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
                <u>(e) Projects (if any):</u>
            </h2>

            <asp:Label ID="Label1" runat="server" Text="ID: "></asp:Label>
            <asp:Label ID="IDLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Label ID="Label4" runat="server" Text="Year: "></asp:Label>
            <asp:TextBox ID="Year_Text" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Bold="true" ForeColor="Red" ControlToValidate="Year_Text"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="Label5" runat="server" Text="Title: "></asp:Label>
            <asp:TextBox ID="Title_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label6" runat="server" Text="Funding Agency: "></asp:Label>
            <asp:TextBox ID="FundingAgency" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label7" runat="server" Text="Continuing: "></asp:Label>
            <asp:TextBox ID="Continuing_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label8" runat="server" Text="Complete: "></asp:Label>
            <asp:TextBox ID="Complete_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label9" runat="server" Text="Major: "></asp:Label>
            <asp:TextBox ID="Major_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label10" runat="server" Text="Minor: "></asp:Label>
            <asp:TextBox ID="Minor_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label11" runat="server" Text="Other: "></asp:Label>
            <asp:TextBox ID="Other_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label12" runat="server" Text="Select File: "></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />

            <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="Insert_Btn_Click" BackColor="LightBlue" />
            &emsp;
            <asp:Button ID="ResetBtn" runat="server" Text="Reset" CausesValidation="false" BackColor="LightGray" OnClick="ResetBtn_Click" />
            <br />
            <br />

            <asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <asp:Panel ID="Panel1" runat="server" DefaultButton="SearchBtn">
                <asp:Label ID="Label13" runat="server" Text="Search: " Font-Bold="true" Font-Underline="true"></asp:Label>
                <asp:TextBox ID="SearchTxt" runat="server" Width="207px"></asp:TextBox>
                &emsp;&emsp;&emsp;
                <asp:Button ID="SearchBtn" runat="server" Text="Search Record" OnClick="SearchBtn_Click" CausesValidation="false" Font-Bold="true" />
            </asp:Panel>
            <br />
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView1_RowCommand1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
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
                            <asp:TextBox ID="Teacher_IDEditTxt" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:TextBox>
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

                    <asp:TemplateField HeaderText="Title" SortExpression="Title">
                        <EditItemTemplate>
                            <asp:TextBox ID="TitleEditTxt" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Funding Agency" SortExpression="FundingAgency">
                        <EditItemTemplate>
                            <asp:TextBox ID="FundingAgencyEditTxt" runat="server" Text='<%# Bind("FundingAgency") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("FundingAgency") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Complete" SortExpression="Complete">
                        <EditItemTemplate>
                            <asp:TextBox ID="CompleteEditTxt" runat="server" Text='<%# Bind("Complete") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Complete") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Continuing" SortExpression="Continuing">
                        <EditItemTemplate>
                            <asp:TextBox ID="ContinuingEditTxt" runat="server" Text='<%# Bind("Continuing") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Continuing") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Major" SortExpression="Major">
                        <EditItemTemplate>
                            <asp:TextBox ID="MajorEditTxt" runat="server" Text='<%# Bind("Major") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Major") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Minor" SortExpression="Minor">
                        <EditItemTemplate>
                            <asp:TextBox ID="MinorEditTxt" runat="server" Text='<%# Bind("Minor") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Minor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Other" SortExpression="Other">
                        <EditItemTemplate>
                            <asp:TextBox ID="OtherEditTxt" runat="server" Text='<%# Bind("Other") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Other") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                        <EditItemTemplate>
                            <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
