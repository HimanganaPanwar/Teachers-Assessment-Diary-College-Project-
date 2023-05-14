using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace College_Project__FILE_UPLOAD_
{
    public class Lecturer_Awards_Scholarship
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Awards_Name { get; set; }
        public string FileName { get; set; }
        public string Comment { get; set; }
        public DateTime UploadedOn { get; set; }
    }

    public class LecturerDataAccessLayerAwards_Scholarship
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //SELECT METHOD:(RETRIEVE ALL THE RECORDS OF A PARTICULAR LECTURER FROM THE TABLE)
        //public static List<Lecturer_Awards_Scholarship> GetAllDetailsOfTheLecturers(int Teacher_ID)
        //{
        //    List<Lecturer_Awards_Scholarship> listLecturers = new List<Lecturer_Awards_Scholarship>();

        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT * FROM Awards_Scholarship_COLLEGEPROJECT WHERE Teacher_ID =  @Teacher_ID", con);
        //        SqlParameter param = new SqlParameter("@Teacher_ID", Teacher_ID);
        //        cmd.Parameters.Add(param);
        //        con.Open();
        //        SqlDataReader rdr = cmd.ExecuteReader();
        //        while (rdr.Read())
        //        {
        //            Lecturer_Awards_Scholarship lecturer = new Lecturer_Awards_Scholarship();
        //            lecturer.S_No = Convert.ToInt32(rdr["S_No"]);
        //            lecturer.Teacher_ID = Convert.ToInt32(rdr["Teacher_ID"]);
        //            lecturer.Year = Convert.ToInt32(rdr["Year"]);
        //            lecturer.Awards_Name = rdr["Awards_Name"].ToString();
        //            lecturer.Link = rdr["Link"].ToString();
        //            lecturer.Comment = rdr["Comment"].ToString();
        //            lecturer.UploadedOn = Convert.ToDateTime(rdr["UploadedOn"]);

        //            listLecturers.Add(lecturer);
        //        }
        //    }
        //    return listLecturers;
        //}

        //DELETE METHOD:
        public static void DeleteRecord(int S_No)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Awards_Scholarship_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string Awards_Name, string Comment, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Awards_Scholarship_COLLEGEPROJECT_FILE_UPLOAD SET  " + "Year = @Year, Awards_Name = @Awards_Name, FileName = @FileName, Comment = @Comment WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramAwards_Name = new SqlParameter("@Awards_Name", Awards_Name);
                cmd.Parameters.Add(paramAwards_Name);

                SqlParameter paramComment = new SqlParameter("@Comment", Comment);
                cmd.Parameters.Add(paramComment);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}