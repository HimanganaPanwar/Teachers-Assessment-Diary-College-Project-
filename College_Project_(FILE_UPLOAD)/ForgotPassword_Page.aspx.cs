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
using System.Text;

namespace College_Project__FILE_UPLOAD_
{
    public partial class ForgotPassword_Page : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        string encrypt_Password, encrypt_CPassword;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StatusLabel.Visible = false;
                UpadteStatusLabel.Visible = false;
                PasswordLabel.Visible = false;
                ConfirmPasswordLabel.Visible = false;
                PasswordTxt.Visible = false;

                ConfirmPasswordTxt.Visible = false;
                ResetPasswordBtn.Visible = false;
            }
        }
        protected void ClearControls()
        {
            if (!string.IsNullOrEmpty(EmailTxt.Text.Trim()) && !string.IsNullOrEmpty(PhoneNoTxt.Text.Trim()) && !string.IsNullOrEmpty(PasswordTxt.Text.Trim()) && !string.IsNullOrEmpty(ConfirmPasswordTxt.Text.Trim()))
            {
                EmailTxt.Text = "";
                PhoneNoTxt.Text = "";
                PasswordTxt.Text = "";
                ConfirmPasswordTxt.Text = "";
                StatusLabel.Visible = false;
            }
            else
            {
                EmailTxt.Text = "";
                PhoneNoTxt.Text = "";
                StatusLabel.Visible = false;
            }
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();
                if (!string.IsNullOrEmpty(EmailTxt.Text.Trim()) && !string.IsNullOrEmpty(PhoneNoTxt.Text.Trim()))
                {
                    String sqlQuery = "select * from RegistrationTable_COLLEGEPROJECT_FILE_UPLOAD where Email = @Email and PhoneNo = @PhoneNo and AccountStatus = 'Enabled' AND Registered_As = 'LECTURER'";
                    SqlCommand cmd = new SqlCommand(sqlQuery, con);
                    cmd.Parameters.AddWithValue("@Email", EmailTxt.Text);
                    cmd.Parameters.AddWithValue("@PhoneNo", PhoneNoTxt.Text);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        StatusLabel.Visible = true;
                        StatusLabel.Text = "Record Found!";
                        StatusLabel.ForeColor = System.Drawing.Color.Green;

                        UpadteStatusLabel.Visible = false;
                        PasswordLabel.Visible = true;
                        ConfirmPasswordLabel.Visible = true;
                        PasswordTxt.Visible = true;
                        ConfirmPasswordTxt.Visible = true;
                        ResetPasswordBtn.Visible = true;
                        //ShowPassword_Btn.Visible = true;
                    }
                    else
                    {
                        StatusLabel.Visible = true;
                        StatusLabel.Text = "Invalid email ID/phone number or your account is disabled!";
                    }
                }
            }
        }

        protected void encryptPassword()
        {
            string strmsg = string.Empty;
            byte[] encode = new byte[PasswordTxt.Text.ToString().Length];
            encode = Encoding.UTF8.GetBytes(PasswordTxt.Text);
            strmsg = Convert.ToBase64String(encode);
            encrypt_Password = strmsg;

            string strmsg2 = string.Empty;
            byte[] encode_cpassword = new byte[ConfirmPasswordTxt.Text.ToString().Length];
            encode_cpassword = Encoding.UTF8.GetBytes(ConfirmPasswordTxt.Text);
            strmsg2 = Convert.ToBase64String(encode_cpassword);
            encrypt_CPassword = strmsg;
        }
        protected void ResetPasswordBtn_Click(object sender, EventArgs e)
        {
            encryptPassword();
            using (SqlConnection con = new SqlConnection(strCon))
            {
                if (!string.IsNullOrEmpty(EmailTxt.Text.Trim()) && !string.IsNullOrEmpty(PhoneNoTxt.Text.Trim()) && !string.IsNullOrEmpty(PasswordTxt.Text.Trim()) && !string.IsNullOrEmpty(ConfirmPasswordTxt.Text.Trim()))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_ForgotPassword_COLLEGEPROJECT_FILE_UPLOAD", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Email", EmailTxt.Text);
                        string registeredAs = "LECTURER";
                        cmd.Parameters.AddWithValue("@Registered_As", registeredAs);
                        cmd.Parameters.AddWithValue("@PhoneNo", PhoneNoTxt.Text);
                        cmd.Parameters.AddWithValue("@Password", encrypt_Password);
                        cmd.Parameters.AddWithValue("@Confirm_Password", encrypt_CPassword);

                        con.Open();
                        int a = cmd.ExecuteNonQuery();

                        if (a > 0)
                        {
                            UpadteStatusLabel.Visible = true;
                            UpadteStatusLabel.Text = "PASSWORD CHANGED!";
                            UpadteStatusLabel.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            UpadteStatusLabel.Visible = true;
                            UpadteStatusLabel.Text = "Password not Updated!";
                            UpadteStatusLabel.ForeColor = System.Drawing.Color.Red;
                        }
                        ClearControls();
                        con.Close();
                    }
                }
                else
                {
                    UpadteStatusLabel.Visible = true;
                    UpadteStatusLabel.Text = "Password was not Updated!";
                    UpadteStatusLabel.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void BackToLoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LOGIN_AS_PAGE.aspx");
        }
    }
}