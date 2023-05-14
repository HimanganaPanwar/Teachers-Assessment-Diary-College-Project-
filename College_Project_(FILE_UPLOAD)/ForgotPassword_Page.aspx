<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword_Page.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.ForgotPassword_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">  
        $(document).ready(function () {
            $('#ShowPassword_Btn').hover(function show() {
                //Change the attribute to text  
                $('#PasswordTxt').attr('type', 'text');
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            },
                function () {
                    //Change the attribute back to password  
                    $('#PasswordTxt').attr('type', 'password');
                    $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:LinkButton ID="BackToLoginBtn" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="Larger" BackColor="LightGray" OnClick="BackToLoginBtn_Click" CausesValidation="false"> << Back to Login </asp:LinkButton>
            <br />
            <br />

            <asp:Label ID="Label3" runat="server" Text="Reset Password" Font-Bold="true" Font-Underline="true" Font-Size="XX-Large"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Find Your Account" Font-Bold="true" Font-Underline="true" Font-Size="Larger"></asp:Label>

            <p>
                Please enter your email address and mobile number to search for your account.
            </p>

            <asp:Panel ID="Panel1" runat="server" DefaultButton="SearchBtn">
                <asp:Label ID="Label1" runat="server" Text="Email Address: " Font-Bold="true" Font-Underline="true"></asp:Label>
                <asp:TextBox ID="EmailTxt" runat="server" Width="277px" ValidationGroup="Panel1Validations"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ValidationGroup="Panel1Validations"
                    ControlToValidate="EmailTxt" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                <br />
                <br />

                <asp:Label ID="Label2" runat="server" Text="Enter Phone No.: " Font-Bold="true" Font-Underline="true"></asp:Label>
                <asp:TextBox ID="PhoneNoTxt" runat="server" Width="277px" ValidationGroup="Panel1Validations"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ValidationGroup="Panel1Validations"
                    ControlToValidate="PhoneNoTxt" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
                <br />
                <br />

                <asp:Label ID="StatusLabel" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                <br />
                <br />

                <asp:Button ID="SearchBtn" runat="server" Text="Search" Width="153px" Font-Bold="true" BackColor="LightBlue" ValidationGroup="Panel1Validations" OnClick="SearchBtn_Click" />

                &emsp;&emsp;
                
                <asp:Button ID="CancelBtn" runat="server" Text="Cancel" Width="153px" Font-Bold="true" BackColor="LightGray" CausesValidation="false" OnClick="CancelBtn_Click" />
                <br />
            </asp:Panel>
            <br />
            <br />



            <asp:Panel ID="Panel2" runat="server" DefaultButton="ResetPasswordBtn">
                <asp:Label ID="PasswordLabel" runat="server" Text="Password: " Font-Bold="true" Font-Underline="true"></asp:Label>
                <asp:TextBox ID="PasswordTxt" runat="server" ValidationGroup="Panel2Validations" TextMode="Password"></asp:TextBox>

                <%--<asp:Button ID="ShowPassword_Btn" runat="server" Text="Show" class="btn btn-primary" />--%>
                <%--<button id="ShowPassword_Btn" class="btn btn-primary" type="button" onserverclick="SearchBtn"><span class="fa fa-eye-slash icon"></span></button>--%>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="PasswordTxt" ForeColor="Red" Font-Bold="true" ValidationGroup="Panel2Validations"></asp:RequiredFieldValidator>
                <br />
                <br />

                <asp:Label ID="ConfirmPasswordLabel" runat="server" Text="Confirm Password: " Font-Bold="true" Font-Underline="true"></asp:Label>
                <asp:TextBox ID="ConfirmPasswordTxt" runat="server" ValidationGroup="Panel2Validations" TextMode="Password"></asp:TextBox>

                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ConfirmPasswordTxt" CssClass="ValidationError"
                    ControlToCompare="PasswordTxt" ErrorMessage="Password Mismatch" ToolTip=" Password must be the same" ForeColor="Red"
                    ValidationGroup="Panel2Validations" />
                <br />
                <br />

                <asp:Button ID="ResetPasswordBtn" runat="server" Text="Reset Password" Width="153px" Font-Bold="true" BackColor="LightBlue" ValidationGroup="Panel2Validations" OnClick="ResetPasswordBtn_Click" />
                <br />
                <br />

                <asp:Label ID="UpadteStatusLabel" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
