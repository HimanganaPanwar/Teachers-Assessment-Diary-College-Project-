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
    public partial class Publication_SCP_Table : System.Web.UI.Page
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
                }
            }
            catch(NullReferenceException ex)
            {
                Response.Redirect("~/HOMEPAGE.aspx");
            }
        }
        protected void Insert_Btn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conCheckRecord = new SqlConnection(strCon))
            {
                string checkRecord = "select count(*) from Publication_SCP_COLLEGEPROJECT_FILE_UPLOAD where OrganisationBody = '" + OrganisingBody_Text.Text + "' AND ProceedingsName = '" + ProceedingsName_Text.Text + "' AND PublicationYear = '" + PublicationYear_Text.Text + "' AND Teacher_ID = '" + IDLabel.Text + "' AND ISSN_ISBN_No = '" + issn_isbn_noText.Text + "' AND ChapterNo = '" + ChapterNo_Text.Text + "' AND ChapterNo_Name = '" + Chapter_Name_Text.Text + "' AND ChapterNo_PageNo = '" + PageNo_Text.Text + "';";
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
                                    cmd.CommandText = "insert into Publication_SCP_COLLEGEPROJECT_FILE_UPLOAD(Teacher_ID, OrganisationBody, ProceedingsName, PublicationYear, ISSN_ISBN_No, ChapterNo, ChapterNo_Name, ChapterNo_PageNo, FileName, FileType, FileData, UploadedOn) values(@Teacher_ID, @OrganisationBody, @ProceedingsName, @PublicationYear, @ISSN_ISBN_No, @ChapterNo, @ChapterNo_Name, @ChapterNo_PageNo, @FileName, @FileType, @FileData, @UploadedOn)";

                                    cmd.Parameters.AddWithValue("@Teacher_ID", IDLabel.Text);
                                    cmd.Parameters.AddWithValue("@OrganisationBody", OrganisingBody_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@ProceedingsName", ProceedingsName_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@PublicationYear", PublicationYear_Text.Text);
                                    cmd.Parameters.AddWithValue("@ISSN_ISBN_No", issn_isbn_noText.Text);
                                    cmd.Parameters.AddWithValue("@ChapterNo", ChapterNo_Text.Text);
                                    cmd.Parameters.AddWithValue("@ChapterNo_Name", Chapter_Name_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@ChapterNo_PageNo", PageNo_Text.Text);
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
                    cmd.CommandText = "SELECT * FROM Publication_SCP_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  @Teacher_ID";
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
            OrganisingBody_Text.Text = "";
            ProceedingsName_Text.Text = "";
            PublicationYear_Text.Text = "";
            issn_isbn_noText.Text = "";
            ChapterNo_Text.Text = "";
            Chapter_Name_Text.Text = "";
            PageNo_Text.Text = "";
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
                LecturerDataAccessLayerPublication_SCP_COLLEGEPROJECT.DeleteRecord(Convert.ToInt32(e.CommandArgument));
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

                string OrganisationBody = ((TextBox)GridView1.Rows[rowIndex].FindControl("OrganisationBodyEditTxt")).Text;

                string ProceedingsName = ((TextBox)GridView1.Rows[rowIndex].FindControl("ProceedingsNameEditTxt")).Text;

                int PublicationYear = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("PublicationYearEditTxt")).Text);

                int ISSN_ISBN_No = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("ISSN_ISBN_NoEditTxt")).Text);

                int ChapterNo = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("ChapterNoEditTxt")).Text);

                string ChapterNo_Name = ((TextBox)GridView1.Rows[rowIndex].FindControl("ChapterNo_NameEditTxt")).Text;

                int ChapterNo_PageNo = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("ChapterNo_PageNoEditTxt")).Text);

                string FileName = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditFileName")).Text;


                LecturerDataAccessLayerPublication_SCP_COLLEGEPROJECT.UpdateRecord(S_No, OrganisationBody, ProceedingsName, PublicationYear, ISSN_ISBN_No, ChapterNo, ChapterNo_Name, ChapterNo_PageNo, FileName);

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
                        cmd.CommandText = "select FileName, FileData from Publication_SCP_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";

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
                        sql = "SELECT * FROM Publication_SCP_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND( OrganisationBody LIKE @SearchParameter + '%' OR ProceedingsName LIKE @SearchParameter + '%' OR PublicationYear LIKE @SearchParameter + '%' OR ISSN_ISBN_No LIKE @SearchParameter + '%' OR ChapterNo LIKE @SearchParameter + '%' OR ChapterNo_Name LIKE @SearchParameter + '%' OR ChapterNo_PageNo LIKE @SearchParameter + '%' );";
                        cmd.Parameters.AddWithValue("@SearchParameter", SearchTxt.Text.Trim());
                    }
                    else
                    {
                        sql = "SELECT * FROM Publication_SCP_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "';";
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

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridviewData();
        }
    }
}