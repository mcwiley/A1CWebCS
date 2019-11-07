using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace A1CWebCS
{
    public partial class _Default : Page
    {

        public SqlConnection sqlcon = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = "Data Source=s13.winhost.com;Initial Catalog=DB_103045_a1cdb;Persist Security Info=True;User ID=DB_103045_a1cdb_user;Password=Patty02$";
            sqlcon.ConnectionString = connectionString;

            //MaskedEdit1.Mask = "###";

            Calc_Avg_A1C();

        }











        protected void btn_Add_Click(object sender, EventArgs e)
        {
            DateTime ddd = DatePicker1.SelectedDate;

            SqlDataSource1.DataBind();
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

        public void Calc_Avg_A1C()
        {
            double AvgOvr = 0;
            double Avg30 = 0;
            double Avg60 = 0;
            double Avg90 = 0;

            DateTime todayDate = new DateTime();

            todayDate = DateTime.Now;

            string last30 = "";
            string last60 = "";
            string last90 = "";

            last30 = todayDate.AddMonths(-1).ToString("d");
            last60 = todayDate.AddMonths(-2).ToString("d");
            last90 = todayDate.AddMonths(-3).ToString("d");

            string sSQL30 = "Select AVG(Reading_Value) as my30 From dbo.tbl_A1C where Reading_Date between DATEADD(MONTH, -1, GETDATE()) and GETDATE()";
            string sSQL60 = "Select AVG(Reading_Value) as my60 From dbo.tbl_A1C where Reading_Date between DATEADD(MONTH, -2, GETDATE()) and GETDATE()";
            string sSQL90 = "Select AVG(Reading_Value) as my90 From dbo.tbl_A1C where Reading_Date between DATEADD(MONTH, -3, GETDATE()) and GETDATE()";
            string sSQLOver = "Select AVG(Reading_Value) as myOVR From dbo.tbl_A1C";

            //string sSQL30 = "Select AVG(Reading_Value) as my30 From dbo_tbl_A1C where Reading_Date between '" + last30 + "' and '" + todayDate.ToString("d") + "'";
            //string sSQL60 = "Select AVG(Reading_Value) as my60 From dbo_tbl_A1C where Reading_Date between '" + last60 + "' and '" + todayDate.ToString("d") + "'";
            //string sSQL90 = "Select AVG(Reading_Value) as my90 From dbo_tbl_A1C where Reading_Date between '" + last90 + "' and '" + todayDate.ToString("d") + "'";
            //string sSQLOver = "Select AVG(Reading_Value) as myOVR From dbo_tbl_A1C";

            DataSet ds3 = new DataSet();
            SqlDataAdapter da3 = new SqlDataAdapter(sSQL30, sqlcon);
            //OleDbDataAdapter da3 = new OleDbDataAdapter(sSQL30, sqlcon);
            da3.Fill(ds3);
            double daAvg3 = Convert.ToDouble(ds3.Tables[0].Rows[0]["my30"]);
            Avg30 = (double)((46.7 + daAvg3) / 28.7) + 1;
            lbl_30Day.Text = Avg30.ToString("##.##");
            //txt_30.Text = Avg30.ToString("##.##");

            DataSet ds6 = new DataSet();
            SqlDataAdapter da6 = new SqlDataAdapter(sSQL60, sqlcon);
            //OleDbDataAdapter da6 = new OleDbDataAdapter(sSQL60, sqlcon);
            da6.Fill(ds6);
            double daAvg6 = Convert.ToDouble(ds6.Tables[0].Rows[0]["my60"]);
            Avg60 = (double)((46.7 + daAvg6) / 28.7) + 1;
            lbl_60Day.Text = Avg60.ToString("##.##");
            //txt_60.Text = Avg60.ToString("##.##");

            DataSet ds9 = new DataSet();
            SqlDataAdapter da9 = new SqlDataAdapter(sSQL90, sqlcon);
            //OleDbDataAdapter da9 = new OleDbDataAdapter(sSQL90, sqlcon);
            da9.Fill(ds9);
            double daAvg9 = Convert.ToDouble(ds9.Tables[0].Rows[0]["my90"]);
            Avg90 = (double)((46.7 + daAvg9) / 28.7) + 1;
            lbl_90Day.Text = Avg90.ToString("##.##");
            //txt_90.Text = Avg90.ToString("##.##");

            DataSet dsO = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(sSQLOver, sqlcon);
            //OleDbDataAdapter da = new OleDbDataAdapter(sSQLOver, sqlcon);
            da.Fill(dsO);
            double daAvgOvr = Convert.ToDouble(dsO.Tables[0].Rows[0]["myOVR"]);
            AvgOvr = (double)((46.7 + daAvgOvr) / 28.7) + 1;
            lbl_Overall.Text = AvgOvr.ToString("##.##");
            //txt_Overall.Text = AvgOvr.ToString("##.##");
        }

    }
}