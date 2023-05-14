﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace College_Project__FILE_UPLOAD_
{
    public partial class Organized_Table_2_Table : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                IDLabel.Text = Session["Teacher_ID"].ToString();

                if (!IsPostBack)
                {
                    Calendar1.Visible = false;
                    BindGridviewData();
                }
            }
            catch(NullReferenceException ex)
            {
                Response.Redirect("~/HOMEPAGE.aspx");
            }
        }

        protected void CalendarImageButton_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsWeekend || e.Day.IsOtherMonth)
            {
                e.Cell.BackColor = System.Drawing.Color.LightGray;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            CalendarTxt.Text = Calendar1.SelectedDate.ToLongDateString();
            Calendar1.Visible = false;
        }

        protected void Insert_Btn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conCheckRecord = new SqlConnection(strCon))
            {
                string checkRecord = "select count(*) from Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD where Year = '" + YearTxt.Text + "' AND Organisation_Name = '" + OrganizationNameTxt.Text + "' AND Teacher_ID = '" + IDLabel.Text + "' AND Date_Value = '" + CalendarTxt.Text + "' AND Level = '" + LevelTxt.Text + "' AND Lecture_Subject = '" + SubjectTxt.Text + "';";
                SqlCommand checkRecordCmd = new SqlCommand(checkRecord, conCheckRecord);
                conCheckRecord.Open();
                int temp = Convert.ToInt32(checkRecordCmd.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    StatusLabel.Text = "RECORD ALREADY EXISTS!";
                    StatusLabel.ForeColor = System.Drawing.Color.Red;
                    ClearControls();
                }
                else
                {
                    if (FileUpload1.HasFile)
                    {
                        int filesize = FileUpload1.PostedFile.ContentLength;
                        if (filesize < 20728650)    //20MB
                        {
                            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                            string filetype = Path.GetExtension(FileUpload1.PostedFile.FileName);
                            Stream str = FileUpload1.PostedFile.InputStream;
                            BinaryReader br = new BinaryReader(str);
                            Byte[] size = br.ReadBytes((int)str.Length);

                            using (SqlConnection con = new SqlConnection(strCon))
                            {
                                using (SqlCommand cmd = new SqlCommand())
                                {
                                    cmd.CommandText = "insert into Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD(Teacher_ID, Year, Organisation_Name, Date_Value, Level, Lecture_Subject, FileName, FileType, FileData, UploadedOn) values(@Teacher_ID, @Year, @Organisation_Name, @Date_Value, @Level, @Lecture_Subject, @FileName, @FileType, @FileData, @UploadedOn)";

                                    cmd.Parameters.AddWithValue("@Teacher_ID", IDLabel.Text);
                                    cmd.Parameters.AddWithValue("@Year", YearTxt.Text);
                                    cmd.Parameters.AddWithValue("@Organisation_Name", OrganizationNameTxt.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Date_Value", CalendarTxt.Text);
                                    cmd.Parameters.AddWithValue("@Level", LevelTxt.Text);
                                    cmd.Parameters.AddWithValue("@Lecture_Subject", SubjectTxt.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@FileName", filename);
                                    cmd.Parameters.AddWithValue("@FileType", filetype);
                                    cmd.Parameters.AddWithValue("@FileData", size);
                                    cmd.Parameters.AddWithValue("@UploadedOn", DateTime.Now);

                                    cmd.Connection = con;
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                    con.Close();
                                    BindGridviewData();
                                    StatusLabel.Text = "RECORD UPLOADED !";
                                    StatusLabel.ForeColor = System.Drawing.Color.Green;
                                    ClearControls();
                                }
                            }
                        }
                        else
                        {
                            StatusLabel.Text = "File size exceeds maximum limit 20 MB.";
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "myfunction();", true);
                    }
                }
            }
        }
        private void BindGridviewData()
        {
            try
            {
                int Teacher_ID = Convert.ToInt32(Session["Teacher_ID"]);

                using (SqlConnection con = new SqlConnection(strCon))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "SELECT * FROM Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  @Teacher_ID";
                        cmd.Parameters.AddWithValue("@Teacher_ID", IDLabel.Text);
                        cmd.Connection = con;
                        con.Open();
                        DataSet ds = new DataSet();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                        con.Close();
                    }
                }
            }
            catch (SqlException se)
            {
                StatusLabel.Text = "SQL Exception! (Table not found)" + se.Message;
            }
        }
        protected void ClearControls()
        {
            YearTxt.Text = "";
            OrganizationNameTxt.Text = "";
            LevelTxt.Text = "";
            SubjectTxt.Text = "";
            CalendarTxt.Text = "";

            Calendar1.VisibleDate = DateTime.Today;
            Calendar1.SelectedDates.Clear();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int S_No = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                GridView1.EditIndex = rowIndex;
                BindGridviewData();
            }
            else if (e.CommandName == "DeleteRow")
            {
                LecturerDataAccessLayerOrganized_Table_2.DeleteRecord(Convert.ToInt32(e.CommandArgument));
                BindGridviewData();
                StatusLabel.Text = "ROW DELETED!";
                StatusLabel.ForeColor = System.Drawing.Color.Red;
            }
            else if (e.CommandName == "CancelUpdate")
            {
                GridView1.EditIndex = -1;
                BindGridviewData();
                StatusLabel.Text = "UPDATE CANCELED!";
                StatusLabel.ForeColor = System.Drawing.Color.Red;
            }
            else if (e.CommandName == "UpdateRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;

                int Year = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("YearEditTxt")).Text);

                string Organisation_Name = ((TextBox)GridView1.Rows[rowIndex].FindControl("Organisation_NameEditTxt")).Text;

                string Date_Value = ((TextBox)GridView1.Rows[rowIndex].FindControl("Date_ValueEditTxt")).Text;

                int Level = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("LevelEditTxt")).Text);

                string Lecture_Subject = ((TextBox)GridView1.Rows[rowIndex].FindControl("Lecture_SubjectEditTxt")).Text;

                string FileName = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditFileName")).Text;

                LecturerDataAccessLayerOrganized_Table_2.UpdateRecord(S_No, Year, Organisation_Name, Date_Value, Level, Lecture_Subject, FileName);

                GridView1.EditIndex = -1;
                BindGridviewData();
                StatusLabel.Text = "ROW UPDATED!";
                StatusLabel.ForeColor = System.Drawing.Color.Green;
            }
            else if(e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select FileName, FileData from Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
                     
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
        protected void BackButton_Click(object sender, EventArgs e)
        {
            if (Session["Row"] != null || Request.QueryString["ID"] != null)
            {
                string Teacher_ID = Request.QueryString["ID"].ToString();
                Session["ID"] = Teacher_ID;

                string AdminEmail = Session["AdminEmail"].ToString();
                Session["AdminEmail"] = AdminEmail;

                Response.Redirect("~/CRITERIA_PAGE.aspx?ID=" + Teacher_ID);
            }
            else if (Session["LecturerEmail"] != null)
            {
                Response.Redirect("~/CRITERIA_PAGE.aspx");
            }
            else
            {
                Response.Redirect("~/HOMEPAGE.ASPX");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridviewData();
        }

        protected void Reset_Btn_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql;

                    if (!string.IsNullOrEmpty(SearchTxt.Text.Trim()))
                    {
                        sql = "SELECT * FROM Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND( Year LIKE @SearchParameter + '%' OR Organisation_Name LIKE @SearchParameter + '%' OR Date_Value LIKE @SearchParameter + '%' OR Level LIKE @SearchParameter + '%' OR Lecture_Subject LIKE @SearchParameter + '%' OR FileName LIKE @SearchParameter + '%' );";
                        cmd.Parameters.AddWithValue("@SearchParameter", SearchTxt.Text.Trim());
                    }
                    else
                    {
                        sql = "SELECT * FROM Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "';";
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }
}