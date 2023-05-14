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
    public partial class Co_Curricular_Activities : System.Web.UI.Page
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
                string checkRecord = "select count(*) from Co_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD where Year = '" + Year_Text.Text + "' AND Activity_Name = '" + Activity_Name_Text.Text + "' AND Teacher_ID = '" + IDLabel.Text + "' AND Convener_Member = '" + Convener_Member_Text.Text + "' AND Contribution = '" + Contribution_Text.Text + "' AND Helped = '" + Helped_Text.Text + "';";
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
                            cmd.CommandText = "insert into Co_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD(Teacher_ID, Year, Activity_Name, Convener_Member, Contribution, Helped, UploadedOn) values(@Teacher_ID, @Year, @Activity_Name, @Convener_Member, @Contribution, @Helped, @UploadedOn)";

                            cmd.Parameters.AddWithValue("@Teacher_ID", IDLabel.Text);
                            cmd.Parameters.AddWithValue("@Year", Year_Text.Text);
                            cmd.Parameters.AddWithValue("@Activity_Name", Activity_Name_Text.Text.ToUpper());
                            cmd.Parameters.AddWithValue("@Convener_Member", Convener_Member_Text.Text.ToUpper());
                            cmd.Parameters.AddWithValue("@Contribution", Contribution_Text.Text.ToUpper());
                            cmd.Parameters.AddWithValue("@Helped", Helped_Text.Text.ToUpper());
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

            GridView1.DataSource = LecturerDataAccessLayerCo_Curricular_Activities.GetAllDetailsOfTheLecturers(Teacher_ID);
            GridView1.DataBind();
        }
        protected void ClearControls()
        {
            Year_Text.Text = "";
            Activity_Name_Text.Text = "";
            Convener_Member_Text.Text = "";
            Contribution_Text.Text = "";
            Helped_Text.Text = "";
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
                LecturerDataAccessLayerCo_Curricular_Activities.DeleteRecord(Convert.ToInt32(e.CommandArgument));
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

                string Activity_Name = ((TextBox)GridView1.Rows[rowIndex].FindControl("Activity_NameEditTxt")).Text;

                string Convener_Member = ((TextBox)GridView1.Rows[rowIndex].FindControl("Convener_MemberEditTxt")).Text;

                string Contribution = ((TextBox)GridView1.Rows[rowIndex].FindControl("ContributionEditTxt")).Text;

                string Helped = ((TextBox)GridView1.Rows[rowIndex].FindControl("HelpedEditTxt")).Text;

                LecturerDataAccessLayerCo_Curricular_Activities.UpdateRecord(S_No, Year, Activity_Name, Convener_Member, Contribution, Helped);

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
                        sql = "SELECT * FROM Co_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "' AND( Year LIKE @SearchParameter + '%' OR Activity_Name LIKE @SearchParameter + '%' OR Convener_Member LIKE @SearchParameter + '%' OR Contribution LIKE @SearchParameter + '%' OR Helped LIKE @SearchParameter + '%' );";
                        cmd.Parameters.AddWithValue("@SearchParameter", SearchTxt.Text.Trim());
                    }
                    else
                    {
                        sql = "SELECT * FROM Co_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID = '" + IDLabel.Text + "';";
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