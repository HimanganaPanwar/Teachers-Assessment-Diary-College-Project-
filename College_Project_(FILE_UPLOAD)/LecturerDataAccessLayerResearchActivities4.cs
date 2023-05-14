using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace College_Project__FILE_UPLOAD_
{
    public class Lecturer_ResearchActivities_4_
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public string DocumentType { get; set; }
        public string OrganisingBody { get; set; }
        public string ThemeOfSeminar { get; set; }
        public DateTime Date { get; set; }
        public string Level { get; set; }
        public string TitleOfPaper { get; set; }
        public string FileName { get; set; }
    }

    public class LecturerDataAccessLayerResearchActivities4
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //SELECT METHOD:(RETRIEVE ALL THE RECORDS OF A PARTICULAR LECTURER FROM THE TABLE)
        //public static List<Lecturer_ResearchActivities_4_> GetAllDetailsOfTheLecturers(int Teacher_ID)
        //{
        //    List<Lecturer_ResearchActivities_4_> listLecturers = new List<Lecturer_ResearchActivities_4_>();

        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT * FROM ResearchActivities_4_COLLEGEPROJECT WHERE Teacher_ID =  @Teacher_ID", con);
        //        SqlParameter param = new SqlParameter("@Teacher_ID", Teacher_ID);
        //        cmd.Parameters.Add(param);
        //        con.Open();
        //        SqlDataReader rdr = cmd.ExecuteReader();
        //        while (rdr.Read())
        //        {
        //            Lecturer_ResearchActivities_4_ lecturer = new Lecturer_ResearchActivities_4_();
        //            lecturer.S_No = Convert.ToInt32(rdr["S_No"]);
        //            lecturer.Teacher_ID = Convert.ToInt32(rdr["Teacher_ID"]);
        //            lecturer.DocumentType = rdr["DocumentType"].ToString();
        //            lecturer.OrganisingBody = rdr["OrganisingBody"].ToString();
        //            lecturer.ThemeOfSeminar = rdr["ThemeOfSeminar"].ToString();
        //            lecturer.Date = Convert.ToDateTime(rdr["Date"].ToString());
        //            lecturer.Level = rdr["Level"].ToString();
        //            lecturer.TitleOfPaper = rdr["TitleOfPaper"].ToString();
        //            lecturer.Link = rdr["Link"].ToString();

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
                SqlCommand cmd = new SqlCommand("DELETE FROM ResearchActivities_4_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, string DocumentType, string OrganisingBody, string ThemeOfSeminar, DateTime Date, int Level, string TitleOfPaper, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE ResearchActivities_4_COLLEGEPROJECT_FILE_UPLOAD SET  " + "DocumentType = @DocumentType, OrganisingBody = @OrganisingBody, ThemeOfSeminar = @ThemeOfSeminar, Date = @Date, Level = @Level, TitleOfPaper = @TitleOfPaper, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramDocumentType = new SqlParameter("@DocumentType", DocumentType);
                cmd.Parameters.Add(paramDocumentType);

                SqlParameter paramOrganisingBody = new SqlParameter("@OrganisingBody", OrganisingBody);
                cmd.Parameters.Add(paramOrganisingBody);

                SqlParameter paramThemeOfSeminar = new SqlParameter("@ThemeOfSeminar", ThemeOfSeminar);
                cmd.Parameters.Add(paramThemeOfSeminar);

                SqlParameter paramDate = new SqlParameter("@Date", Date);
                cmd.Parameters.Add(paramDate);

                SqlParameter paramLevel = new SqlParameter("@Level", Level);
                cmd.Parameters.Add(paramLevel);

                SqlParameter paramTitleOfPaper = new SqlParameter("@TitleOfPaper", TitleOfPaper);
                cmd.Parameters.Add(paramTitleOfPaper);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}