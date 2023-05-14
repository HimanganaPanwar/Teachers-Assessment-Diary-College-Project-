<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="INFORMATION(GENERAL_INFO).aspx.cs" Inherits="College_Project__FILE_UPLOAD_.INFORMATION_GENERAL_INFO_" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GENERAL INFORMATION(LECTURER)</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };

        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("You sure you wanna disable this account?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
            return false;
        }
        function wasDisabled()
        {
            alert('Account was disabled successfully!');
            return false;
        }

        function alertMessage() {
            alert('Account was not disabled!');
            return false;   //TO PREVENT PAGE REFRESH / PAGE LOADING
        }
    </script>

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            height: 1000px;
            font-family: "Roboto", sans-serif;
            background-image: linear-gradient(to right, white,grey);
        }

        header {
            position: fixed;
            background: #22242A;
            padding: 20px;
            width: 100%;
            height: 30px;
        }

        .left_area h3 {
            color: #fff;
            margin: 0;
            text-transform: uppercase;
            font-size: 22px;
            font-weight: 900;
        }

        .left_area span {
            color: #19B3D3;
        }

        .logout_btn {
            width: 130px;
            padding: 5px;
            background: #19B3D3;
            text-decoration: none;
            float: right;
            text-align: center;
            margin-top: -5px;
            margin-right: 90px;
            border-radius: 2px;
            font-size: 15px;
            font-weight: 900;
            color: #fff;
            transition: 0.5s;
            transition-property: background;
        }

            .logout_btn:hover {
                background: #0D9DBB;
            }

        .sidebar {
            background: #2F323A;
            margin-top: 70px;
            padding-top: 30px;
            position: fixed;
            left: 0;
            width: 250px;
            height: 100%;
            transition: 0.5s;
            transition-property: left;
        }

            .sidebar .profile_image {
                width: 100px;
                height: 100px;
                border-radius: 100px;
                margin-bottom: 10px;
            }

            .sidebar h4 {
                color: #ccc;
                margin-top: 0;
                margin-bottom: 20px;
            }

            .sidebar a {
                color: #fff;
                display: block;
                width: 100%;
                line-height: 60px;
                text-decoration: none;
                padding-left: 40px;
                box-sizing: border-box;
                transition: 0.5s;
                transition-property: background;
            }

                .sidebar a:hover {
                    background: #19B3D3;
                }

            .sidebar i {
                padding-right: 10px;
            }

        label #sidebar_btn {
            z-index: 1;
            color: white;
            position: fixed;
            cursor: pointer;
            left: 1490px;
            font-size: 20px;
            margin: 5px 0;
            transition: 0.5s;
            transition-property: color;
        }

            label #sidebar_btn:hover {
                color: #19B3D3;
            }

        #check:checked ~ .sidebar {
            left: -190px;
        }

            #check:checked ~ .sidebar a span {
                display: none;
            }

            #check:checked ~ .sidebar a {
                font-size: 20px;
                margin-left: 170px;
                width: 80px;
            }

        .content {
            margin-left: 0px;
            background: url(IMAGES/BG6.jpg) no-repeat;
            background-position: center;
            background-size: cover;
            /*background-size: 800px 700px;*/
            height: 100vh;
            transition: 0.5s;
        }

        #check:checked ~ .content {
            margin-left: 60px;
            padding-top: 0px;
        }

        #check {
            display: none;
        }

        .content_Form {
            /*background-color: white;*/
            padding-top: 100px;
            padding-left: 310px;
            text-align: left;
            font-size: 20px;
            font-display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="SearchDataBtn">
        <input type="checkbox" id="check" />

        <header>

            <label for="check">
                <i class="fas fa-bars" id="sidebar_btn"></i>
            </label>

            <div class="left_area">
                <h3><span>Mahila</span> P.G. <span>Mahavidyalaya&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>
                        <asp:Button ID="BackToProfilesBtn" runat="server" PostBackUrl="~/TEACHERS_PROFILES.aspx" Style="height: 29px" Text="BACK TO PROFILES" BackColor="LightBlue" Font-Bold="true" OnClick="BackToProfilesBtn_Click" />
                        &emsp;
                        <asp:Button ID="LogoutBtn" runat="server" Style="height: 29px" Text="LOGOUT" BackColor="LightBlue" Font-Bold="true" OnClick="LogoutBtn_Click" />
                    </span>
                </span>
                </h3>
            </div>
        </header>

        <div class="sidebar">
            <center>
                <br />
                <asp:Image ID="ProfilePic" runat="server" CssClass="profile_image" Height="160px" Width="170px" AlternateText="Lecturer Profile Picture"></asp:Image>
			    
                    <asp:Label ID="TeacherNameText" runat="server" Text="" Width="200px" Font-Size="Medium" Font-Bold="true" ForeColor="White"></asp:Label>
			    
                <hr /><hr />
		    </center>
            <asp:LinkButton ID="Personal_InfoBtn" runat="server" OnClick="Personal_InfoBtn_Click"><i class="fas fa-table"></i><span>Personal Information</span></asp:LinkButton>
            <asp:LinkButton ID="Change_Password" runat="server" OnClick="Change_Password_Click"><i class="fas fa-cogs"></i><span>Change Password</span></asp:LinkButton>
            <asp:LinkButton ID="CriteriaBtn" runat="server" OnClick="CriteriaBtn_Click"><i class="fas fa-table"></i><span>Criteria</span></asp:LinkButton>
            <asp:LinkButton ID="ReportProblem" runat="server" OnClick="ReportProblem_Click" ><i class="fas fa-table"></i><span>Report Problem</span></asp:LinkButton>
            <asp:LinkButton ID="DeleteAccount" runat="server" OnClientClick="Confirm()" OnClick="DeleteAccount_Click1"><i class="fas fa-sliders-h"></i><span>Delete Account</span></asp:LinkButton>
            <asp:LinkButton ID="DisableAccount" runat="server" OnClientClick="Confirm()" OnClick="DisableAccount_Click"><i class="fas fa-sliders-h"></i><span>Disable Account</span></asp:LinkButton>
            <hr />
            <hr />
        </div>

        <div class="content">
            <div class="content_Form">
                <asp:Label ID="Label17" runat="server" Text="Teacher ID: " Font-Bold="true"></asp:Label>
                <asp:Label ID="IDLabel" runat="server" Text="" Font-Bold="true"></asp:Label>
                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

                <asp:Label ID="Label1" runat="server" Text="Search Year: " Font-Bold="true"></asp:Label>
                <asp:TextBox ID="SelectYearTxt" runat="server"></asp:TextBox>
                <asp:Button ID="SearchDataBtn" runat="server" Text="Search" BackColor="LightCyan" Font-Bold="true" OnClick="SearchDataBtn_Click" />
                <br />
                <br />
                <br />

                <b><u>>>Added qualification acquired during the session:</u></b>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView1_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" HorizontalAlign="Center" />
                    <AlternatingRowStyle HorizontalAlign="Center" />
                    <Columns>

                        <asp:TemplateField HeaderText="S No" InsertVisible="False" SortExpression="S_No">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("S_No") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Lecturer ID" SortExpression="Teacher_ID">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Year" SortExpression="Year">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Document Type" SortExpression="Document_Type">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Document_Type") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Any Other Document" SortExpression="AnyOther">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("AnyOther") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="File Name On" SortExpression="FileName">
                            <ItemTemplate>
                                <asp:Label ID="LabelFileName" runat="server" Text='<%# Bind("FileName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="ViewDocument" runat="server" CausesValidation="false" Text="VIEW DOCUMENT" CommandName="DownloadDoc" CommandArgument='<%# Eval("S_No") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <b><u>>> Leave Record: </u></b>
                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <Columns>

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
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <b><u>>> Career advancement qualification achieved during the session: </u></b>
                <br />
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView1_RowCommand1" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

                        <asp:TemplateField HeaderText="S No" InsertVisible="False" SortExpression="S_No">
                            <EditItemTemplate>
                                <asp:Label ID="EditS_No" runat="server" Text='<%# Eval("S_No") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("S_No") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Lecturer ID" SortExpression="Teacher_ID">
                            <EditItemTemplate>
                                <asp:Label ID="EditTeacherID" runat="server" Text='<%# Eval("Teacher_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Year" SortExpression="Year">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditYear" runat="server" Text='<%# Bind("Year") %>' onkeypress="return numeric(event)"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Document Type" SortExpression="Document_Type">
                            <EditItemTemplate>
                                <asp:DropDownList ID="EditDocument_Type" runat="server" SelectedValue='<%# Bind("Document_Type") %>'>
                                    <asp:ListItem>Select Document Type</asp:ListItem>
                                    <asp:ListItem>Orientation</asp:ListItem>
                                    <asp:ListItem>Reference</asp:ListItem>
                                    <asp:ListItem>Summer/Winter School</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Document_Type") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Place" SortExpression="Place">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditPlace" runat="server" Text='<%# Bind("Place") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Place") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditDuration" runat="server" Text='<%# Bind("Duration") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sponsering Agency" SortExpression="Sponsering_Agency">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditSponsering_Agency" runat="server" Text='<%# Bind("Sponsering_Agency") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Sponsering_Agency") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                            <EditItemTemplate>
                                <asp:Label ID="EditUploadedOn" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <b><u>>> Undergraduate Courses: </u></b>
                <br />
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

                        <asp:TemplateField HeaderText="S No" InsertVisible="False" SortExpression="S_No">
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
                                <asp:Label ID="UploadedOnEditTxt" runat="server" Text='<%# Bind("UploadedOn") %>' Style='text-transform: uppercase'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <b><u>>> Post-graduate Courses: </u></b>
                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Publications: Journals</b></u>
                <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" Font-Size="Medium" DataKeyNames="S_No" OnRowCommand="GridView6_RowCommand1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

                        <asp:TemplateField HeaderText="S No" InsertVisible="False" SortExpression="S_No">
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

                        <asp:TemplateField HeaderText="Journal_Name" SortExpression="Journal_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="Journal_NameEditTxt" runat="server" Text='<%# Bind("Journal_Name") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Journal_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Publishing Agency" SortExpression="Publishing_Agency">
                            <EditItemTemplate>
                                <asp:TextBox ID="Publishing_AgencyEditTxt" runat="server" Text='<%# Bind("Publishing_Agency") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Publishing_Agency") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Refereed" SortExpression="Refereed">
                            <EditItemTemplate>
                                <asp:TextBox ID="RefereedEditTxt" runat="server" Text='<%# Bind("Refereed") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Refereed") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Non Refereed" SortExpression="Non_Refereed">
                            <EditItemTemplate>
                                <asp:TextBox ID="Non_RefereedEditTxt" runat="server" Text='<%# Bind("Non_Refereed") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Non_Refereed") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Level" SortExpression="Level">
                            <EditItemTemplate>
                                <asp:TextBox ID="LevelEditTxt" runat="server" Text='<%# Bind("Level") %>' onkeypress="return numeric(event)"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Level") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Chapter No" SortExpression="ChapterNo">
                            <EditItemTemplate>
                                <asp:TextBox ID="ChapterNoEditTxt" runat="server" Text='<%# Bind("ChapterNo") %>' onkeypress="return numeric(event)"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("ChapterNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Chapter Name" SortExpression="ChapterNo_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="ChapterNo_NameEditTxt" runat="server" Text='<%# Bind("ChapterNo_Name") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("ChapterNo_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="PageNo" SortExpression="ChapterNo_PageNo">
                            <EditItemTemplate>
                                <asp:TextBox ID="ChapterNo_PageNoEditTxt" runat="server" Text='<%# Bind("ChapterNo_PageNo") %>' onkeypress="return numeric(event)"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("ChapterNo_PageNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                            <EditItemTemplate>
                                <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Publications: Books/Monographs</b></u>
                <br />
                <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView7_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

                        <asp:TemplateField HeaderText="S No" InsertVisible="False" SortExpression="S_No">
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

                        <asp:TemplateField HeaderText="Title" SortExpression="Title">
                            <EditItemTemplate>
                                <asp:TextBox ID="TitleEditTxt" runat="server" Text='<%# Bind("Title") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sole Author Name" SortExpression="Sole_Author_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="Sole_Author_NameEditTxt" runat="server" Text='<%# Bind("Sole_Author_Name") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Sole_Author_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Co-Author Name (if any)" SortExpression="Co_Author_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="Co_Author_NameEditTxt" runat="server" Text='<%# Bind("Co_Author_Name") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Co_Author_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Publishing House" SortExpression="Publishing_House">
                            <EditItemTemplate>
                                <asp:TextBox ID="Publishing_HouseEditTxt" runat="server" Text='<%# Bind("Publishing_House") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Publishing_House") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Year" SortExpression="Year">
                            <EditItemTemplate>
                                <asp:TextBox ID="YearEditTxt" runat="server" Text='<%# Bind("Year") %>' onkeypress="return numeric(event)"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Reference or Text" SortExpression="Reference_OR_Text">
                            <EditItemTemplate>
                                <asp:TextBox ID="Reference_OR_TextEditTxt" runat="server" Text='<%# Bind("Reference_OR_Text") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Reference_OR_Text") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ISSN/ISBN No.(if any)" SortExpression="ISSN_OR_ISBN_No">
                            <EditItemTemplate>
                                <asp:TextBox ID="ISSN_OR_ISBN_NoEditTxt" runat="server" Text='<%# Bind("ISSN_OR_ISBN_No") %>' onkeypress="return numeric(event)"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("ISSN_OR_ISBN_No") %>'></asp:Label>
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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Project (if any): </b></u>
                <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView8_RowCommand1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Seminar / Workshops / Conferences, organised (if any): </b></u>
                <br />
                <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView9_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

                        <asp:TemplateField HeaderText="S_No" InsertVisible="False" SortExpression="S_No">
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

                        <asp:TemplateField HeaderText="Theme" SortExpression="Theme">
                            <EditItemTemplate>
                                <asp:TextBox ID="ThemeEditTxt" runat="server" Text='<%# Bind("Theme") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Theme") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date" SortExpression="Date_Value">
                            <EditItemTemplate>
                                <asp:TextBox ID="Date_ValueEditTxt" runat="server" Text='<%# Bind("Date_Value") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Date_Value") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Level" SortExpression="Level">
                            <EditItemTemplate>
                                <asp:TextBox ID="LevelEditTxt" runat="server" Text='<%# Bind("Level") %>' onkeypress="return numeric(event)"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Level") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Your Role" SortExpression="YourRole">
                            <EditItemTemplate>
                                <asp:TextBox ID="YourRoleEditTxt" runat="server" Text='<%# Bind("YourRole") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("YourRole") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                            <EditItemTemplate>
                                <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Extension Lectures given (if any): </b></u>
                <br />
                <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView10_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

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

                        <asp:TemplateField HeaderText="Name of Organisation body" SortExpression="Organisation_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="Organisation_NameEditTxt" runat="server" Text='<%# Bind("Organisation_Name") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Organisation_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date" SortExpression="Date_Value">
                            <EditItemTemplate>
                                <asp:TextBox ID="Date_ValueEditTxt" runat="server" Text='<%# Bind("Date_Value") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Date_Value") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Level" SortExpression="Level">
                            <EditItemTemplate>
                                <asp:TextBox ID="LevelEditTxt" runat="server" Text='<%# Bind("Level") %>' onkeypress="return numeric(event)"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Level") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Subject of the Lecture" SortExpression="Lecture_Subject">
                            <EditItemTemplate>
                                <asp:TextBox ID="Lecture_SubjectEditTxt" runat="server" Text='<%# Bind("Lecture_Subject") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Lecture_Subject") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                            <EditItemTemplate>
                                <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Participation Resource Person / Panel Expert (if any): </b></u>
                <br />
                <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView11_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

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

                        <asp:TemplateField HeaderText="Organising Institution" SortExpression="Organising_Institution">
                            <EditItemTemplate>
                                <asp:TextBox ID="Organising_InstitutionEditTxt" runat="server" Text='<%# Bind("Organising_Institution") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Organising_Institution") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Theme" SortExpression="Theme">
                            <EditItemTemplate>
                                <asp:TextBox ID="ThemeEditTxt" runat="server" Text='<%# Bind("Theme") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Theme") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date" SortExpression="Date_Value">
                            <EditItemTemplate>
                                <asp:TextBox ID="Date_ValueEditTxt" runat="server" Text='<%# Bind("Date_Value") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Date_Value") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Level" SortExpression="Level">
                            <EditItemTemplate>
                                <asp:TextBox ID="LevelEditTxt" runat="server" Text='<%# Bind("Level") %>' onkeypress="return numeric(event)"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Level") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                            <EditItemTemplate>
                                <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <b><u>>> Research Guided: </u></b>
                <br />
                <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView12_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

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

                        <asp:TemplateField HeaderText="Nature" SortExpression="Nature">
                            <EditItemTemplate>
                                <asp:TextBox ID="NatureEditTxt" runat="server" Text='<%# Bind("Nature") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Nature") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Title" SortExpression="Title">
                            <EditItemTemplate>
                                <asp:TextBox ID="TitleEditTxt" runat="server" Text='<%# Bind("Title") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name of Scholar" SortExpression="ScholarName">
                            <EditItemTemplate>
                                <asp:TextBox ID="ScholarNameEditTxt" runat="server" Text='<%# Bind("ScholarName") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("ScholarName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Complete" SortExpression="Complete">
                            <EditItemTemplate>
                                <asp:TextBox ID="CompleteEditTxt" runat="server" Text='<%# Bind("Complete") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Complete") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Continuing" SortExpression="Continuing">
                            <EditItemTemplate>
                                <asp:TextBox ID="ContinuingEditTxt" runat="server" Text='<%# Bind("Continuing") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Continuing") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Extra Column 1" SortExpression="Extra_Col1">
                            <EditItemTemplate>
                                <asp:TextBox ID="Extra_Col1EditTxt" runat="server" Text='<%# Bind("Extra_Col1") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Extra_Col1") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Extra Column 2" SortExpression="Extra_Col2">
                            <EditItemTemplate>
                                <asp:TextBox ID="Extra_Col2EditTxt" runat="server" Text='<%# Bind("Extra_Col2") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Extra_Col2") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                            <EditItemTemplate>
                                <asp:TextBox ID="UploadedOnEditTxt" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:TextBox>
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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Co-Curricular Activities: </b></u>
                <br />
                <asp:GridView ID="GridView13" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

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

                        <asp:TemplateField HeaderText="Has it Helped you and the student in professional development" SortExpression="Helped">
                            <EditItemTemplate>
                                <asp:TextBox ID="HelpedEditTxt" runat="server" Text='<%# Bind("Helped") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Helped") %>'></asp:Label>
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

                    </Columns>
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Extra-Curricular Activities: </b></u>
                <br />
                <asp:GridView ID="GridView14" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Examinership (if any): </b></u>
                <br />
                <asp:GridView ID="GridView15" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView15_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Awards / Scholarship (if any): </b></u>
                <br />
                <asp:GridView ID="GridView16" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView16_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

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

                        <asp:TemplateField HeaderText="Awards/Scholarship (if any)" SortExpression="Awards_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="Awards_NameEditTxt" runat="server" Text='<%# Bind("Awards_Name") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Awards_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                            <EditItemTemplate>
                                <asp:TextBox ID="CommentEditTxt" runat="server" Text='<%# Bind("Comment") %>' TextMode="MultiLine" Rows="5"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                            <EditItemTemplate>
                                <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Membership of any Institute (if any): </b></u>
                <br />
                <asp:GridView ID="GridView17" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView17_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Font-Size="Medium">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <Columns>

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

                        <asp:TemplateField HeaderText="Name of the Institute" SortExpression="Institude_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="Institude_NameEditTxt" runat="server" Text='<%# Bind("Institude_Name") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Institude_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                            <EditItemTemplate>
                                <asp:TextBox ID="DurationEditTxt" runat="server" Text='<%# Bind("Duration") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Membership Year" SortExpression="MembershipYear">
                            <EditItemTemplate>
                                <asp:TextBox ID="MembershipYearEditTxt" runat="server" Text='<%# Bind("MembershipYear") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("MembershipYear") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Level" SortExpression="Level">
                            <EditItemTemplate>
                                <asp:TextBox ID="LevelEditTxt" runat="server" Text='<%# Bind("Level") %>' onkeypress="return numeric(event)"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Level") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                            <EditItemTemplate>
                                <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <br />

                <u><b>>> Any other Information: </b></u>
                <br />
                <asp:GridView ID="GridView18" runat="server" AutoGenerateColumns="False" DataKeyNames="S_No" OnRowCommand="GridView18_RowCommand" Font-Size="Medium" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>

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

                        <asp:TemplateField HeaderText="Information" SortExpression="InfoName">
                            <EditItemTemplate>
                                <asp:TextBox ID="InfoNameEditTxt" runat="server" Text='<%# Bind("InfoName") %>' Style='text-transform: uppercase'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("InfoName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                            <EditItemTemplate>
                                <asp:TextBox ID="CommentEditTxt" runat="server" Text='<%# Bind("Comment") %>' TextMode="MultiLine" Rows="5"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Uploaded On" SortExpression="UploadedOn">
                            <EditItemTemplate>
                                <asp:Label ID="UploadedOnEditLabel" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>
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
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>

                <%--<asp:Label ID="Label1" runat="server" Text="First Name: " Font-Bold="true"></asp:Label>
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
                <asp:TextBox ID="PhoneNoTxt" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span>
                    <asp:Label ID="Label12" runat="server" Text="Alternate No: " Font-Bold="true"></asp:Label>&nbsp;
                    <asp:TextBox ID="AlternateNoTxt" runat="server"></asp:TextBox><br />
                </span>

                <asp:RegularExpressionValidator ID="PhoneNoTxtRegularExpressionValidator1" runat="server" ControlToValidate="PhoneNoTxt" ErrorMessage="Invalid Phone Number" ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="AlternateNoTxtRegularExpressionValidator1" runat="server" ControlToValidate="AlternateNoTxt" ErrorMessage="Invalid Phone Number" ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>

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
                <asp:Button ID="SubmitBtn" runat="server" Text="Update Information" OnClick="SubmitBtn_Click" Font-Size="Smaller" Font-Bold="true" Height="46px" Width="200px" CssClass="Btn" />--%>
            </div>
        </div>
    </form>
</body>
</html>
