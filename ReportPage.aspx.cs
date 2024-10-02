using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI;


public partial class ReportPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetDataItem();
        GetStudentData();
    }
    protected void GetDataItem()
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("UspGetUploadData", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();


    }

    protected void GetStudentData()
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("UspGetStudentData", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();


    }

    protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGridView(); 
    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGridView(); 
    }

    private void BindGridView()
    {
        string selectedSubject = ddlSubject.SelectedValue;
        string selectedSemester = ddlSemester.SelectedValue;

        string query = "SELECT * FROM tblStudyMaterial WHERE 1=1";

        if (selectedSubject != "0")
        {
            query += " AND Subject = @Subject";
        }

        if (selectedSemester != "0")
        {
            query += " AND Semester = @Semester";
        }

        using (SqlConnection conn = new SqlConnection("UspGetUploadData"))
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                if (selectedSubject != "0")
                {
                    cmd.Parameters.AddWithValue("@Subject", ddlSubject.SelectedItem.Text);
                }

                if (selectedSemester != "0")
                {
                    cmd.Parameters.AddWithValue("@Semester", ddlSemester.SelectedItem.Text);
                }

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }




}


