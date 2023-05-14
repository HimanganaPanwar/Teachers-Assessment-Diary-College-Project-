using System;
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
    public partial class Resources_Table_2 : System.Web.UI.Page
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
                string checkRecord = "select count(*) from Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD where Year = '" + Year_Text.Text + "' AND Nature = '" + Nature_Text.Text + "' AND Teacher_ID = '" + IDLabel.Text + "' AND Title = '" + Title_Text.Text + "' AND ScholarName = '" + ScholarName_Text.Text + "' AND Complete = '" + Complete_Text.Text + "' AND Continuing = '" + Continuing_Text.Text + "' AND Extra_Col1 = '" + Extra_Col1_Text.Text + "' AND Extra_Col2 = '" + Extra_Col2_Text.Text + "';";
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
                                    cmd.CommandText = "insert into Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD(Teacher_ID, Year, Nature, Title, ScholarName, Complete, Continuing, Extra_Col1, Extra_Col2, FileName, FileType, FileData, UploadedOn) values(@Teacher_ID, @Year, @Nature, @Title, @ScholarName, @Complete, @Continuing, @Extra_Col1, @Extra_Col2, @FileName, @FileType, @FileData, @UploadedOn)";

                                    cmd.Parameters.AddWithValue("@Teacher_ID", IDLabel.Text);
                                    cmd.Parameters.AddWithValue("@Year", Year_Text.Text);
                                    cmd.Parameters.AddWithValue("@Nature", Nature_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Title", Title_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@ScholarName", ScholarName_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Complete", Complete_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Continuing", Continuing_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Extra_Col1", Extra_Col1_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Extra_Col2", Extra_Col2_Text.Text.ToUpper());
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
                        cmd.CommandText = "SELECT * FROM Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  @Teacher_ID";
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
            Year_Text.Text = "";
            Nature_Text.Text = "";
            Title_Text.Text = "";
            ScholarName_Text.Text = "";
            Complete_Text.Text = "";
            Continuing_Text.Text = "";
            Extra_Col1_Text.Text = "";
            Extra_Col2_Text.Text = "";
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
                LecturerDataAccessLayerResources_Table_2.DeleteRecord(Convert.ToInt32(e.CommandArgument));
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

                string Nature = ((TextBox)GridView1.Rows[rowIndex].FindControl("NatureEditTxt")).Text;

                string Title = ((TextBox)GridView1.Rows[rowIndex].FindControl("TitleEditTxt")).Text;

                string ScholarName = ((TextBox)GridView1.Rows[rowIndex].FindControl("ScholarNameEditTxt")).Text;

                string Complete = ((TextBox)GridView1.Rows[rowIndex].FindControl("CompleteEditTxt")).Text;

                string Continuing = ((TextBox)GridView1.Rows[rowIndex].FindControl("ContinuingEditTxt")).Text;

                string Extra_Col1 = ((TextBox)GridView1.Rows[rowIndex].FindControl("Extra_Col1EditTxt")).Text;

                string Extra_Col2 = ((TextBox)GridView1.Rows[rowIndex].FindControl("Extra_Col2EditTxt")).Text;

                string FileName = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditFileName")).Text;

                LecturerDataAccessLayerResources_Table_2.UpdateRecord(S_No, Year, Nature, Title, ScholarName, Complete, Continuing, Extra_Col1, Extra_Col2, FileName);

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
                        cmd.CommandText = "select FileName, FileData from Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";

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

        protected void ResetBtn_Click(object sender, EventArgs e)
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
                        sql = "SELECT * FROM Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND( Year LIKE @SearchParameter + '%' OR Nature LIKE @SearchParameter + '%' OR Title LIKE @SearchParameter + '%' OR ScholarName LIKE @SearchParameter + '%' OR Complete LIKE @SearchParameter + '%' OR Continuing LIKE @SearchParameter + '%' OR Extra_Col1 LIKE @SearchParameter + '%' OR Extra_Col2 LIKE @SearchParameter + '%' OR FileName LIKE @SearchParameter + '%' );";
                        cmd.Parameters.AddWithValue("@SearchParameter", SearchTxt.Text.Trim());
                    }
                    else
                    {
                        sql = "SELECT * FROM Resources_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "';";
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridviewData();
        }
    }
}