<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRITERIA_PAGE.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.CRITERIA_PAGE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Criteria Form</title>
    <script type="text/javascript" language="javascript">
        window.onload = function () {
            noBack();
        }
        function noBack() {
            window.history.forward();
        }
    </script>

    <style>
        * {
            box-sizing: border-box;
        }

        /* Create two equal columns that floats next to each other */
        .column {
            float: left;
            width: 50%;
            padding: 10px;
            height: 950px; /* Should be removed. Only for demonstration */
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
            }
        }
    </style>

</head>
<body>
    <form id="form2" runat="server">
        <asp:Button ID="BackButton" runat="server" Text="<< BACK TO HOMEPAGE" OnClick="BackButton_Click1" />
        <br />
        <br />

        <div class="row">
            <div class="column" style="background-color: #aaa;">
                <h2>
                    <asp:LinkButton ID="QualificationLinkBtn" runat="server" Font-Bold="true" ForeColor="black" Font-Names="AndradeBold" OnClick="QualificationLinkBtn_Click">
                >> Added qualifications acquired during the session
                    </asp:LinkButton>
                    <br />
                    <br />
                    <br />

                    <asp:LinkButton ID="LeaveRecordLinkBtn" runat="server" Font-Bold="true" ForeColor="black" Font-Names="AndradeBold" OnClick="LeaveRecordLinkBtn_Click">
                >> Leave Record
                    </asp:LinkButton>
                    <br />
                    <br />
                    <br />

                    <asp:LinkButton ID="CareerAdvancementQualificationLinkBtn" runat="server" Font-Bold="true" ForeColor="black" Font-Names="AndradeBold" OnClick="CareerAdvancementQualificationLinkBtn_Click">
                >> Career Advancement qualification achieved during the session
                    </asp:LinkButton>
                    <br />

                    <u>
                        <center><p style="font-size: larger">Self-Assessment Format</p></center>
                    </u>

                    <p style="font-size: x-large"><u>I. Teaching Activities:</u></p>

                    &emsp;&emsp;<asp:LinkButton ID="Under_Graduate_CoursesLinkBtn" runat="server" Font-Bold="False" ForeColor="White" Font-Names="AndradeBold" OnClick="Under_Graduate_CoursesLinkBtn_Click">
                        (a) Undergraduate Courses
                    </asp:LinkButton>
                    <br />
                    <br />

                    &emsp;&emsp;<asp:LinkButton ID="Post_Graduate_CoursesLinkBtn" runat="server" Font-Bold="False" ForeColor="White" Font-Names="AndradeBold" OnClick="Post_Graduate_CoursesLinkBtn_Click">
                        (b) Post-Graduate Courses
                    </asp:LinkButton>

                    <p style="font-size: x-large"><u>II. Research Activities: </u></p>

                    &emsp;&emsp;<asp:LinkButton ID="Research_ActivitiesLinkBtn" runat="server" Font-Bold="False" ForeColor="White" Font-Names="AndradeBold" OnClick="Research_ActivitiesLinkBtn_Click">
                        (a) Seminars, Workshops, Conference Attended / Papers Presented
                    </asp:LinkButton>
                    <br />
                    <br />

                    &emsp;&emsp;<asp:LinkButton ID="Seminars_Conference_Proceedings_LinkBtn" runat="server" Font-Bold="False" ForeColor="White" Font-Names="AndradeBold" OnClick="Seminars_Conference_Proceedings_LinkBtn_Click">
                        (b) Publications: Seminars and Conference Proceedings
                    </asp:LinkButton>
                    <br />
                    <br />

                    &emsp;&emsp;<asp:LinkButton ID="Journals_LinkBtn" runat="server" Font-Bold="False" ForeColor="White" Font-Names="AndradeBold" OnClick="Journals_LinkBtn_Click">
                        (c) Publications: Journals
                    </asp:LinkButton>
                    <br />
                    <br />

                    &emsp;&emsp;<asp:LinkButton ID="Books_Monographs_LinkBtn" runat="server" Font-Bold="False" ForeColor="White" Font-Names="AndradeBold" OnClick="Books_Monographs_LinkBtn_Click">
                        (d) Publications: Books / Monogarphs
                    </asp:LinkButton>
                    <br />
                    <br />

                    &emsp;&emsp;<asp:LinkButton ID="Projects_LinkBtn" runat="server" Font-Bold="False" ForeColor="White" Font-Names="AndradeBold" OnClick="Projects_LinkBtn_Click">
                        (e) Projects (if any)
                    </asp:LinkButton>
                    <br />
                    <br />

                    &emsp;&emsp;<asp:LinkButton ID="Organized_Table1_LinkBtn" runat="server" Font-Bold="False" ForeColor="White" Font-Names="AndradeBold" OnClick="Organized_Table1_LinkBtn_Click">
                        (f) Seminar / Workshops / Confreres organised (if any) 
                    </asp:LinkButton>
                    <br />
                    <br />
                    
                    &emsp;&emsp;<asp:LinkButton ID="Organized_Table2_LinkBtn" runat="server" Font-Bold="False" ForeColor="White" Font-Names="AndradeBold" OnClick="Organized_Table2_LinkBtn_Click">
                        (g) Extension Lectures given (if any)
                    </asp:LinkButton>
                    <br />
                    <br />

                    &emsp;&emsp;<asp:LinkButton ID="Resources_Table1_LinkBtn" runat="server" Font-Bold="False" ForeColor="White" Font-Names="AndradeBold" OnClick="Resources_Table1_LinkBtn_Click">
                        (h) Participation Resource Person / Panel Expert (if any)
                    </asp:LinkButton>
                </h2>
            </div>


            <div class="column" style="background-color: #bbb;">
                <h2>
                    <asp:LinkButton ID="Resources_Table2_LinkBtn" runat="server" Font-Bold="true" ForeColor="Black" OnClick="Resources_Table2_LinkBtn_Click">
                        III. Research Guided
                    </asp:LinkButton>
                    <br />
                    <br />
                    <br />

                    <asp:LinkButton ID="CoCurricular_LinkBtn" runat="server" Font-Bold="true" ForeColor="black" Font-Names="AndradeBold" OnClick="CoCurricular_LinkBtn_Click">
                        IV. Co-Curricular
                    </asp:LinkButton>
                    <br />
                    <br />
                    <br />
                    
                    <asp:LinkButton ID="ExtraCurricular_LinkBtn" runat="server" Font-Bold="true" ForeColor="black" Font-Names="AndradeBold" OnClick="ExtraCurricular_LinkBtn_Click">
                        V. Extra-Curricular
                    </asp:LinkButton>
                    <br />
                    <br />
                    <br />

                    <asp:LinkButton ID="ExaminershipLinkBtn" runat="server" Font-Bold="true" ForeColor="black" Font-Names="AndradeBold" OnClick="ExaminershipLinkBtn_Click">
                        VI. Examiner Ship (if any)
                    </asp:LinkButton>
                    <br />
                    <br />
                    <br />

                    <asp:LinkButton ID="Awards_ScholarshipLinkBtn" runat="server" Font-Bold="true" ForeColor="black" Font-Names="AndradeBold" OnClick="Awards_ScholarshipLinkBtn_Click">
                        VII. Awards / Scholarship (if any)
                    </asp:LinkButton>
                    <br />
                    <br />
                    <br />

                    <asp:LinkButton ID="Institude_Membership_LinkBtn" runat="server" Font-Bold="true" ForeColor="black" Font-Names="AndradeBold" OnClick="Institude_Membership_LinkBtn_Click">
                        VIII. Membership of any Institute (if any)
                    </asp:LinkButton>
                    <br />
                    <br />
                    <br />

                    <asp:LinkButton ID="AnyOtherInfo_TableLinkBtn" runat="server" Font-Bold="true" ForeColor="black" Font-Names="AndradeBold" OnClick="AnyOtherInfo_TableLinkBtn_Click">
                        IX. Any other Information
                    </asp:LinkButton>
                    <br />
                    <br />
                    <br />
                </h2>
            </div>
        </div>
    </form>
</body>
</html>
