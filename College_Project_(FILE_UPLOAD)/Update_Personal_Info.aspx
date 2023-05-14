<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update_Personal_Info.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.Update_Personal_Info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Personal Information</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="BackButton" runat="server" Text="<< BACK TO GENERAL INFORMATION" OnClick="BackButton_Click1" CausesValidation="false" BackColor="LightSkyBlue" Font-Bold="true" />
            <br />
            <br />

            <asp:Label ID="Label17" runat="server" Text="Teacher ID: " Font-Bold="true"></asp:Label>
            <asp:Label ID="IDLabel" runat="server" Text="" Font-Bold="true"></asp:Label>
            <br />
            <br />

            <asp:Label ID="Label1" runat="server" Text="First Name: " Font-Bold="true"></asp:Label>
            <asp:DropDownList ID="Prefix_DropDownList" runat="server">
                <asp:ListItem>Mr.</asp:ListItem>
                <asp:ListItem>Mrs.</asp:ListItem>
                <asp:ListItem>Ms.</asp:ListItem>
                <asp:ListItem>Dr.</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="FirstNameTxt" runat="server" Height="25px" Width="168px" onkeyup="this.value=this.value.toUpperCase()" AutoCompleteType="Disabled"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span>
                    <asp:Label ID="Label8" runat="server" Text="Last Name: " Font-Bold="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="LastNameTxt" runat="server" onkeyup="this.value=this.value.toUpperCase()" AutoCompleteType="Disabled"></asp:TextBox><br />
                </span>

            <asp:RequiredFieldValidator ID="FirstNameTxtRequiredFieldValidator1" runat="server" ControlToValidate="FirstNameTxt" ErrorMessage="* FIRST NAME IS REQUIRED" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="LastNameTxtRequiredFieldValidator1" runat="server" ControlToValidate="LastNameTxt" ErrorMessage="* LAST NAME IS REQUIRED" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>

            <br />

            <asp:Label ID="Label2" runat="server" Text="Fathers Name: " Font-Bold="true"></asp:Label>
            <asp:TextBox ID="FathersNameTxt" runat="server" onkeyup="this.value=this.value.toUpperCase()" AutoCompleteType="Disabled"></asp:TextBox>
            <span>
                <asp:Label ID="Label3" runat="server" Text="Mothers Name: " Font-Bold="true"></asp:Label>
                <asp:TextBox ID="MothersNameTxt" runat="server" onkeyup="this.value=this.value.toUpperCase()" AutoCompleteType="Disabled"></asp:TextBox><br />
                <br />
            </span>

            <asp:Label ID="Label4" runat="server" Text="Husbands Name: " Font-Bold="true"></asp:Label>
            <asp:TextBox ID="HusbandsNameTxt" runat="server" Width="480px" onkeyup="this.value=this.value.toUpperCase()" AutoCompleteType="Disabled"></asp:TextBox><br />
            <br />

            <asp:Label ID="Label9" runat="server" Text="Email: " Font-Bold="true"></asp:Label>
            <asp:TextBox ID="EmailTxt" runat="server" Width="585px"></asp:TextBox><br />

            <asp:RequiredFieldValidator ID="EmailTxtRequiredFieldValidator1" runat="server" ControlToValidate="EmailTxt" ErrorMessage="* EMAIL IS REQUIRED" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="EmailTxtRegularExpressionValidator" runat="server" ControlToValidate="EmailTxt" ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" Display="Dynamic" ErrorMessage="Invalid email address" />

            <br />

            <asp:Label ID="Label11" runat="server" Text="Phone No: " Font-Bold="true"></asp:Label>
            <asp:TextBox ID="PhoneNoTxt" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span>
                    <asp:Label ID="Label12" runat="server" Text="Alternate No: " Font-Bold="true"></asp:Label>&nbsp;
                    <asp:TextBox ID="AlternateNoTxt" runat="server"></asp:TextBox><br />
                </span>

            <asp:RegularExpressionValidator ID="PhoneNoTxtRegularExpressionValidator1" runat="server" ControlToValidate="PhoneNoTxt" ErrorMessage="Invalid Phone Number" ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>

            <br />

            <asp:Label ID="Label14" runat="server" Text="Gender: " Font-Bold="true"></asp:Label>
            <asp:RadioButton ID="MALE_RadioButton" runat="server" Text="Male" />
            <asp:RadioButton ID="FEMALE_RadioButton" runat="server" Text="Female" />
            <asp:RadioButton ID="OTHERS_RadioButton" runat="server" Text="Others" />
            <br />

            <asp:Label ID="Label5" runat="server" Text="Faculty: " Font-Bold="true"></asp:Label>
            <asp:DropDownList ID="FACULTY_DropDownList" runat="server" Width="225px">
                <asp:ListItem>Commerce</asp:ListItem>
                <asp:ListItem>Science</asp:ListItem>
                <asp:ListItem>Arts</asp:ListItem>
            </asp:DropDownList>
            &emsp;
                <span>
                    <asp:Label ID="Label6" runat="server" Text="Department: " Font-Bold="true"></asp:Label>&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DEPARTMENT_DropDownList" runat="server">
                        <asp:ListItem> B.A. </asp:ListItem>
                        <asp:ListItem> B.Sc. </asp:ListItem>
                        <asp:ListItem> M.Sc. </asp:ListItem>
                        <asp:ListItem> B.C.A </asp:ListItem>
                        <asp:ListItem> B.Com </asp:ListItem>
                        <asp:ListItem> B.Com (Honors) Accounting</asp:ListItem>
                        <asp:ListItem> B.B.A </asp:ListItem>
                        <asp:ListItem> M.Com </asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                </span>

            <asp:Label ID="Label15" runat="server" Text="Status: " Font-Bold="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="STATUS_DropDownList" runat="server">
                    <asp:ListItem Value="">----SELECT STATUS----</asp:ListItem>
                    <asp:ListItem>TEMPORARY</asp:ListItem>
                    <asp:ListItem>PERMANENT</asp:ListItem>
                    <asp:ListItem>GUEST FACULTY</asp:ListItem>
                </asp:DropDownList>

            <br />
            <br />

            <asp:Label ID="Label16" runat="server" Text="Address(With Pincode): " Font-Bold="true"></asp:Label>
            <asp:TextBox ID="AddressTxt" runat="server" Height="42px" TextMode="MultiLine" Width="420px"></asp:TextBox><br />
            <br />

            <asp:Label ID="StatusLabel" runat="server" Text="" Font-Bold="true"></asp:Label><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            
            <asp:Button ID="SubmitBtn" runat="server" Text="Update Information" OnClick="SubmitBtn_Click" Font-Size="Smaller" Font-Bold="true" Height="46px" Width="200px" CssClass="Btn" />

        </div>
    </form>
</body>
</html>
