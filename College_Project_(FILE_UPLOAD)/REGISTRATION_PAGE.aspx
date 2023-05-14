<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="REGISTRATION_PAGE.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.REGISTRATION_PAGE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>REGISTRATION FORM</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet" />
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous" />

    <style type="text/css">
        html, body {
            display: flex;
            justify-content: center;
            height: 100%;
            background: url(Facebook/11.jpg);
            background-size: cover;
            background-position: center;
            background: url(Images/6.jfif);
            background-size: cover;
        }

        body, div, h1, form, input, p {
            padding: 0;
            margin: 0;
            outline: none;
            font-family: Roboto, Arial, sans-serif;
            font-size: 16px;
            color: #666;
        }

        h1 {
            padding: 10px 0;
            font-size: 30px;
            font-weight: 300;
            text-align: center;
            color: black
        }

        p {
            font-size: 12px;
        }

        hr {
            color: #a9a9a9;
            opacity: 0.3;
        }

        .main-block {
            max-width: 440px;
            min-height: 460px;
            padding: 20px 0;
            margin: auto;
            border-radius: 5px;
            border: solid 1px #ccc;
            box-shadow: 1px 2px 5px rgba(0,0,0,.31);
            background: #ebebeb;
        }

        form {
            margin: 0 35px;
        }

        .account-type, .gender {
            margin: 15px 0;
        }

        /*input[type=radio] {
            display: none;
        }

        label#icon {
            margin: 0;
            border-radius: 5px 0 0 5px;
        }

        label.radio {
            position: relative;
            display: inline-block;
            padding-top: 4px;
            margin-right: 20px;
            text-indent: 30px;
            overflow: visible;
            cursor: pointer;
        }

            label.radio:before {
                content: "";
                position: absolute;
                top: 2px;
                left: 0;
                width: 20px;
                height: 20px;
                border-radius: 50%;
                background: black;
            }

            label.radio:after {
                content: "";
                position: absolute;
                width: 9px;
                height: 4px;
                top: 8px;
                left: 4px;
                border: 3px solid #fff;
                border-top: none;
                border-right: none;
                transform: rotate(-45deg);
                opacity: 0;
            }

        input[type=radio]:checked + label:after {
            opacity: 1;
        }*/

        input[type=text], input[type=password], input[type=UsernameTxt], input[type=EmailTxt] {
            width: calc(100% - 57px);
            height: 36px;
            margin: 13px 0 0 -5px;
            padding-left: 10px;
            border-radius: 0 5px 5px 0;
            border: solid 1px #cbc9c9;
            box-shadow: 1px 2px 5px rgba(0,0,0,.09);
            background: #fff;
        }

        input[type=PasswordTxt], input[type=CPassword] {
            margin-bottom: 0px;
        }

        #icon {
            display: inline-block;
            padding: 9.3px 15px;
            box-shadow: 1px 2px 5px rgba(0,0,0,.09);
            background: black;
            color: #fff;
            text-align: center;
        }

        .btn-block {
            margin-top: 10px;
            text-align: center;
        }

        .button {
            width: 100%;
            padding: 10px 0;
            margin: 10px auto;
            border-radius: 5px;
            border: none;
            background: black;
            font-size: 14px;
            font-weight: 600;
            color: #fff;
        }

        button:hover {
            background: #26a9e0;
        }

        .DropDownList {
            font-size: 15px;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="main-block">

        <h1><u><b>Sign Up</b></u></h1>

        <form id="form1" runat="server">

            <%--<p>--%>
            <%--<asp:Label ID="LecLbl" runat="server" Font-Bold="True" Font-Names="Andalus" Font-Size="Small" Text="LECTURER"></asp:Label>--%>
            <asp:RadioButton ID="AdminRadioBtn" runat="server" Text="ADMIN" GroupName="UserType" Visible="false" />
            <asp:RadioButton ID="LecturerRadioBtn" runat="server" Text="LECTURER" Checked="true" GroupName="UserType" />
            <%--</p>--%>

            <hr />

            <label id="icon" for="name"><i class="fas fa-user"></i></label>
            <asp:TextBox ID="FirstNameTxt" runat="server" placeholder="First Name*" CssClass="name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                runat="server"
                ErrorMessage="First Name is Mandatory"
                ControlToValidate="FirstNameTxt"
                Font-Size="X-Small"
                ForeColor="Red"
                Font-Bold="True"
                Display="Dynamic">
            </asp:RequiredFieldValidator>
            <br />

            <label id="icon" for="name"><i class="fas fa-user"></i></label>
            <asp:TextBox ID="LastNameTxt" runat="server" placeholder="Last Name*" CssClass="name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                runat="server"
                ErrorMessage="Last Name is Mandatory"
                ControlToValidate="LastNameTxt"
                Font-Size="X-Small"
                ForeColor="Red"
                Font-Bold="True"
                Display="Dynamic">
            </asp:RequiredFieldValidator>
            <br />

            <label id="icon" for="name"><i class="fas fa-envelope"></i></label>
            <asp:TextBox ID="EmailTxt" runat="server" placeholder="Email" CssClass="name"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                runat="server"
                ErrorMessage="Invalid Email Address"
                ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                Font-Size="X-Small"
                ForeColor="Red"
                ControlToValidate="EmailTxt"
                Font-Bold="True" 
                Display="Dynamic">
            </asp:RegularExpressionValidator>
            <br />

            <label id="icon" for="name"><i class="fas fa-unlock-alt"></i></label>
            <asp:TextBox ID="PasswordTxt" runat="server" placeholder="Password" CssClass="name" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                runat="server"
                ErrorMessage="Password is required"
                ControlToValidate="PasswordTxt"
                Font-Size="X-Small"
                ForeColor="Red"
                Font-Bold="True"
                Display="Dynamic">
            </asp:RequiredFieldValidator>
            <br />

            <label id="icon" for="name"><i class="fas fa-unlock-alt"></i></label>
            <asp:TextBox ID="CPassword" runat="server" placeholder="Re-type Password" CssClass="name" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1"
                runat="server"
                ErrorMessage="Please check the Password"
                Type="String"
                Font-Size="X-Small"
                ForeColor="Red"
                ControlToValidate="PasswordTxt"
                Font-Bold="True"
                ControlToCompare="CPassword"
                Display="Dynamic">
            </asp:CompareValidator>
            <br />

            <label id="icon" for="name"><i class="fas fa-phone"></i></label>
            <asp:TextBox ID="PhoneNoTxt" runat="server" placeholder="Phone Number" CssClass="name"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1"
                runat="server"
                ErrorMessage="Mobile must be 10 digit"
                Font-Size="X-Small"
                ForeColor="Red"
                ControlToValidate="PhoneNoTxt"
                Font-Bold="True"
                MaximumValue="9999999999"
                MinimumValue="1000000000"
                Type="Double"
                Display="Dynamic">
            </asp:RangeValidator>
            <br />

            <div class="gender">

                <asp:Label ID="Label3" runat="server" Text="Gender: " Font-Underline="True" Font-Bold="True" Font-Size="Larger" Font-Names="Andalus" ForeColor="Black"></asp:Label>
                &emsp;
               
                <asp:DropDownList ID="Gender_DDL" runat="server" CssClass="DropDownList" Width="168px">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                    <asp:ListItem Value="Others">Others</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Label ID="Label2" runat="server" Text="Select Profile Image: " Font-Underline="True" Font-Bold="True" Font-Size="Large" Font-Names="Andalus" ForeColor="Black"></asp:Label>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Label ID="ImageStatus" runat="server" Text="" Font-Bold="true" ForeColor="Red" Font-Underline="true"></asp:Label>

            <br />
            <br />

            <asp:Label ID="Label_ID" runat="server" Text="Your Generated ID: " Font-Bold="true" ForeColor="black" Font-Underline="true"></asp:Label>
            <asp:Label ID="IDLabel" runat="server" Text="" Font-Bold="true" ForeColor="Red" Font-Underline="true"></asp:Label>
            <br />
            <br />

            <asp:Button ID="ResetBtn" runat="server" Text="Reset" Font-Bold="true" CausesValidation="false" CssClass="button" OnClick="ResetBtn_Click1" />

            <div class="btn-block">
                <asp:Button ID="SubmitBtn" runat="server" Text="Create Account" CssClass="button" OnClick="SubmitBtn_Click" />
            </div>
            <br />

            <asp:Label ID="Label1" runat="server" Text="Already have an account?" Font-Size="Large"></asp:Label>
            <asp:LinkButton ID="LoginLinkButton" runat="server" Font-Bold="true" Font-Size="Large" OnClick="LoginLinkButton_Click" CausesValidation="false">Login here</asp:LinkButton>

        </form>
    </div>
</body>
</html>