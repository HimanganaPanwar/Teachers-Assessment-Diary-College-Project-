using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;
using System.Collections;
using System.Reflection;

namespace College_Project__FILE_UPLOAD_
{
    public partial class TEACHERS_PROFILES : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBCS"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminEmail"] != null && Session["AdminPassword"] != null)
            {
                if (!IsPostBack)
                {
                    ApplicationSessionData();
                    BindGridView("");
                }
            }
            else
            {
                Response.Redirect("~/HOMEPAGE.aspx");
            }
        }
        protected void ApplicationSessionData()
        {
            string adminEmail = Session["AdminEmail"].ToString();
            string adminPassword = Session["AdminPassword"].ToString();
            Session["AdminEmail"] = adminEmail;
            Session["AdminPassword"] = adminPassword;
            Application["AdminEmail"] = adminEmail;
            Application["AdminPassword"] = adminPassword;
        }
        protected void removeApplicationData()
        {
            Application.Remove("AdminEmail");
            Application.Remove("AdminPassword");
            Application.RemoveAll();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridView(txtSearch.Text);
        }
        private void BindGridView(string searchVal)
        {
            using (SqlCommand cmdCheck = new SqlCommand())
            {
                try
                {
                    DataTable objdt = new DataTable();
                    string query = searchVal == "" ? "select * from RegistrationTable_COLLEGEPROJECT_FILE_UPLOAD where Registered_As = 'LECTURER' and AccountStatus = 'Enabled' ORDER BY First_Name ASC;" : "select * from RegistrationTable_COLLEGEPROJECT_FILE_UPLOAD where First_Name like '%" + searchVal + "%' AND Registered_As = 'LECTURER' AND AccountStatus = 'Enabled' ORDER BY First_Name ASC;";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    con.Open();
                    da.Fill(objdt);
                    con.Close();
                    if (objdt.Rows.Count > 0)
                    {
                        GridView1.DataSource = objdt;
                        GridView1.DataBind();
                    }
                }
                catch
                {
                    con.Close();
                }
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                Response.Redirect("~/INFORMATION(GENERAL_INFO).aspx?ID=" + row.Cells[0].Text);
            }
        }

        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            removeApplicationData();
            ClearSession();
        }
        public void ClearSession()
        {
            var nvc = HttpUtility.ParseQueryString(Request.Url.Query);
            nvc.Remove("ID");
            string url = Request.Url.AbsolutePath + "?" + nvc.ToString();

            Session.Remove("AdminEmail");
            Session.Remove("AdminPassword");
            Session.Remove("LecturerEmail");
            Session.Remove("LecturerPassword");

            Response.Redirect("~/HOMEPAGE.ASPX");
        }

        protected void ViewErrorsBtn_Click(object sender, EventArgs e)
        {
            ApplicationSessionData();
            Response.Redirect("~/ViewProblems.aspx");
        }

        protected void UpdatePasswordBtn_Click(object sender, EventArgs e)
        {
            ApplicationSessionData();
            Response.Redirect("~/AdminUpdatePassword.aspx");
        }

        protected void ViewDisabledAccounts_Click(object sender, EventArgs e)
        {
            ApplicationSessionData();
            Response.Redirect("~/DisabledAccounts.aspx");
        }
    }
}