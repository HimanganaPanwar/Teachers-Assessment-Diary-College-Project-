using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace College_Project__FILE_UPLOAD_
{
    public class Lecturer_UnderGraduateCourses
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Class { get; set; }
        public string Paper { get; set; }
        public string Nomenclature { get; set; }
        public int PeriodsPerWeek { get; set; }
        public string Lecture_Method { get; set; }
        public string Seminar_Presentation_Method { get; set; }
        public DateTime UploadedOn { get; set; }
    }

    public class LecturerDataAccessLayerUnderGraduateCourses
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //SELECT METHOD:(RETRIEVE ALL THE RECORDS OF A PARTICULAR LECTURER FROM THE TABLE)
        public static List<Lecturer_UnderGraduateCourses> GetAllDetailsOfTheLecturers(int Teacher_ID)
        {
            List<Lecturer_UnderGraduateCourses> listLecturers = new List<Lecturer_UnderGraduateCourses>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM UnderGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD WHERE Teacher_ID =  @Teacher_ID", con);
                SqlParameter param = new SqlParameter("@Teacher_ID", Teacher_ID);
                cmd.Parameters.Add(param);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Lecturer_UnderGraduateCourses lecturer = new Lecturer_UnderGraduateCourses();
                    lecturer.S_No = Convert.ToInt32(rdr["S_No"]);
                    lecturer.Teacher_ID = Convert.ToInt32(rdr["Teacher_ID"]);
                    lecturer.Year = Convert.ToInt32(rdr["Year"]);
                    lecturer.Class = rdr["Class"].ToString();
                    lecturer.Paper = rdr["Paper"].ToString();
                    lecturer.Nomenclature = rdr["Nomenclature"].ToString();
                    lecturer.PeriodsPerWeek = Convert.ToInt32(rdr["PeriodsPerWeek"]);
                    lecturer.Lecture_Method = rdr["Lecture_Method"].ToString();
                    lecturer.Seminar_Presentation_Method = rdr["Seminar_Presentation_Method"].ToString();
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
                SqlCommand cmd = new SqlCommand("DELETE FROM UnderGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string Class, string Paper, string Nomenclature, int PeriodsPerWeek, string Lecture_Method, string Seminar_Presentation_Method)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE UnderGraduateCourses_COLLEGEPROJECT_FILE_UPLOAD SET Year = @Year, " + "Class = @Class, Paper = @Paper, Nomenclature = @Nomenclature, PeriodsPerWeek = @PeriodsPerWeek, Lecture_Method = @Lecture_Method, Seminar_Presentation_Method = @Seminar_Presentation_Method WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramClass = new SqlParameter("@Class", Class);
                cmd.Parameters.Add(paramClass);

                SqlParameter paramPaper = new SqlParameter("@Paper", Paper);
                cmd.Parameters.Add(paramPaper);

                SqlParameter paramNomenclature = new SqlParameter("@Nomenclature", Nomenclature);
                cmd.Parameters.Add(paramNomenclature);

                SqlParameter paramPeriodsPerWeek = new SqlParameter("@PeriodsPerWeek", PeriodsPerWeek);
                cmd.Parameters.Add(paramPeriodsPerWeek);

                SqlParameter paramLecture_Method = new SqlParameter("@Lecture_Method", Lecture_Method);
                cmd.Parameters.Add(paramLecture_Method);

                SqlParameter paramSeminar_Presentation_Method = new SqlParameter("@Seminar_Presentation_Method", Seminar_Presentation_Method);
                cmd.Parameters.Add(paramSeminar_Presentation_Method);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}