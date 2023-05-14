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
    public class Lecturer_Organized_Table_2
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Organisation_Name { get; set; }
        public string Date_Value { get; set; }
        public int Level { get; set; }
        public string Lecture_Subject { get; set; }
        public string FileName { get; set; }
        public DateTime UploadedOn { get; set; }
    }

    public class LecturerDataAccessLayerOrganized_Table_2
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string Organisation_Name, string Date_Value, int Level, string Lecture_Subject, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Organized_Table_2_COLLEGEPROJECT_FILE_UPLOAD SET Year = @Year, " + "Organisation_Name = @Organisation_Name, Date_Value = @Date_Value, Level = @Level, Lecture_Subject = @Lecture_Subject, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramOrganisation_Name = new SqlParameter("@Organisation_Name", Organisation_Name);
                cmd.Parameters.Add(paramOrganisation_Name);

                SqlParameter paramDate_Value = new SqlParameter("@Date_Value", Date_Value);
                cmd.Parameters.Add(paramDate_Value);

                SqlParameter paramLevel = new SqlParameter("@Level", Level);
                cmd.Parameters.Add(paramLevel);

                SqlParameter paramLecture_Subject = new SqlParameter("@Lecture_Subject", Lecture_Subject);
                cmd.Parameters.Add(paramLecture_Subject);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}