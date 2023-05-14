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
    public partial class Leave_Record_Table : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                TeacherIDFirstInsertTxt.Text = Session["Teacher_ID"].ToString();

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
        protected void FirstInsertButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conCheckRecord = new SqlConnection(strCon))
            {
                string checkRecord = "select count(*) from Leave_Record_COLLEGEPROJECT_FILE_UPLOAD where Year = '" + YearFirstInsertTxt.Text + "' AND Teacher_ID = '" + TeacherIDFirstInsertTxt.Text + "';";
                SqlCommand checkRecordCmd = new SqlCommand(checkRecord, conCheckRecord);
                conCheckRecord.Open();
                int temp = Convert.ToInt32(checkRecordCmd.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    StatusDisplayLabel.Text = "RECORD ALREADY EXISTS!";
                    StatusDisplayLabel.ForeColor = System.Drawing.Color.Red;
                    ClearControls();
                }
                else
                {
                    using (SqlConnection con = new SqlConnection(strCon))
                    {
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.CommandText = "insert into Leave_Record_COLLEGEPROJECT_FILE_UPLOAD(Teacher_ID, Year, Casual_Leave, Extraordinary_Leave, Academic_Leave, Duty_Leave) values(@Teacher_ID, @Year, @Casual_Leave, @Extraordinary_Leave, @Academic_Leave, @Duty_Leave)";
                            cmd.Parameters.AddWithValue("@Teacher_ID", TeacherIDFirstInsertTxt.Text);
                            cmd.Parameters.AddWithValue("@Year", YearFirstInsertTxt.Text);
                            cmd.Parameters.AddWithValue("@Casual_Leave", Casual_LeaveFirstInsertTxt.Text.ToUpper());
                            cmd.Parameters.AddWithValue("@Extraordinary_Leave", Extraordinary_LeaveFirstInsertTxt.Text.ToUpper());
                            cmd.Parameters.AddWithValue("@Academic_Leave", Academic_LeaveFirstInsertTxt.Text.ToUpper());
                            cmd.Parameters.AddWithValue("@Duty_Leave", Duty_LeaveFirstInsertTxt.Text.ToUpper());
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            BindGridviewData();
                            StatusDisplayLabel.Text = "RECORD INSERTED !";
                            StatusDisplayLabel.ForeColor = System.Drawing.Color.Green;
                            ClearControls();
                        }
                    }
                }
            }
        }
        private void BindGridviewData()
        {
            int Teacher_ID = Convert.ToInt32(Session["Teacher_ID"]);

            GridView1.DataSource = LecturerDataAccessLayerLeaveRecTbl.GetAllDetailsOfTheLecturers(Teacher_ID);

            GridView1.DataBind();
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
                LecturerDataAccessLayerLeaveRecTbl.DeleteRecord(Convert.ToInt32(e.CommandArgument));
                BindGridviewData();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                GridView1.EditIndex = -1;
                BindGridviewData();
            }
            else if (e.CommandName == "UpdateRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;

                int S_No = Convert.ToInt32(e.CommandArgument);

                int Year = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("YearUpdateTxt")).Text);

                int Casual_Leave = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("Casual_LeaveUpdateTxt")).Text);

                int Extraordinary_Leave = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("Extraordinary_LeaveUpdateTxt")).Text);

                int Academic_Leave = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("Academic_LeaveUpdateTxt")).Text);

                int Duty_Leave = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("Duty_LeaveUpdateTxt")).Text);

                LecturerDataAccessLayerLeaveRecTbl.UpdateRecord(S_No, Year, Casual_Leave, Extraordinary_Leave, Academic_Leave, Duty_Leave);

                GridView1.EditIndex = -1;
                BindGridviewData();
            }
        }
        protected void ClearControls()
        {
            YearFirstInsertTxt.Text = "";

            Casual_LeaveFirstInsertTxt.Text = "";

            Extraordinary_LeaveFirstInsertTxt.Text = "";

            Academic_LeaveFirstInsertTxt.Text = "";

            Duty_LeaveFirstInsertTxt.Text = "";
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
                        sql = "SELECT * FROM Leave_Record_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + TeacherIDFirstInsertTxt.Text + "' AND( Year LIKE @SearchParameter + '%' OR Casual_Leave LIKE @SearchParameter + '%' OR Extraordinary_Leave LIKE @SearchParameter + '%' OR Academic_Leave LIKE @SearchParameter + '%' OR Duty_Leave LIKE @SearchParameter + '%' );";
                        cmd.Parameters.AddWithValue("@SearchParameter", SearchTxt.Text.Trim());
                    }
                    else
                    {
                        sql = "SELECT * FROM Leave_Record_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + TeacherIDFirstInsertTxt.Text + "';";
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

        protected void GridView1_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridviewData();
        }

        protected void ResetButton_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
    }
}