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
    public partial class Books_Monographs_Table : System.Web.UI.Page
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
                string checkRecord = "select count(*) from Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD where Title = '" + Title_Text.Text + "' AND Sole_Author_Name = '" + Sole_Author_Name_Text.Text + "' AND Teacher_ID = '" + IDLabel.Text + "' AND Co_Author_Name = '" + Co_Author_Name_Text.Text + "' AND Publishing_House = '" + Publishing_House_Text.Text + "' AND Year = '" + Year_Text.Text + "' AND Reference_OR_Text = '" + Reference_OR_Text_Text.Text + "' AND ISSN_OR_ISBN_No = '" + ISSN_OR_ISBN_No_Text.Text + "';";
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
                                    cmd.CommandText = "INSERT INTO Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD(Teacher_ID, Title, Sole_Author_Name, Co_Author_Name, Publishing_House, Year, Reference_OR_Text, ISSN_OR_ISBN_No, FileName, FileType, FileData, UploadedOn) values(@Teacher_ID, @Title, @Sole_Author_Name, @Co_Author_Name, @Publishing_House, @Year, @Reference_OR_Text, @ISSN_OR_ISBN_No, @FileName, @FileType, @FileData, @UploadedOn)";

                                    cmd.Parameters.AddWithValue("@Teacher_ID", IDLabel.Text);
                                    cmd.Parameters.AddWithValue("@Title", Title_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Sole_Author_Name", Sole_Author_Name_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Co_Author_Name", Co_Author_Name_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Publishing_House", Publishing_House_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@Year", Year_Text.Text);
                                    cmd.Parameters.AddWithValue("@Reference_OR_Text", Reference_OR_Text_Text.Text.ToUpper());
                                    cmd.Parameters.AddWithValue("@ISSN_OR_ISBN_No", ISSN_OR_ISBN_No_Text.Text);
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
                    cmd.CommandText = "SELECT * FROM Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  @Teacher_ID";
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
            Title_Text.Text = "";
            Sole_Author_Name_Text.Text = "";
            Co_Author_Name_Text.Text = "";
            Publishing_House_Text.Text = "";
            Year_Text.Text = "";
            Reference_OR_Text_Text.Text = "";
            ISSN_OR_ISBN_No_Text.Text = "";
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
                LecturerDataAccessLayerBooks_Monographs.DeleteRecord(Convert.ToInt32(e.CommandArgument));
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

                string Title = ((TextBox)GridView1.Rows[rowIndex].FindControl("TitleEditTxt")).Text;

                string Sole_Author_Name = ((TextBox)GridView1.Rows[rowIndex].FindControl("Sole_Author_NameEditTxt")).Text;

                string Co_Author_Name = ((TextBox)GridView1.Rows[rowIndex].FindControl("Co_Author_NameEditTxt")).Text;

                string Publishing_House = ((TextBox)GridView1.Rows[rowIndex].FindControl("Publishing_HouseEditTxt")).Text;

                int Year = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("YearEditTxt")).Text);

                string Reference_OR_Text = ((TextBox)GridView1.Rows[rowIndex].FindControl("Reference_OR_TextEditTxt")).Text;

                int ISSN_OR_ISBN_No = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("ISSN_OR_ISBN_NoEditTxt")).Text);

                string FileName = ((TextBox)GridView1.Rows[rowIndex].FindControl("EditFileName")).Text;

                LecturerDataAccessLayerBooks_Monographs.UpdateRecord(S_No, Title, Sole_Author_Name, Co_Author_Name, Publishing_House, Year, Reference_OR_Text, ISSN_OR_ISBN_No, FileName);

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
                        cmd.CommandText = "select FileName, FileData from Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD where S_No=@S_No";

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
                        sql = "SELECT * FROM Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND( Title LIKE @SearchParameter + '%' OR Sole_Author_Name LIKE @SearchParameter + '%' OR Co_Author_Name LIKE @SearchParameter + '%' OR Publishing_House LIKE @SearchParameter + '%' OR Year LIKE @SearchParameter + '%'OR Reference_OR_Text LIKE @SearchParameter + '%' OR ISSN_OR_ISBN_No LIKE @SearchParameter + '%' );";
                        cmd.Parameters.AddWithValue("@SearchParameter", SearchTxt.Text.Trim());
                    }
                    else
                    {
                        sql = "SELECT * FROM Books_Monographs_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "';";
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