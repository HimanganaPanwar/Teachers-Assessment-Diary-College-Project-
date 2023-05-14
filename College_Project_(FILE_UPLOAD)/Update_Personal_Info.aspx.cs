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
    public partial class Update_Personal_Info : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    //USING QUERY STRING:
                    if (Session["Row"] != null)
                    {
                        //Fetch the GridView Row from Session.
                        GridViewRow row = Session["Row"] as GridViewRow;

                        //Fetch and display the Cell values.
                        IDLabel.Text = row.Cells[0].Text;
                        EmailTxt.Text = row.Cells[3].Text;
                    }
                    else if (Request.QueryString["ID"] != null)
                    {
                        string TeacherID = "0";
                        TeacherID = Request.QueryString["ID"].ToString();
                        IDLabel.Text = TeacherID;
                    }
                    else
                    {
                        EmailTxt.Text = Session["LecturerEmail"].ToString();
                    }

                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT U_ID, Prefix, First_Name, Last_Name, Fathers_Name, Mothers_Name, Husbands_Name, Email, PhoneNo, AlternatePhoneNo, Gender, Faculty, Department, Status, Address FROM GeneralInfo_COLLEGEPROJECT_FILE_UPLOAD WHERE  U_ID = '" + IDLabel.Text + "' OR Email = '" + EmailTxt.Text + "';"))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            using (SqlDataReader sdr = cmd.ExecuteReader())
                            {
                                sdr.Read();
                                IDLabel.Text = sdr["U_ID"].ToString();
                                Prefix_DropDownList.SelectedValue = sdr["Prefix"].ToString();
                                FirstNameTxt.Text = sdr["First_Name"].ToString();
                                LastNameTxt.Text = sdr["Last_Name"].ToString();
                                FathersNameTxt.Text = sdr["Fathers_Name"].ToString();
                                MothersNameTxt.Text = sdr["Mothers_Name"].ToString();
                                HusbandsNameTxt.Text = sdr["Husbands_Name"].ToString();
                                EmailTxt.Text = sdr["Email"].ToString();
                                PhoneNoTxt.Text = sdr["PhoneNo"].ToString();
                                AlternateNoTxt.Text = sdr["AlternatePhoneNo"].ToString();

                                if (sdr["Gender"].ToString() == "Male")
                                {
                                    MALE_RadioButton.Checked = true;
                                }
                                else if (sdr["Gender"].ToString() == "Female")
                                {
                                    FEMALE_RadioButton.Checked = true;
                                }
                                else if (sdr["Gender"].ToString() == "Others")
                                {
                                    OTHERS_RadioButton.Checked = true;
                                }

                                FACULTY_DropDownList.SelectedValue = sdr["Faculty"].ToString();

                                DEPARTMENT_DropDownList.SelectedValue = sdr["Department"].ToString();

                                STATUS_DropDownList.SelectedValue = sdr["Status"].ToString();

                                AddressTxt.Text = sdr["Address"].ToString();

                                AddDataToSession();
                            }
                            con.Close();
                        }
                    }

                    if (Session["AdminEmail"] != null)
                    {
                        SubmitBtn.Visible = false;
                        FirstNameTxt.Attributes.Add("readonly", "readonly");
                        LastNameTxt.Attributes.Add("readonly", "readonly");
                        Prefix_DropDownList.Attributes.Add("disabled", "disabled");
                        FACULTY_DropDownList.Attributes.Add("disabled", "disabled");
                        DEPARTMENT_DropDownList.Attributes.Add("disabled", "disabled");
                        STATUS_DropDownList.Attributes.Add("disabled", "disabled");
                        FathersNameTxt.Attributes.Add("readonly", "readonly");
                        MothersNameTxt.Attributes.Add("readonly", "readonly");
                        HusbandsNameTxt.Attributes.Add("readonly", "readonly");
                        EmailTxt.Attributes.Add("readonly", "readonly");
                        PhoneNoTxt.Attributes.Add("readonly", "readonly");
                        AlternateNoTxt.Attributes.Add("readonly", "readonly");
                        AddressTxt.Attributes.Add("readonly", "readonly");

                        if (MALE_RadioButton.Checked)
                        {
                            MALE_RadioButton.Enabled = false;

                            FEMALE_RadioButton.Visible = false;
                            OTHERS_RadioButton.Visible = false;
                        }
                        else if (FEMALE_RadioButton.Checked)
                        {
                            FEMALE_RadioButton.Enabled = false;

                            MALE_RadioButton.Visible = false;
                            OTHERS_RadioButton.Visible = false;
                        }
                        else if (OTHERS_RadioButton.Checked)
                        {
                            OTHERS_RadioButton.Enabled = false;

                            FEMALE_RadioButton.Visible = false;
                            MALE_RadioButton.Visible = false;
                        }
                    }
                    else if (Session["LecturerEmail"] != null)
                    {
                        SubmitBtn.Visible = true;
                    }
                }
                catch (NullReferenceException ex)
                {
                    Response.Redirect("~/HOMEPAGE.aspx");
                }
            }
        }

        private void AddDataToSession()
        {
            Session.Add("Teacher_ID", IDLabel.Text);
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_UpdateMainData_COLLEGEPROJECT_FILE_UPLOAD", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@U_ID", Convert.ToInt32(IDLabel.Text));
                    cmd.Parameters.AddWithValue("@Prefix", Prefix_DropDownList.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@First_Name", FirstNameTxt.Text);
                    cmd.Parameters.AddWithValue("@Last_Name", LastNameTxt.Text);
                    cmd.Parameters.AddWithValue("@Fathers_Name", FathersNameTxt.Text);
                    cmd.Parameters.AddWithValue("@Mothers_Name", MothersNameTxt.Text);
                    cmd.Parameters.AddWithValue("@Husbands_Name", HusbandsNameTxt.Text);
                    cmd.Parameters.AddWithValue("@Email", EmailTxt.Text);
                    cmd.Parameters.AddWithValue("@PhoneNo", PhoneNoTxt.Text);
                    cmd.Parameters.AddWithValue("@AlternatePhoneNo", AlternateNoTxt.Text);

                    string gender = string.Empty;
                    if (MALE_RadioButton.Checked)
                    {
                        gender = "Male";
                    }
                    else if (FEMALE_RadioButton.Checked)
                    {
                        gender = "Female";
                    }
                    else if(OTHERS_RadioButton.Checked)
                    {
                        gender = "Others";
                    }
                    cmd.Parameters.AddWithValue("@Gender", gender);

                    cmd.Parameters.AddWithValue("@Faculty", FACULTY_DropDownList.SelectedItem.Value);

                    cmd.Parameters.AddWithValue("@Department", DEPARTMENT_DropDownList.SelectedItem.Value);

                    cmd.Parameters.AddWithValue("@Status", STATUS_DropDownList.SelectedItem.Value);

                    cmd.Parameters.AddWithValue("@Address", AddressTxt.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    StatusLabel.Text = "RECORD UPDATED!!";
                    StatusLabel.ForeColor = System.Drawing.Color.Green;

                    con.Close();
                }
            }
        }

        protected void BackButton_Click1(object sender, EventArgs e)
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
    }
}