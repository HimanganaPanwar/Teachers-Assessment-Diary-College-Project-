using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace College_Project__FILE_UPLOAD_
{
    public partial class DisabledAccounts : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["DBCS"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                SearchStatusLbl.Visible = false;
                try
                {
                    if (Session["AdminEmail"] != null && Session["AdminPassword"] != null)
                    {
                        LoggedAdminLbl.Text = Session["AdminEmail"].ToString();
                    }
                    else
                    {
                        LoggedAdminLbl.Text = Application["AdminEmail"].ToString();
                    }
                }
                catch (NullReferenceException ex)
                {
                    Response.Redirect("~/HOMEPAGE.aspx");
                }
                catch (Exception exp)
                {
                    Response.Redirect("~/HOMEPAGE.aspx");
                }
            }
        }

        protected void removeStateData()
        {
            Application.Remove("AdminEmail");
            Application.Remove("AdminPassword");
            Application.RemoveAll();

            Session.RemoveAll();
            Session.Remove("AdminEmail");
            Session.Remove("AdminPassword");
        }

        protected void backBtn_Click(object sender, EventArgs e)
        {
            removeStateData();
        }

        protected void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT * FROM RegistrationTable_COLLEGEPROJECT_FILE_UPLOAD where AccountStatus = 'Disabled'";
                    if (!string.IsNullOrEmpty(SearchAccountTxt.Text.Trim()))
                    {
                        //sql = "select * from RegistrationTable_COLLEGEPROJECT_FILE_UPLOAD WHERE AccountStatus = 'Disabled' AND First_Name like '%" + SearchAccountTxt.Text + "%' AND Registered_As = 'LECTURER'";
                        sql += " AND First_Name like '%" + SearchAccountTxt.Text + "%' AND Registered_As = 'LECTURER'";
                        cmd.Parameters.AddWithValue("@FirstName", SearchAccountTxt.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            SearchStatusLbl.Visible = false;
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                        else
                        {
                            SearchStatusLbl.Visible = true;
                            SearchStatusLbl.Text = "No data was found!";
                            SearchStatusLbl.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGridView();
        }

        protected void SearchAccountBtn_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EnableAccount")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                string email = row.Cells[3].Text;

                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Yes")
                {
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        SqlCommand cmd = new SqlCommand("SP_EnableAccount", con);
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@AccountStatus", "Enabled");

                        con.Open();
                        cmd.ExecuteNonQuery();

                        con.Close();
                        ScriptManager.RegisterStartupScript(this, GetType(), "wasDisabled", "wasDisabled();", true);

                        BindGridView();
                    }
                }
                else
                {
                    //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Account was not deleted!')", true);
                    //Response.Write("<script>alert('Open Message!');</script>");
                    MaintainScrollPositionOnPostBack = true;
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage();", true);
                }
            }
        }
    }
}