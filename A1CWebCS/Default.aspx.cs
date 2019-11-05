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
    }
}