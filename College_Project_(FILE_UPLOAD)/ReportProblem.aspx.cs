using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace College_Project__FILE_UPLOAD_
{
    public partial class ReportProblem : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    DateCalendar.Visible = false;
                    ImageStatusLbl.Visible = false;
                    UploadStatusLbl.Visible = false;
                }

                try
                {
                    using (SqlConnection con = new SqlConnection(strCon))
                    {
                        if (Session["Teacher_ID"] != null)
                        {
                            TeacherIDLbl.Text = Session["Teacher_ID"].ToString();
                            BindGridviewData();
                        }
                        else
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
            catch (NullReferenceException ne)
            {
                Response.Redirect("~/HOMEPAGE.aspx");
            }
            catch (Exception exp)
            {
                Response.Redirect("HOMEPAGE.aspx");
            }
        }

        protected void DateImageBtn_Click(object sender, ImageClickEventArgs e)
        {
            if (DateCalendar.Visible)
            {
                DateCalendar.Visible = false;
            }
            else
            {
                DateCalendar.Visible = true;
            }
        }
        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conCheckRecord = new SqlConnection(strCon))
            {
                HttpPostedFile postedFile = AttachPhoto.PostedFile;
                string filename = Path.GetFileName(AttachPhoto.PostedFile.FileName);
                string filetype = Path.GetExtension(AttachPhoto.PostedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                int fileSize = postedFile.ContentLength;

                Stream str = AttachPhoto.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(str);
                Byte[] size = br.ReadBytes((int)str.Length);

                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                using (SqlConnection con = new SqlConnection(strCon))
                {
                    string query = "INSERT INTO Problems(Teacher_ID, Report_Date, Title, Description, AttachImageData, Status)values(@Teacher_ID, @Report_Date, @Title, @Desc, @AttachImageData, @Status);";
                    SqlCommand cmd = new SqlCommand(query, con);

                    string link = string.Empty;
                    if (AttachPhoto.HasFile)
                    {
                        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".jpeg")
                        {
                            AttachPhoto.SaveAs(Server.MapPath("~/ProblemImages/") + Path.GetFileName(AttachPhoto.FileName));
                            link = "~/ProblemImages/" + Path.GetFileName(AttachPhoto.FileName);
                        }
                        else
                        {
                            ImageStatusLbl.Visible = true;
                            ImageStatusLbl.ForeColor = System.Drawing.Color.Red;
                            ImageStatusLbl.Text = "Only Images(.jpg, jpeg, .bmp and .png) can be uploaded";
                        }
                    }
                    cmd.Parameters.AddWithValue("@Teacher_ID", Convert.ToInt32(TeacherIDLbl.Text));
                    cmd.Parameters.AddWithValue("@Report_Date", DateTxt.Text);
                    cmd.Parameters.AddWithValue("@Title", TitleTxt.Text);
                    cmd.Parameters.AddWithValue("@Desc", DescTxt.Text);
                    //cmd.Parameters.AddWithValue("@ImageName", filename);
                    //cmd.Parameters.AddWithValue("@ImageType", filetype);
                    cmd.Parameters.AddWithValue("@AttachImageData", link);
                    //cmd.Parameters.AddWithValue("@ImageSize", fileSize);
                    //cmd.Parameters.AddWithValue("@AttachImageData", link);

                    string status = "Pending";
                    cmd.Parameters.AddWithValue("@Status", status);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    ClearControls();

                    UploadStatusLbl.Visible = true;
                    UploadStatusLbl.ForeColor = System.Drawing.Color.Green;
                    UploadStatusLbl.Text = "Problem was reported successfully!!!";

                    BindGridviewData();

                }
            }
        }

        protected void ClearControls()
        {
            DateTxt.Text = "";
            TitleTxt.Text = "";
            DescTxt.Text = "";
            AttachPhoto.Dispose();
        }

        protected void DateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            DateTxt.Text = DateCalendar.SelectedDate.ToLongDateString();
            DateCalendar.Visible = false;
        }

        protected void DateCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void BackBtn_Click(object sender, EventArgs e)
        {
            if (Session["Row"] != null || Request.QueryString["ID"] != null)
            {
                string Teacher_ID = Request.QueryString["ID"].ToString();
                Session["ID"] = Teacher_ID;
                string AdminEmail = Session["AdminEmail"].ToString();
                Session["AdminEmail"] = AdminEmail;
                Response.Redirect("~/INFORMATION(GENERAL_INFO).aspx?ID=" + Teacher_ID);
            }
            else if (Session["LecturerEmail"] != null)
            {
                Response.Redirect("~/INFORMATION(GENERAL_INFO).aspx");
            }
            else
            {
                Response.Redirect("~/HOMEPAGE.ASPX");
            }
        }
        private void AddDataToSession()
        {
            Session.Add("Teacher_ID", TeacherIDLbl.Text);
        }
        protected void ViewOlderErrorsBtn_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                AddDataToSession();
                Response.Redirect("~/ViewOlderErrorsReported.aspx?ID=" + TeacherIDLbl.Text);
            }
            else
            {
                AddDataToSession();
                Session["Lecturer_ID"] = TeacherIDLbl.Text;
                Response.Redirect("~/ViewOlderErrorsReported.aspx");
            }
        }

        protected void BindGridviewData()
        {
            string sql = "SELECT * FROM Problems WHERE Status=@Status and Teacher_ID = @ID";
            using (SqlConnection con = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand(sql))
                {
                    string status = "Pending";
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@ID", TeacherIDLbl.Text);
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

        protected void ViewImage_Click(object sender, EventArgs e)
        {
            LinkButton downloadLink = sender as LinkButton;
            GridViewRow gridRow = downloadLink.NamingContainer as GridViewRow;
            string downloadImage = GridView1.DataKeys[gridRow.RowIndex].Value.ToString();
            Response.AddHeader("Content-Disposition", "attachment; filename=\"" + downloadImage + "\"");
            Response.TransmitFile(Server.MapPath(downloadImage));
            Response.End();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell cell = e.Row.Cells[6];
                string ACStatus = cell.Text;
                if (ACStatus == "Pending")
                {
                    cell.BackColor = Color.Red;
                }
                else if (ACStatus == "Solved")
                {
                    cell.BackColor = Color.LightGreen;
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
        }

        protected void StatusRadioBtn_SelectedIndexChanged(object sender, EventArgs e)
        {
            string status = StatusRadioBtn.SelectedItem.Value;
            string sql = "SELECT * FROM Problems WHERE Status=@Status and Teacher_ID = @ID";
            using (SqlConnection con = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand(sql))
                {
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@ID", TeacherIDLbl.Text);
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