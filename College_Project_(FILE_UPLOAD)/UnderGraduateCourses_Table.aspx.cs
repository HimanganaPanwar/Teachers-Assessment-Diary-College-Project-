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
    public partial class UnderGraduateCourses_Table : System.Web.UI.Page
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
                string checkRecord = "select count(*) from UnderGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD where Year = '" + Year_Text.Text + "' AND Class = '" + ClassTxt.Text + "'AND Paper = '" + PaperTxt.Text + "' AND Teacher_ID = '" + IDLabel.Text + "' AND Nomenclature = '" + Nomenclature_Text.Text + "' AND PeriodsPerWeek = '" + PeriodsPerWeek_Text.Text + "' AND Lecture_Method = '" + Lecture_Method_Text.Text + "' AND Seminar_Presentation_Method = '" + Seminar_Presentation_Method_Text.Text + "';";
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
                    using (SqlConnection con = new SqlConnection(strCon))
                    {
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.CommandText = "insert into UnderGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD(Teacher_ID, Year, Class, Paper, Nomenclature, PeriodsPerWeek, Lecture_Method, Seminar_Presentation_Method, UploadedOn) values(@Teacher_ID, @Year, @Class, @Paper, @Nomenclature, @PeriodsPerWeek, @Lecture_Method, @Seminar_Presentation_Method, @UploadedOn)";

                            cmd.Parameters.AddWithValue("@Teacher_ID", IDLabel.Text);
                            cmd.Parameters.AddWithValue("@Year", Year_Text.Text);
                            cmd.Parameters.AddWithValue("@Class", ClassTxt.Text);
                            cmd.Parameters.AddWithValue("@Paper", PaperTxt.Text);
                            cmd.Parameters.AddWithValue("@Nomenclature", Nomenclature_Text.Text.ToUpper());
                            cmd.Parameters.AddWithValue("@PeriodsPerWeek", PeriodsPerWeek_Text.Text);
                            cmd.Parameters.AddWithValue("@Lecture_Method", Lecture_Method_Text.Text.ToUpper());
                            cmd.Parameters.AddWithValue("@Seminar_Presentation_Method", Seminar_Presentation_Method_Text.Text.ToUpper());
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
            }
        }
        private void BindGridviewData()
        {
            int Teacher_ID = Convert.ToInt32(Session["Teacher_ID"]);

            GridView1.DataSource = LecturerDataAccessLayerUnderGraduateCourses.GetAllDetailsOfTheLecturers(Teacher_ID);
            GridView1.DataBind();
        }
        protected void ClearControls()
        {
            Year_Text.Text = "";
            ClassTxt.Text = "";
            PaperTxt.Text = "";
            Nomenclature_Text.Text = "";
            PeriodsPerWeek_Text.Text = "";
            Lecture_Method_Text.Text = "";
            Seminar_Presentation_Method_Text.Text = "";
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                GridView1.EditIndex = rowIndex;
                BindGridviewData();
            }
            else if (e.CommandName == "DeleteRow")
            {
                LecturerDataAccessLayerUnderGraduateCourses.DeleteRecord(Convert.ToInt32(e.CommandArgument));
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

                int Year = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("YearEditTxt")).Text);

                string Class = ((TextBox)GridView1.Rows[rowIndex].FindControl("ClassEditTxt")).Text;

                string Paper = ((TextBox)GridView1.Rows[rowIndex].FindControl("PaperEditTxt")).Text;

                string Nomenclature = ((TextBox)GridView1.Rows[rowIndex].FindControl("NomenclatureEditTxt")).Text;

                int PeriodsPerWeek = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("PeriodsPerWeekEditTxt")).Text);

                string Lecture_Method = ((TextBox)GridView1.Rows[rowIndex].FindControl("Lecture_MethodEditTxt")).Text;

                string Seminar_Presentation_Method = ((TextBox)GridView1.Rows[rowIndex].FindControl("Seminar_Presentation_MethodEditTxt")).Text;

                LecturerDataAccessLayerUnderGraduateCourses.UpdateRecord(S_No, Year, Class, Paper, Nomenclature, PeriodsPerWeek, Lecture_Method, Seminar_Presentation_Method);

                GridView1.EditIndex = -1;
                BindGridviewData();
                StatusLabel.Text = "ROW UPDATED!";
                StatusLabel.ForeColor = System.Drawing.Color.Green;
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
                        sql = "SELECT * FROM UnderGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND( Year LIKE @SearchParameter + '%' OR Class LIKE @SearchParameter + '%' OR Paper LIKE @SearchParameter + '%' OR Nomenclature LIKE @SearchParameter + '%' OR PeriodsPerWeek LIKE @SearchParameter + '%' OR Lecture_Method LIKE @SearchParameter + '%' OR Seminar_Presentation_Method LIKE @SearchParameter + '%' );";
                        cmd.Parameters.AddWithValue("@SearchParameter", SearchTxt.Text.Trim());
                    }
                    else
                    {
                        sql = "SELECT * FROM UnderGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "';";
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

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
    }
}