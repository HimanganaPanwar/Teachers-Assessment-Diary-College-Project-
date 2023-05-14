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
    public class Lecturer_Examinership
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Class { get; set; }
        public string Paper { get; set; }
        public string Institution_Name { get; set; }
        public string FileName { get; set; }
        public DateTime UploadedOn { get; set; }
    }

    public class LecturerDataAccessLayerExaminership
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //SELECT METHOD:(RETRIEVE ALL THE RECORDS OF A PARTICULAR LECTURER FROM THE TABLE)
        //public static List<Lecturer_Examinership> GetAllDetailsOfTheLecturers(int Teacher_ID)
        //{
        //    List<Lecturer_Examinership> listLecturers = new List<Lecturer_Examinership>();

        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT * FROM Examinership_COLLEGEPROJECT WHERE Teacher_ID =  @Teacher_ID", con);
        //        SqlParameter param = new SqlParameter("@Teacher_ID", Teacher_ID);
        //        cmd.Parameters.Add(param);
        //        con.Open();
        //        SqlDataReader rdr = cmd.ExecuteReader();
        //        while (rdr.Read())
        //        {
        //            Lecturer_Examinership lecturer = new Lecturer_Examinership();
        //            lecturer.S_No = Convert.ToInt32(rdr["S_No"]);
        //            lecturer.Teacher_ID = Convert.ToInt32(rdr["Teacher_ID"]);
        //            lecturer.Year = Convert.ToInt32(rdr["Year"]);
        //            lecturer.Class = rdr["Class"].ToString();
        //            lecturer.Paper = rdr["Paper"].ToString();
        //            lecturer.Institution_Name = rdr["Institution_Name"].ToString();
        //            lecturer.Link = rdr["Link"].ToString();
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
                SqlCommand cmd = new SqlCommand("DELETE FROM Examinership_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string Class, string Paper, string Institution_Name, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Examinership_COLLEGEPROJECT_FILE_UPLOAD SET  " + "Year = @Year, Class = @Class, Paper = @Paper, Institution_Name = @Institution_Name, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramClass = new SqlParameter("@Class", Class);
                cmd.Parameters.Add(paramClass);

                SqlParameter paramPaper = new SqlParameter("@Paper", Paper);
                cmd.Parameters.Add(paramPaper);

                SqlParameter paramInstitution_Name = new SqlParameter("@Institution_Name", Institution_Name);
                cmd.Parameters.Add(paramInstitution_Name);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}