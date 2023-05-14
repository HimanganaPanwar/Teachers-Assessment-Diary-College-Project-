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
    public partial class Qualifications : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                IDLabel.Text = Session["Teacher_ID"].ToString();

                if (!IsPostBack)
                {
                    BindGridviewData();

                    if (AnyOtherRadio.Checked == true)
                    {
                        AnyOtherRecordTxt.Visible = true;
                    }
                    else
                    {
                        AnyOtherRecordTxt.Visible = false;
                    }
                }
                if (AnyOtherRadio.Checked == true)
                {
                    AnyOtherRecordTxt.Visible = true;
                }
                else
                {
                    AnyOtherRecordTxt.Visible = false;
                }
            }
            catch (NullReferenceException n)
            {
                Response.Redirect("~/HOMEPAGE.ASPX");
            }
        }
        protected void Insert_Btn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conCheckRecord = new SqlConnection(strCon))
            {
                string doc_typevalue = "";
                if (Marksheet10.Checked)
                    doc_typevalue = "10th Marksheet";
                else if (Marksheet12.Checked)
                    doc_typevalue = "12th Marksheet";
                else if (AnyOtherRadio.Checked)
                    doc_typevalue = "Any Other Document";

                if (AnyOtherRadio.Checked == true)
                {
                    AnyOtherRecordTxt.Visible = true;
                }

                string checkRecord = "select count(*) from Qualification_COLLEGEPROJECT_FILE_UPLOAD where Teacher_ID = '" + IDLabel.Text + "' AND Year = '" + Year_Text.Text + "' AND Document_Type = '" + doc_typevalue + "' AND AnyOther = '" + AnyOtherRecordTxt.Text + "';";
                SqlCommand checkRecordCmd = new SqlCommand(checkRecord, conCheckRecord);
                conCheckRecord.Open();
                int temp = Convert.ToInt32(checkRecordCmd.ExecuteScalar().ToString());

                //SqlDataReader reader = checkRecordCmd.ExecuteReader();
                //if (reader.HasRows)
                //{
                //    StatusLabel.Text = "RECORD ALREADY EXISTS!";
                //    StatusLabel.ForeColor = System.Drawing.Color.Red;
                //    ClearControls();
                //}
                //else
                //{ 

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
                                    string getValue = "";
                                    if (AnyOtherRecordTxt.Visible == true)
                                    {
                                        getValue = AnyOtherRecordTxt.Text.ToUpper();
                                    }
                                    else
                                    {
                                        getValue = "NULL";
                                    }

                                    cmd.CommandText = "insert into Qualification_COLLEGEPROJECT_FILE_UPLOAD(Teacher_ID, Year, Document_Type, AnyOther, FileName, FileType, FileData, UploadedOn) values(@Teacher_ID, @Year, @Document_Type, @AnyOther, @FileName, @FileType, @FileData, @UploadedOn)";

                                    cmd.Parameters.AddWithValue("@Teacher_ID", IDLabel.Text);
                                    cmd.Parameters.AddWithValue("@Year", Year_Text.Text);
                                    cmd.Parameters.AddWithValue("@Document_Type", doc_typevalue);
                                    cmd.Parameters.AddWithValue("@AnyOther", getValue);
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
            int Teacher_ID = Convert.ToInt32(Session["Teacher_ID"]);

            using (SqlConnection con = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  @Teacher_ID";
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
        protected void ClearControls()
        {
            Year_Text.Text = "";

            AnyOtherRecordTxt.Text = "";
            AnyOtherRecordTxt.Visible = false;

            if (Marksheet10.Checked == true)
            {
                Marksheet10.Checked = true;
            }
            else if (Marksheet12.Checked == true)
            {
                Marksheet12.Checked = false;
                Marksheet10.Checked = true;
            }
            else if (AnyOtherRadio.Checked == true)
            {
                AnyOtherRadio.Checked = false;
                Marksheet10.Checked = true;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int S_No = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "DeleteRow")
            {
                LecturerDataAccessLayerQualificationTbl.DeleteRecord(Convert.ToInt32(e.CommandArgument));
                BindGridviewData();
                StatusLabel.Text = "ROW DELETED!";
                StatusLabel.ForeColor = System.Drawing.Color.Red;
            }
            else if (e.CommandName == "DownloadDoc")
            {
                using (SqlConnection con = new SqlConnection(strCon))
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
                con.Open();
                try
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        string sql;

                        if (!string.IsNullOrEmpty(SearchTxt.Text.Trim()))
                        {
                            sql = "SELECT * FROM Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND( Year LIKE @SearchParameter + '%' OR Document_Type LIKE @SearchParameter + '%' OR AnyOther LIKE @SearchParameter + '%' );";
                            cmd.Parameters.AddWithValue("@SearchParameter", SearchTxt.Text.Trim());
                        }
                        else
                        {
                            sql = "SELECT * FROM Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "';";
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
                catch (Exception ex)
                {
                    StatusLabel.Text = "Error: " + ex;
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridviewData();
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
    }
}