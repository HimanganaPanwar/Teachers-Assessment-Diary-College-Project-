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
    public class Lecturer_Institude_Membership
    {
        public int S_No { get; set; }
        public int Teacher_ID { get; set; }
        public int Year { get; set; }
        public string Institude_Name { get; set; }
        public string Duration { get; set; }
        public string MembershipYear { get; set; }
        public int Level { get; set; }
        public string FileName { get; set; }
        public DateTime UploadedOn { get; set; }
    }

    public class LecturerDataAccessLayerInstitude_Membership
    {
        static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //SELECT METHOD:(RETRIEVE ALL THE RECORDS OF A PARTICULAR LECTURER FROM THE TABLE)
        //public static List<Lecturer_Institude_Membership> GetAllDetailsOfTheLecturers(int Teacher_ID)
        //{
        //    List<Lecturer_Institude_Membership> listLecturers = new List<Lecturer_Institude_Membership>();

        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT * FROM Institude_Membership_COLLEGEPROJECT WHERE Teacher_ID =  @Teacher_ID", con);
        //        SqlParameter param = new SqlParameter("@Teacher_ID", Teacher_ID);
        //        cmd.Parameters.Add(param);
        //        con.Open();
        //        SqlDataReader rdr = cmd.ExecuteReader();
        //        while (rdr.Read())
        //        {
        //            Lecturer_Institude_Membership lecturer = new Lecturer_Institude_Membership();
        //            lecturer.S_No = Convert.ToInt32(rdr["S_No"]);
        //            lecturer.Teacher_ID = Convert.ToInt32(rdr["Teacher_ID"]);
        //            lecturer.Year = Convert.ToInt32(rdr["Year"]);
        //            lecturer.Institude_Name = rdr["Institude_Name"].ToString();
        //            lecturer.Duration = rdr["Duration"].ToString();
        //            lecturer.MembershipYear = rdr["MembershipYear"].ToString();
        //            lecturer.Level = Convert.ToInt32(rdr["Level"]);
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
                SqlCommand cmd = new SqlCommand("DELETE FROM Institude_Membership_COLLEGEPROJECT_FILE_UPLOAD WHERE S_No = @S_No", con);
                SqlParameter param = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(param);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        //UPDATE METHOD: 
        public static int UpdateRecord(int S_No, int Year, string Institude_Name, string Duration, string MembershipYear, int Level, string FileName)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string updateQuery = "UPDATE Institude_Membership_COLLEGEPROJECT_FILE_UPLOAD SET  " + "Year = @Year, Institude_Name = @Institude_Name, Duration = @Duration, MembershipYear = @MembershipYear, Level = @Level, FileName = @FileName WHERE S_No= @S_No";
                SqlCommand cmd = new SqlCommand(updateQuery, con);

                SqlParameter paramS_No = new SqlParameter("@S_No", S_No);
                cmd.Parameters.Add(paramS_No);

                SqlParameter paramYear = new SqlParameter("@Year", Year);
                cmd.Parameters.Add(paramYear);

                SqlParameter paramInstitude_Name = new SqlParameter("@Institude_Name", Institude_Name);
                cmd.Parameters.Add(paramInstitude_Name);

                SqlParameter paramDuration = new SqlParameter("@Duration", Duration);
                cmd.Parameters.Add(paramDuration);

                SqlParameter paramMembershipYear = new SqlParameter("@MembershipYear", MembershipYear);
                cmd.Parameters.Add(paramMembershipYear);

                SqlParameter paramLevel = new SqlParameter("@Level", Level);
                cmd.Parameters.Add(paramLevel);

                SqlParameter paramFileName = new SqlParameter("@FileName", FileName);
                cmd.Parameters.Add(paramFileName);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}