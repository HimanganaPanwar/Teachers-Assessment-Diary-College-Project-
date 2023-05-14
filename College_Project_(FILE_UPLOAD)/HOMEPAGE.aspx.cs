using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace College_Project__FILE_UPLOAD_
{
    public partial class HOMEPAGE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
        }
        protected void LoginAs_Btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LOGIN_AS_PAGE.aspx");
        }
        protected void Registration_Btn_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/REGISTRATION_PAGE.aspx");
        }
    }
}