using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace College_Project__FILE_UPLOAD_
{
    public class Lecturer_Extra_Curricular_Activities
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Activity_Name { get; set; }
        public string Convener_Member { get; set; }
        public string Contribution { get; set; }
        public DateTime UploadedOn { get; set; }
    }

    public class LecturerDataAccessLayerExtra_Curricular_Activities
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //SELECT METHOD:(RETRIEVE ALL THE RECORDS OF A PARTICULAR LECTURER FROM THE TABLE)
        public static List<Lecturer_Extra_Curricular_Activities> GetAllDetailsOfTheLecturers(int Teacher_ID)
        {
            List<Lecturer_Extra_Curricular_Activities> listLecturers = new List<Lecturer_Extra_Curricular_Activities>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Extra_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  @Teacher_ID", con);
                SqlParameter param = new SqlParameter("@Teacher_ID", Teacher_ID);
                cmd.Parameters.Add(param);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Lecturer_Extra_Curricular_Activities lecturer = new Lecturer_Extra_Curricular_Activities();
                    lecturer.S_No = Convert.ToInt32(rdr["S_No"]);
                    lecturer.Teacher_ID = Convert.ToInt32(rdr["Teacher_ID"]);
                    lecturer.Year = Convert.ToInt32(rdr["Year"]);
                    lecturer.Activity_Name = rdr["Activity_Name"].ToString();
                    lecturer.Convener_Member = rdr["Convener_Member"].ToString();
                    lecturer.Contribution = rdr["Contribution"].ToString();
                    lecturer.UploadedOn = Convert.ToDateTime(rdr["UploadedOn"]);

                    listLecturers.Add(lecturer);
                }
            }
            return listLecturers;
        }

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Extra_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string Activity_Name, string Convener_Member, string Contribution)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Extra_Curricular_Activities_COLLEGEPROJECT_FILE_UPLOAD SET Year = @Year, " + "Activity_Name = @Activity_Name, Convener_Member = @Convener_Member, Contribution = @Contribution WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramActivity_Name = new SqlParameter("@Activity_Name", Activity_Name);
                cmd.Parameters.Add(paramActivity_Name);

                SqlParameter paramConvener_Member = new SqlParameter("@Convener_Member", Convener_Member);
                cmd.Parameters.Add(paramConvener_Member);

                SqlParameter paramContribution = new SqlParameter("@Contribution", Contribution);
                cmd.Parameters.Add(paramContribution);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}