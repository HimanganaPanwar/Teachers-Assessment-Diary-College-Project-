<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HOMEPAGE.aspx.cs" Inherits="College_Project__FILE_UPLOAD_.HOMEPAGE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HomePage</title>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>

    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

        .sidebar {
            position: fixed;
            width: 180px;
            top: 39px;
            left: 0px;
            bottom: -110px;
            background: #116466;
            padding-top: 40px;
            height: 350px;
            bottom: 60px;
            margin-top: 40px;
        }

            .sidebar h1 {
                display: block;
                padding: 10px 20px;
                color: #fff;
                text-decoration: none;
                font-family: "Rubik";
                letter-spacing: 2px;
                font-weight: 400;
                margin: 0;
                font-size: 25px;
                text-transform: uppercase;
                width: 159px;
            }

            .sidebar a {
                display: block;
                padding: 15px 20px;
                color: #bbb;
                text-decoration: none;
                font-family: "Rubik";
                letter-spacing: 3px;
            }

                .sidebar a:hover {
                    color: #fff;
                    margin-left: 20px;
                    transition: 0.4s;
                }

        * {
            margin: 0 0 0 236;
            padding: 0;
            color: #d9d9d9;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .content1 {
            position: relative;
            margin: 130px auto;
            text-align: center;
            padding: 0 20px;
            background: #116466;
        }

            .content1 .text {
                font-size: 2.5rem;
                font-weight: 600;
                color: #202020;
            }

            .content1 .p {
                font-size: 2.1875rem;
                font-weight: 600;
                color: #202020;
            }


        footer {
            position: fixed;
            bottom: 140px;
            width: 100%;
            background: #111;
            left: 0px;
            height: 40px;
            padding-top: -200px;
        }

        .main-content {
            display: flex;
            background: #116466;
        }

            .main-content .box {
                flex-basis: 50%;
                padding: 10px 20px;
            }

        .box h2 {
            font-size: 1.125rem;
            font-weight: 600;
            text-transform: uppercase;
            height: 27px;
        }

        .box .content {
            margin: 20px 0 0 0;
            position: relative;
        }

            .box .content:before {
                position: absolute;
                content: '';
                top: -10px;
                height: 2px;
                width: 100%;
                background: #1a1a1a;
            }

            .box .content:after {
                position: absolute;
                content: '';
                height: 2px;
                width: 15%;
                background: #f12020;
                top: -10px;
            }

        .left .content p {
            text-align: justify;
        }


        .center .content .fas {
            font-size: 1.4375rem;
            background: #1a1a1a;
            height: 45px;
            width: 45px;
            line-height: 45px;
            text-align: center;
            border-radius: 50%;
            transition: 0.3s;
            cursor: pointer;
        }

            .center .content .fas:hover {
                background: #f12020;
            }

        .center .content .text {
            font-size: 1.0625rem;
            font-weight: 500;
            padding-left: 10px;
        }

        .center .content .phone {
            margin: 15px 0;
        }

        .right form input:focus,
        .right form textarea:focus {
            outline-color: #3498db;
        }


        .bottom center {
            padding: 5px;
            font-size: 0.9375rem;
            background: #151515;
        }

            .bottom center span {
                color: #656565;
            }

            .bottom center a {
                color: #f12020;
                text-decoration: none;
            }

                .bottom center a:hover {
                    text-decoration: underline;
                }

        @media screen and (max-width: 900px) {
            footer {
                position: relative;
                bottom: 0px;
            }

            .main-content {
                flex-wrap: wrap;
                flex-direction: column;
            }

                .main-content .box {
                    margin: 5px 0;
                }
        }

        .wrapper {
            margin-left: 20px;
            height: 188px;
            width: 573px;
            float: left;
            position: relative;
            top: 4px;
            left: 304px;
        }

        .image {
            float: left;
        }

        body {
            background-image: linear-gradient(to right top, #909018, #2e8949, #007671, #005d7a, #344260);
            background-size: cover;
        }
    </style>
</head>
<body>
    <div class="header">
        <h3><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mahila</span> P.G. <span>Mahavidyalaya </h3>
    </div>

    <div class="sidebar">
        <asp:Label ID="Label4" runat="server" Text="ABOUT CLG" ForeColor="WhiteSmoke" Font-Bold="True" Font-Names="Bell MT" Font-Size="Large"></asp:Label>
        <a href="https://www.mpgmahavidyalaya.org/"><i class="fas fa-search"></i>Search</a>
        <a href="https://www.facebook.com/mmvjodhpur"><i class="fab fa-facebook-f"></i>Facebook</a>
        <a href="https://www.instagram.com/mmvjodhpur/"><i class="fab fa-instagram"></i>Instagram</a>
        <a href="https://twitter.com/mmvjodhpur?lang=en"><i class="fab fa-twitter"></i>Twitter</a>
        <a href="https://www.facebook.com/mmvjodhpur"><i class="fab fa-youtube"></i>Youtube</a>

    </div>
    <form id="form1" runat="server">


        <div class="wrapper">

            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
           
            <asp:Button ID="Registration_Btn" runat="server" Text="REGISTRATION" Height="51px" Width="246px" BackColor="#116466" Font-Bold="True" Font-Names="Andalus" Font-Size="X-Large" ForeColor="White" OnClick="Registration_Btn_Click1" />
            <br />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
           
            <asp:Button ID="LoginAs_Btn" runat="server" Text="LOGIN AS " Height="54px" Width="246px" BackColor="#116466" Font-Bold="True" Font-Names="Andalus" Font-Size="X-Large" ForeColor="White" OnClick="LoginAs_Btn_Click" />

        </div>

    </form>
    <footer>
        <div class="main-content">
            <div class="left box">
                <asp:Label ID="map" runat="server" Text="MAP" Font-Bold="True" Font-Names="Bell MT" Font-Size="Medium"></asp:Label>
                <%-- <h2>MAP</h2>--%>
                <div class="content">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m26!1m12!1m3!1d20237.90828451217!2d72.99272268698228!3d26.27494919392872!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m11!3e6!4m3!3m2!1d26.273711199999997!2d73.0051052!4m5!1s0x39418e7e279e4b4d%3A0xcc65947eaefa6426!2smmv%20jodhpur!3m2!1d26.283247499999998!2d72.9900634!5e0!3m2!1sen!2sin!4v1618385967980!5m2!1sen!2sin" style="border-style: none; border-color: inherit; border-width: 0; height: 104px; width: 370px;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>

            <div class="center box">
                <asp:Label ID="add" runat="server" Text="Address" Font-Bold="True" Font-Names="Bell MT" Font-Size="Medium"></asp:Label>
                <%-- <h2>Address</h2>--%>
                <div class="content">
                    <div class="place">
                        <span class="fas fa-map-marker-alt"></span>
                        <asp:Label ID="Label3" runat="server" Text="Pratap Nagar" Font-Names="AmerType Md BT" ForeColor="white"></asp:Label>
                    </div>


                </div>
            </div>

            <div class="right box">
                <asp:Label ID="con" runat="server" Text="Contact" Font-Bold="True" Font-Italic="False" Font-Names="Bell MT" Font-Size="Medium"></asp:Label>
                <div class="content">
                    <div class="email">
                        <span class="fas fa-envelope"></span>
                        <asp:Label ID="Label1" runat="server" Text="MMV@gmail.com" Font-Names="AmerType Md BT" ForeColor="White"></asp:Label>
                        <br />
                    </div>
                    <div class="phone">
                        <span class="fas fa-phone-alt"></span>
                        <asp:Label ID="Label2" runat="server" Text="+089-765432100" Font-Names="AmerType Md BT" ForeColor="White"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom">
            <center>
          <span class="credit">Created By <a href="https://www.mpgmahavidyalaya.org/">MMV</a> | </span>
          <span class="far fa-copyright"></span><span> 2020 All rights reserved.</span>
        </center>
        </div>
    </footer>

</body>
</html>
