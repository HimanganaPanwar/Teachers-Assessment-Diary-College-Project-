using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web.Security;
using System.Web.Services;

namespace College_Project__FILE_UPLOAD_
{
    public partial class INFORMATION_GENERAL_INFO_ : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["AdminEmail"] != null)
                {
                    BackToProfilesBtn.Visible = true;
                    LogoutBtn.Visible = false;
                    Change_Password.Visible = false;
                    DeleteAccount.Visible = false;
                    ReportProblem.Visible = false;
                    DisableAccount.Visible = true;
                }
                else if (Session["LecturerEmail"] != null)
                {
                    BackToProfilesBtn.Visible = false;
                    LogoutBtn.Visible = true;
                    Change_Password.Visible = true;
                    DeleteAccount.Visible = false;
                    ReportProblem.Visible = true;
                    DisableAccount.Visible = false;
                }

                if (!IsPostBack)
                {
                    try
                    {
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            string UserEmail = "";
                            //USING QUERY STRING:
                            if (Session["Row"] != null)
                            {
                                //Fetch the GridView Row from Session.
                                GridViewRow row = Session["Row"] as GridViewRow;

                                //Fetch and display the Cell values.
                                IDLabel.Text = row.Cells[0].Text;
                                UserEmail = row.Cells[3].Text;
                            }
                            else if (Request.QueryString["ID"] != null)
                            {
                                string TeacherID = "0";
                                TeacherID = Request.QueryString["ID"].ToString();
                                IDLabel.Text = TeacherID;
                            }
                            else if (Session["LecturerEmail"] != null)
                            {
                                UserEmail = Session["LecturerEmail"].ToString();
                            }
                            else
                            {
                                Response.Redirect("~/HOMEPAGE.aspx");
                            }

                            using (SqlCommand cmd = new SqlCommand("SELECT U_ID, First_Name, Last_Name, Profile_Image_Data FROM GeneralInfo_COLLEGEPROJECT_FILE_UPLOAD WHERE  U_ID = '" + IDLabel.Text + "' OR Email = '" + UserEmail + "';"))
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.Connection = con;
                                con.Open();
                                using (SqlDataReader sdr = cmd.ExecuteReader())
                                {
                                    sdr.Read();
                                    IDLabel.Text = sdr["U_ID"].ToString();

                                    ProfilePic.ImageUrl = sdr["Profile_Image_Data"].ToString();

                                    AddDataToSession();

                                    TeacherNameText.Text = sdr["First_Name"].ToString() + " " + sdr["Last_Name"].ToString();
                                    BindGridviewData();
                                }
                                con.Close();
                            }
                        }
                    }
                    catch (NullReferenceException ex)
                    {
                        Response.Redirect("~/HOMEPAGE.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/HOMEPAGE.aspx");
            }
        }

        private void AddDataToSession()
        {
            Session.Add("Teacher_ID", IDLabel.Text);
        }

        protected void CriteriaBtn_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                AddDataToSession();
                Response.Redirect("~/CRITERIA_PAGE.aspx?ID=" + IDLabel.Text);
            }
            else
            {
                AddDataToSession();
                Response.Redirect("~/CRITERIA_PAGE.aspx");
            }
        }

        public void ClearSession()
        {
            Session.Remove("Row");
            Session.Remove("AdminEmail");
            Session.Remove("AdminPassword");
            Session.Remove("LecturerEmail");
            Session.Remove("LecturerPassword");
            Session.Remove("Password");
            Session.Remove("Teacher_ID");
            Session.Remove("ID");
            Session.Remove("AdminEmail");
            Session.Abandon();
        }

        protected void Change_Password_Click(object sender, EventArgs e)
        {
            AddDataToSession();
            Response.Redirect("~/Email_Password_Page.aspx");
        }

        protected void DeleteAccount_Click(object sender, EventArgs e)
        {

        }

        protected void Personal_InfoBtn_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                AddDataToSession();
                Response.Redirect("~/Update_Personal_Info.aspx?ID=" + IDLabel.Text);
            }
            else
            {
                AddDataToSession();
                Session["Teacher_ID"] = IDLabel.Text;
                Response.Redirect("~/Update_Personal_Info.aspx");
            }
        }

        protected void ClearAllCache()
        {
            var nvc = HttpUtility.ParseQueryString(Request.Url.Query);
            nvc.Remove("ID");
            nvc.Remove("Row");
            nvc.Remove("LecturerEmail");
            nvc.Remove("Password");
            nvc.Remove("Teacher_ID");
            nvc.Remove("AdminEmail");
            nvc.Remove("LecturerPassword");
            nvc.Remove("AdminPassword");
            string url = Request.Url.AbsolutePath + "?" + nvc.ToString();

            ClearSession();

            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.Clear();
            Session.RemoveAll();
            System.Web.Security.FormsAuthentication.SignOut();

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";

            Response.ClearHeaders();
        }
        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            ClearAllCache();
            Response.Redirect("~/HOMEPAGE.ASPX");
        }

        protected void BackToProfilesBtn_Click(object sender, EventArgs e)
        {
            ClearSession();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int S_No = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Qualification_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";

                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Career_Advancement_Qualification_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";

                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }
        protected void GridView6_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from ResearchActivities_4_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView6_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Publication_Journals_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView7_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView8_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Publications_Projects_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView9_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Organized_Table_1_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView10_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView11_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Resources_Table_1_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView12_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView15_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Examinership_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView16_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Awards_Scholarship_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView17_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Institude_Membership_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        protected void GridView18_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from AnyOtherInfo_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                        int S_No = Convert.ToInt32(e.CommandArgument);
                        cmd.Parameters.AddWithValue("@S_No", S_No);

                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            Response.AddHeader("Content-Disposition",
                                                "attachment;filename=\"" + dr["FileName"] + "\"");
                            Response.BinaryWrite((byte[])dr["FileData"]);
                            Response.End();
                        }
                    }
                }
            }
        }

        private void BindGridviewData()
        {
            int Teacher_ID = Convert.ToInt32(IDLabel.Text);
            int Year = DateTime.Now.Year;

            string query = "SELECT * FROM Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Leave_Record_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Career_Advancement_Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM UnderGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM PostGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Publication_Journals_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Publications_Projects_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Organized_Table_1_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Resources_Table_1_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Co_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Extra_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Examinership_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Awards_Scholarship_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM Institude_Membership_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";
            query += "SELECT * FROM AnyOtherInfo_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  '" + Teacher_ID + "' and Year = '" + Year + "';";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            sda.Fill(ds);
                            GridView1.DataSource = ds.Tables[0];
                            GridView1.DataBind();

                            GridView2.DataSource = ds.Tables[1];
                            GridView2.DataBind();

                            GridView3.DataSource = ds.Tables[2];
                            GridView3.DataBind();

                            GridView4.DataSource = ds.Tables[3];
                            GridView4.DataBind();

                            GridView5.DataSource = ds.Tables[4];
                            GridView5.DataBind();

                            GridView6.DataSource = ds.Tables[5];
                            GridView6.DataBind();

                            GridView7.DataSource = ds.Tables[6];
                            GridView7.DataBind();

                            GridView8.DataSource = ds.Tables[7];
                            GridView8.DataBind();

                            GridView9.DataSource = ds.Tables[8];
                            GridView9.DataBind();

                            GridView10.DataSource = ds.Tables[9];
                            GridView10.DataBind();

                            GridView11.DataSource = ds.Tables[10];
                            GridView11.DataBind();

                            GridView12.DataSource = ds.Tables[11];
                            GridView12.DataBind();

                            GridView13.DataSource = ds.Tables[12];
                            GridView13.DataBind();

                            GridView14.DataSource = ds.Tables[13];
                            GridView14.DataBind();

                            GridView15.DataSource = ds.Tables[14];
                            GridView15.DataBind();

                            GridView16.DataSource = ds.Tables[15];
                            GridView16.DataBind();

                            GridView17.DataSource = ds.Tables[16];
                            GridView17.DataBind();

                            GridView18.DataSource = ds.Tables[17];
                            GridView18.DataBind();
                        }
                    }
                }
            }
        }

        protected void SearchDataBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                try
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        string sql;

                        if (!string.IsNullOrEmpty(SelectYearTxt.Text.Trim()))
                        {
                            sql = "SELECT * FROM Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Leave_Record_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Career_Advancement_Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM UnderGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM PostGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Publication_Journals_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Publications_Projects_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Organized_Table_1_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Resources_Table_1_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Co_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Extra_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Examinership_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Awards_Scholarship_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM Institude_Membership_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";
                            sql += "SELECT * FROM AnyOtherInfo_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND Year= '" + SelectYearTxt.Text + "' ;";

                            cmd.CommandText = sql;
                            cmd.Connection = con;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                using (DataSet ds = new DataSet())
                                {
                                    sda.Fill(ds);

                                    GridView1.DataSource = ds.Tables[0];
                                    GridView1.DataBind();

                                    GridView2.DataSource = ds.Tables[1];
                                    GridView2.DataBind();

                                    GridView3.DataSource = ds.Tables[2];
                                    GridView3.DataBind();

                                    GridView4.DataSource = ds.Tables[3];
                                    GridView4.DataBind();

                                    GridView5.DataSource = ds.Tables[4];
                                    GridView5.DataBind();

                                    GridView6.DataSource = ds.Tables[5];
                                    GridView6.DataBind();

                                    GridView7.DataSource = ds.Tables[6];
                                    GridView7.DataBind();

                                    GridView8.DataSource = ds.Tables[7];
                                    GridView8.DataBind();

                                    GridView9.DataSource = ds.Tables[8];
                                    GridView9.DataBind();

                                    GridView10.DataSource = ds.Tables[9];
                                    GridView10.DataBind();

                                    GridView11.DataSource = ds.Tables[10];
                                    GridView11.DataBind();

                                    GridView12.DataSource = ds.Tables[11];
                                    GridView12.DataBind();

                                    GridView13.DataSource = ds.Tables[12];
                                    GridView13.DataBind();

                                    GridView14.DataSource = ds.Tables[13];
                                    GridView14.DataBind();

                                    GridView15.DataSource = ds.Tables[14];
                                    GridView15.DataBind();

                                    GridView16.DataSource = ds.Tables[15];
                                    GridView16.DataBind();

                                    GridView17.DataSource = ds.Tables[16];
                                    GridView17.DataBind();

                                    GridView18.DataSource = ds.Tables[17];
                                    GridView18.DataBind();
                                }
                            }
                        }
                        else
                        {
                            BindGridviewData();
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

        protected void DeleteAccount_Click1(object sender, EventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand cmd = new SqlCommand("sp_DeleteEntireRecord_COLLEGEPROJECT_FILE_UPLOAD", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@U_ID", IDLabel.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                    ClearAllCache();
                    Response.Redirect("~/HOMEPAGE.aspx");
                }
            }
            else
            {
                //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Account was not deleted!')", true);
                //Response.Write("<script>alert('Open Message!');</script>");
                MaintainScrollPositionOnPostBack = true;
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true);
            }
        }

        protected void ReportProblem_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                AddDataToSession();
                Response.Redirect("~/ReportProblem.aspx?ID=" + IDLabel.Text);
            }
            else
            {
                AddDataToSession();
                Response.Redirect("~/ReportProblem.aspx");
            }
        }

        protected void DisableAccount_Click(object sender, EventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    SqlCommand cmd = new SqlCommand("SP_DisableAccount", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@U_ID", IDLabel.Text);
                    cmd.Parameters.AddWithValue("@AccountStatus", "Disabled");

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                    ClearAllCache();
                    ScriptManager.RegisterStartupScript(this, GetType(), "wasDisabled", "wasDisabled();", true);
                    Response.Redirect("~/HOMEPAGE.aspx");
                }
            }
            else
            {
                //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Account was not deleted!')", true);
                //Response.Write("<script>alert('Open Message!');</script>");
                MaintainScrollPositionOnPostBack = true;
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true);
            }
        }
    }
}