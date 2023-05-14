using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace College_Project__FILE_UPLOAD_
{
    public class Lecturer_LeaveRecord
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public int Casual_Leave { get; set; }
        public int Extraordinary_Leave { get; set; }
        public int Academic_Leave { get; set; }
        public int Duty_Leave { get; set; }
    }

    public class LecturerDataAccessLayerLeaveRecTbl
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //SELECT METHOD:(RETRIEVE ALL THE RECORDS OF A PARTICULAR LECTURER FROM THE TABLE)
        public static List<Lecturer_LeaveRecord> GetAllDetailsOfTheLecturers(int Teacher_ID)
        {
            List<Lecturer_LeaveRecord> listLecturers = new List<Lecturer_LeaveRecord>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Leave_Record_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  @Teacher_ID", con);
                SqlParameter param = new SqlParameter("@Teacher_ID", Teacher_ID);
                cmd.Parameters.Add(param);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Lecturer_LeaveRecord lecturer = new Lecturer_LeaveRecord();
                    lecturer.S_No = Convert.ToInt32(rdr["S_No"]);
                    lecturer.Teacher_ID = Convert.ToInt32(rdr["Teacher_ID"]);
                    lecturer.Year = Convert.ToInt32(rdr["Year"]);
                    lecturer.Casual_Leave = Convert.ToInt32(rdr["Casual_Leave"]);
                    lecturer.Extraordinary_Leave = Convert.ToInt32(rdr["Extraordinary_Leave"]);
                    lecturer.Academic_Leave = Convert.ToInt32(rdr["Academic_Leave"]);
                    lecturer.Duty_Leave = Convert.ToInt32(rdr["Duty_Leave"]);

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
                SqlCommand cmd = new SqlCommand("DELETE FROM Leave_Record_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, int Casual_Leave, int Extraordinary_Leave, int Academic_Leave, int Duty_Leave)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Leave_Record_COLLEGEPROJECT_FILE_UPLOAD SET Year = @Year, " + "Casual_Leave = @Casual_Leave, Extraordinary_Leave = @Extraordinary_Leave, Academic_Leave = @Academic_Leave, Duty_Leave = @Duty_Leave WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);
                SqlParameter paramCasual_Leave = new SqlParameter("@Casual_Leave", Casual_Leave);
                cmd.Parameters.Add(paramCasual_Leave);
                SqlParameter paramExtraordinary_Leave = new SqlParameter("@Extraordinary_Leave", Extraordinary_Leave);
                cmd.Parameters.Add(paramExtraordinary_Leave);
                SqlParameter paramAcademic_Leave = new SqlParameter("@Academic_Leave", Academic_Leave);
                cmd.Parameters.Add(paramAcademic_Leave);
                SqlParameter paramDuty_Leave = new SqlParameter("@Duty_Leave", Duty_Leave);
                cmd.Parameters.Add(paramDuty_Leave);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}