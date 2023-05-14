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
    public partial class Career_Advancement_Qualification_Table : System.Web.UI.Page
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
                string value = "";
                if (OrientationType.Checked)
                    value = "Orientation";
                else if (ReferenceType.Checked)
                    value = "Reference";
                else if (SchoolType.Checked)
                    value = "Summer/Winter School";

                string checkRecord = "select count(*) from Career_Advancement_Qualification_COLLEGEPROJECT_FILE_UPLOAD where Year = '" + Year_Text.Text + "' AND Document_Type = '" + value + "' AND Teacher_ID = '" + IDLabel.Text + "';";
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
                                    cmd.CommandText = "insert into Career_Advancement_Qualification_COLLEGEPROJECT_FILE_UPLOAD(Teacher_ID, Year, Document_Type, Place, Duration, Sponsering_Agency, FileName, FileType, FileData, UploadedOn) values(@Teacher_ID, @Year, @Document_Type, @Place, @Duration, @Sponsering_Agency, @FileName, @FileType, @FileData, @UploadedOn)";

                                    cmd.Parameters.AddWithValue("@Teacher_ID", IDLabel.Text);
                                    cmd.Parameters.AddWithValue("@Year", Year_Text.Text);
                                    cmd.Parameters.AddWithValue("@Document_Type", value);
                                    cmd.Parameters.AddWithValue("@Place", Place_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Duration", Duration_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Sponsering_Agency", Agency_Text.Text.ToUpper());

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
                    cmd.CommandText = "SELECT * FROM Career_Advancement_Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  @Teacher_ID";
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

            if (OrientationType.Checked == true)
            {
                OrientationType.Checked = true;
            }
            else if (ReferenceType.Checked == true)
            {
                ReferenceType.Checked = false;
                OrientationType.Checked = true;
            }
            else if (SchoolType.Checked == true)
            {
                SchoolType.Checked = false;
                OrientationType.Checked = true;
            }

            Place_Text.Text = "";
            Duration_Text.Text = "";
            Agency_Text.Text = "";
        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                GridView1.EditIndex = rowIndex;
                BindGridviewData();
            }
            else if (e.CommandName == "DeleteRow")
            {
                LecturerDataAccessLayerCareerAdvTble.DeleteRecord(Convert.ToInt32(e.CommandArgument));
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

                int S_No = Convert.ToInt32(e.CommandArgument);

                int Year = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("EditYear")).Text);

                string Document_Type = ((DropDownList)GridView1.Rows[rowIndex].FindControl("EditDocument_Type")).SelectedValue;

                string Place = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditPlace")).Text.ToUpper();

                string Duration = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditDuration")).Text.ToUpper();

                string Sponsering_Agency = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditSponsering_Agency")).Text.ToUpper();

                string FileName = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditFileName")).Text;

                LecturerDataAccessLayerCareerAdvTble.UpdateRecord(S_No, Year, Document_Type, Place, Duration, Sponsering_Agency, FileName);

                GridView1.EditIndex = -1;
                BindGridviewData();
                StatusLabel.Text = "ROW UPDATED!";
                StatusLabel.ForeColor = System.Drawing.Color.Green;
            }
            else if (e.CommandName == "DownloadDoc")
            {                
                using (SqlConnection con = new SqlConnection(strCon))
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

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql;

                    if (!string.IsNullOrEmpty(SearchTxt.Text.Trim()))
                    {
                        sql = "SELECT * FROM Career_Advancement_Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND( Year LIKE @SearchParameter + '%' OR Document_Type LIKE @SearchParameter + '%' OR Place LIKE @SearchParameter + '%' OR Duration LIKE @SearchParameter + '%' OR Sponsering_Agency LIKE @SearchParameter + '%' );";
                        cmd.Parameters.AddWithValue("@SearchParameter", SearchTxt.Text.Trim());
                    }
                    else
                    {
                        sql = "SELECT * FROM Career_Advancement_Qualification_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "';";
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
    }
}