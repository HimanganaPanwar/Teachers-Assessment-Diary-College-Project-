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

namespace College_Project__FILE_UPLOAD_
{
    public partial class ResearchActivities_4_Table : System.Web.UI.Page
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
                string value = DropDownListInsert.SelectedItem.Value;

                string checkRecord = "select count(*) from ResearchActivities_4_COLLEGEPROJECT_FILE_UPLOAD where Teacher_ID = '" + IDLabel.Text + "' AND OrganisingBody = '" + OrganisingBody_Text.Text + "' AND DocumentType = '" + value + "' AND ThemeOfSeminar = '" + ThemeOfSeminar_Text.Text + "';";
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
                                    cmd.CommandText = "insert into ResearchActivities_4_COLLEGEPROJECT_FILE_UPLOAD(Teacher_ID, DocumentType, OrganisingBody, ThemeOfSeminar, Date, Level, TitleOfPaper, FileName, FileType, FileData) values(@Teacher_ID, @DocumentType, @OrganisingBody, @ThemeOfSeminar, @Date, @Level, @TitleOfPaper, @FileName, @FileType, @FileData)";

                                    cmd.Parameters.AddWithValue("@Teacher_ID", IDLabel.Text);
                                    cmd.Parameters.AddWithValue("@DocumentType", value);
                                    cmd.Parameters.AddWithValue("@OrganisingBody", OrganisingBody_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@ThemeOfSeminar", ThemeOfSeminar_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Date", CalendarTxt.Text);
                                    cmd.Parameters.AddWithValue("@Level", Level_Text.Text);
                                    cmd.Parameters.AddWithValue("@TitleOfPaper", PaperTitle_Text.Text.ToUpper());

                                    cmd.Parameters.AddWithValue("@FileName", filename);
                                    cmd.Parameters.AddWithValue("@FileType", filetype);
                                    cmd.Parameters.AddWithValue("@FileData", size);

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
                        cmd.CommandText = "SELECT * FROM ResearchActivities_4_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  @Teacher_ID";
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
            catch(SqlException se)
            {
                StatusLabel.Text = "SQL Exception! (Table not found)" + se.Message;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridviewData();
        }

        protected void ClearControls()
        {
            DropDownListInsert.ClearSelection();
            OrganisingBody_Text.Text = "";
            ThemeOfSeminar_Text.Text = "";
            Level_Text.Text = "";
            CalendarTxt.Text = "";
            PaperTitle_Text.Text = "";

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
                LecturerDataAccessLayerResearchActivities4.DeleteRecord(Convert.ToInt32(e.CommandArgument));
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

                string DocumentType = ((DropDownList)GridView1.Rows[rowIndex].FindControl("DropDownListDoc_TypeEdit")).SelectedValue;

                string OrganisingBody = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditOrganisingBody")).Text;

                string ThemeOfSeminar = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditThemeOfSeminar")).Text;

                DateTime Date = Convert.ToDateTime(((Label)GridView1.Rows[rowIndex].FindControl("EditDateLabel")).Text);

                int Level = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("EditLevel")).Text);

                string TitleOfPaper = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditTitleOfPaper")).Text;

                string FileName = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditFileName")).Text;

                LecturerDataAccessLayerResearchActivities4.UpdateRecord(S_No, DocumentType, OrganisingBody, ThemeOfSeminar, Date, Level, TitleOfPaper, FileName);

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
                        cmd.CommandText = "select FileName, FileData from ResearchActivities_4_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";
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

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql;

                    if (!string.IsNullOrEmpty(SearchTxt.Text.Trim()))
                    {
                        sql = "SELECT * FROM ResearchActivities_4_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND( OrganisingBody LIKE @SearchParameter + '%' OR ThemeOfSeminar LIKE @SearchParameter + '%' OR Date LIKE @SearchParameter + '%' OR Level LIKE @SearchParameter + '%' OR TitleOfPaper LIKE @SearchParameter + '%' );";
                        cmd.Parameters.AddWithValue("@SearchParameter", SearchTxt.Text.Trim());
                    }
                    else
                    {
                        sql = "SELECT * FROM ResearchActivities_4_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "';";
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

        protected void SearchDocTypeRadioButton_SelectedIndexChanged(object sender, EventArgs e)
        {
            string DocType = SearchDocTypeRadioButton.SelectedItem.Value;
            string sql = "SELECT * FROM ResearchActivities_4_COLLEGEPROJECT_FILE_UPLOAD WHERE DocumentType=@DocumentType OR @DocumentType = ''";
            using (SqlConnection con = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand(sql))
                {
                    cmd.Parameters.AddWithValue("@DocumentType", DocType);
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }
    }
}