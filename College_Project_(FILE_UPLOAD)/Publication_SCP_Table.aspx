<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Publication_SCP_Table.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.Publication_SCP_Table" %>

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

        <asp:Button ID="BackButton" runat="server" Font-Bold="True" Font-Size="Medium" Text="<< BACK TO CRITERIA PAGE" CausesValidation="false" Style="height: 36px" OnClick="BackButton_Click" />
        <br />
        <br />

        <h2 style="color: white;">
            <u>(b) Publications: Seminars and Conference Proceedings:</u>
        </h2>

        <asp:Label ID="Label1" runat="server" Text="ID: "></asp:Label>
        <asp:Label ID="IDLabel" runat="server" Text=""></asp:Label>
        <br />
        <br />

        <asp:Label ID="Label4" runat="server" Text="Organising Body: "></asp:Label>
        <asp:TextBox ID="OrganisingBody_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
        <br />
        <br />

        <asp:Label ID="Label5" runat="server" Text="Name of the Proceedings: "></asp:Label>
        <asp:TextBox ID="ProceedingsName_Text" runat="server" Style='text-transform: uppercase'></asp:TextBox>
        <br />
        <br />

        <asp:Label ID="Label6" runat="server" Text="Publication Year: "></asp:Label>
        <asp:TextBox ID="PublicationYear_Text" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
        <br />
        <br />

        <asp:Label ID="Label7" runat="server" Text="ISSN/ISBN no.(if any): "></asp:Label>
        <asp:TextBox ID="issn_isbn_noText" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
        <br />
        <br />

        <asp:Label ID="Label8" runat="server" Text="Chapter No.: "></asp:Label>
        <asp:TextBox ID="ChapterNo_Text" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
        <br />
        <br />

        <asp:Label ID="Label9" runat="server" Text="Chapter Name: "></asp:Label>
        <asp:TextBox ID="Chapter_Name_Text" runat="server"></asp:TextBox>
        <br />
        <br />

        <asp:Label ID="Label10" runat="server" Text="Chapter No.(Page No): "></asp:Label>
        <asp:TextBox ID="PageNo_Text" runat="server" onkeypress="return numeric(event)"></asp:TextBox>
        <br />
        <br />

        <asp:Label ID="Label2" runat="server" Text="Select File: "></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />

        <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="Insert_Btn_Click" />
        &emsp;
        <asp:Button ID="ResetBtn" runat="server" Text="Reset" OnClick="ResetBtn_Click" style="height: 29px" />
        <br />
        <br />

        <asp:Label ID="StatusLabel" runat="server" Text="" Font-Bold="true"></asp:Label>
        <br />
        <br />

        <asp:Panel ID="Panel1" runat="server" DefaultButton="SearchBtn">
            <asp:Label ID="Label12" runat="server" Text="Search: " Font-Bold="true" Font-Underline="true"></asp:Label>
            <asp:TextBox ID="SearchTxt" runat="server" Width="207px"></asp:TextBox>
            &emsp;&emsp;&emsp;
            <asp:Button ID="SearchBtn" runat="server" Text="Search Record" OnClick="SearchBtn_Click" CausesValidation="false" Font-Bold="true" />
        </asp:Panel>

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
                        <asp:LinkButton ID="LinkButtonUpdate" runat="server" CommandName="UpdateRow" CausesValidation="false" CommandArgument='<%# Eval("S_No") %>' OnClientClick="return confirm('ARE YOU SURE YOU WANT TO UPDATE THIS ROW?');">UPDATE</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCancel" runat="server" CommandName="CancelUpdate" CausesValidation="false" CommandArgument='<%# Eval("S_No") %>'>CANCEL</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="S No" InsertVisible="False" SortExpression="S_No">
                    <EditItemTemplate>
                        <asp:Label ID="S_No_Edit_Label" runat="server" Text='<%# Eval("S_No") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("S_No") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Lecturee ID" SortExpression="Teacher_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Teacher_IDEditLabel" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Organising Body" SortExpression="OrganisationBody">
                    <EditItemTemplate>
                        <asp:TextBox ID="OrganisationBodyEditTxt" runat="server" Text='<%# Bind("OrganisationBody") %>' Style='text-transform: uppercase'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("OrganisationBody") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Proceedings Name" SortExpression="ProceedingsName">
                    <EditItemTemplate>
                        <asp:TextBox ID="ProceedingsNameEditTxt" runat="server" Text='<%# Bind("ProceedingsName") %>' Style='text-transform: uppercase'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ProceedingsName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Publication Year" SortExpression="PublicationYear">
                    <EditItemTemplate>
                        <asp:TextBox ID="PublicationYearEditTxt" runat="server" Text='<%# Bind("PublicationYear") %>' onkeypress="return numeric(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("PublicationYear") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ISSN/ISBN No.(if any)" SortExpression="ISSN_ISBN_No">
                    <EditItemTemplate>
                        <asp:TextBox ID="ISSN_ISBN_NoEditTxt" runat="server" Text='<%# Bind("ISSN_ISBN_No") %>' onkeypress="return numeric(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ISSN_ISBN_No") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Chapter No." SortExpression="ChapterNo">
                    <EditItemTemplate>
                        <asp:TextBox ID="ChapterNoEditTxt" runat="server" Text='<%# Bind("ChapterNo") %>' onkeypress="return numeric(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("ChapterNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Chapter Name" SortExpression="ChapterNo_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="ChapterNo_NameEditTxt" runat="server" Text='<%# Bind("ChapterNo_Name") %>' Style='text-transform: uppercase'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("ChapterNo_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Page No." SortExpression="ChapterNo_PageNo">
                    <EditItemTemplate>
                        <asp:TextBox ID="ChapterNo_PageNoEditTxt" runat="server" Text='<%# Bind("ChapterNo_PageNo") %>' onkeypress="return numeric(event)"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("ChapterNo_PageNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                    <EditItemTemplate>
                        <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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

    </form>
</body>
</html>
