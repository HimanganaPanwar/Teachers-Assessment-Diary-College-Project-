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
using System.Text;

namespace College_Project__FILE_UPLOAD_
{
    public partial class AdminUpdatePassword : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        string encrypt_Password, encrypt_CPassword;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                updateStatusLbl.Visible = false;
                try
                {
                    if (Session["AdminEmail"] != null && Session["AdminPassword"] != null)
                    {
                        LoggedAdminID.Text = Session["AdminEmail"].ToString();
                    }
                    else /*if (Request.QueryString["AdminEmail"] != null && Request.QueryString["AdminPassword"] != null)*/
                    {
                        LoggedAdminID.Text = Application["AdminEmail"].ToString();
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

        protected void encryptPassword()
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[newPasswordTxt.Text.ToString().Length];
            encode = Encoding.UTF8.GetBytes(newPasswordTxt.Text);
            strmsg = Convert.ToBase64String(encode);
            encrypt_Password = strmsg;

            string strmsg2 = string.Empty;
            byte[] encode_cpassword = new byte[confirmPasswordTxt.Text.ToString().Length];
            encode_cpassword = Encoding.UTF8.GetBytes(confirmPasswordTxt.Text);
            strmsg2 = Convert.ToBase64String(encode_cpassword);
            encrypt_CPassword = strmsg;
        }

        protected void updatePasswordBtn_Click(object sender, EventArgs e)
        {
            encryptPassword();
            if (!String.IsNullOrEmpty(newPasswordTxt.Text.Trim()) && !String.IsNullOrEmpty(confirmPasswordTxt.Text.Trim()))
            {
                using (SqlConnection con = new SqlConnection(strCon))
                {
                    con.Open();

                    String query = "SELECT * from LoginTable_COLLEGEPROJECT_FILE_UPLOAD where Registered_As = 'ADMIN' and Email = @AdminID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@AdminID", LoggedAdminID.Text);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        //if (Old_Password_Txt.Text == New_Password_Txt.Text)
                        //{
                        //    StatusLabel.Text = "Password entered is same as old password. Enter new one";
                        //    StatusLabel.ForeColor = System.Drawing.Color.Red;
                        //}
                        //else
                        //{
                        using (SqlConnection sqlCon = new SqlConnection(strCon))
                        {
                            using (SqlCommand sqlCmd = new SqlCommand("UpdateAdminPassword_COLLEGEPROJECT_FILE_UPLOAD", sqlCon))
                            {
                                sqlCmd.CommandType = CommandType.StoredProcedure;

                                sqlCmd.Parameters.AddWithValue("@Password", encrypt_Password);
                                sqlCmd.Parameters.AddWithValue("@Confirm_Password", encrypt_CPassword);
                                sqlCmd.Parameters.AddWithValue("@Email", selectAdminDDL.SelectedItem.Value);
                                string registered_As = "ADMIN";
                                sqlCmd.Parameters.AddWithValue("@Registered_As", registered_As);

                                sqlCon.Open();
                                int a = sqlCmd.ExecuteNonQuery();

                                if (a > 0)
                                {
                                    updateStatusLbl.Visible = true;
                                    updateStatusLbl.Text = "PASSWORD UPDATED!";
                                    updateStatusLbl.ForeColor = System.Drawing.Color.Green;
                                }
                                else
                                {
                                    updateStatusLbl.Visible = true;
                                    updateStatusLbl.Text = "Password was not Updated!";
                                    updateStatusLbl.ForeColor = System.Drawing.Color.Red;
                                }
                                sqlCon.Close();
                                ClearControls();
                            }
                        }
                        //}
                    }
                    con.Close();
                }
            }
        }
        protected void ClearControls()
        {
            newPasswordTxt.Text = "";
            confirmPasswordTxt.Text = "";
            selectAdminDDL.SelectedIndex = 0;
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
        protected void BackBtn_Click(object sender, EventArgs e)
        {
            removeStateData();
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            clearControls();
        }

        protected void clearControls()
        {
            selectAdminDDL.SelectedIndex = 0;
            newPasswordTxt.Text = "";
            confirmPasswordTxt.Text = "";
        }
    }
}