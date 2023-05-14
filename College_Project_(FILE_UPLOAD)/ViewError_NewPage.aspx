<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewError_NewPage.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.ViewError_NewPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <%--https://www.aspsnippets.com/Articles/Retrieve-images-using-a-file-path-stored-in-database-in-ASPNet.aspx--%>


    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
    <script type="text/javascript">
        //$(function () {
        //    $("#dialog").dialog({
        //        autoOpen: false,
        //        modal: true,
        //        height: 600,
        //        width: 600,
        //        title: "Zoomed Image"
        //    });
        //    $("[id*=AttachedImg] img").click(function () {
        //        $('#dialog').html('');
        //        $('#dialog').append($(this).clone());
        //        $('#dialog').dialog('open');
        //    });
        //});

        $(function () {
            $("[id*=AttachedImg] img").elevateZoom({
                cursor: 'pointer',
                tint: true,
                tintColour: '#F90',
                tintOpacity: 0.5,
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="BackToProfilesBtn" runat="server" Text="<< BACK TO PROFILES" PostBackUrl="~/ViewProblems.aspx" OnClick="BackToProfilesBtn_Click" />

            <br />
            <br />

            <asp:Label ID="Label1" runat="server" Text="LECTURER ID: "></asp:Label>
            <asp:Label ID="LecturerIDLbl" runat="server" Text=""></asp:Label>

            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

            <asp:Label ID="Label2" runat="server" Text="S.NO.: "></asp:Label>
            <asp:Label ID="S_NO_Lbl" runat="server" Text=""></asp:Label>

            <br />
            <br />

            <asp:Label ID="Label7" runat="server" Text="ERROR STATUS: "></asp:Label>
            <asp:Label ID="ShowErrorStatusLbl" runat="server" Text=""></asp:Label>

            &emsp;&emsp;&emsp;&emsp;&emsp;

            <asp:Button ID="UpdateStatusBtn" runat="server" Text="Update Status to Solved" OnClick="UpdateStatusBtn_Click" />

            <br />
            <br />

            <asp:Label ID="Label3" runat="server" Text="DATE: "></asp:Label>
            <asp:Label ID="DateLbl" runat="server" Text=""></asp:Label>

            <br />
            <br />

            <asp:Label ID="Label4" runat="server" Text="TITLE: "></asp:Label>
            <asp:Label ID="TitleLbl" runat="server" Text=""></asp:Label>

            <br />
            <br />

            <asp:Label ID="Label5" runat="server" Text="DESCRIPTION: "></asp:Label>
            <asp:TextBox ID="DescTxt" runat="server" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label6" runat="server" Text="IMAGE ATTACHED: "></asp:Label>
            <asp:Image ID="AttachedImg" runat="server" Height = "250px" Width = "280px" data-zoom-image='<%# ResolveUrl(Eval("largeimg").ToString()) %>' />
        </div>
    </form>
</body>
</html>
