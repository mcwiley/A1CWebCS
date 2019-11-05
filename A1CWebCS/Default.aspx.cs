using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A1CWebCS
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_30Day.Text = "6.1";
            lbl_60Day.Text = "6.3";
            lbl_90Day.Text = "6.9";
            lbl_Overall.Text = "7.1";
            int a = 100;
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Clear_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Export_Click(object sender, EventArgs e)
        {
            Response.Redirect("Export.aspx");
        }

        protected void btn_About_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }
    }
}