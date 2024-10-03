using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Xml.Linq;


public partial class ReportPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {
            GetStudentData();
            GetDataItem();
            GetDataItem2();
        }

    }
    protected void GetDataItem2()
    {
        if (ddlSubject.SelectedValue == "Select Subject")
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            SqlCommand cmd = new SqlCommand("UspGetUploadData", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 2);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        else
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            SqlCommand cmd = new SqlCommand("UspGetUploadData", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 1);
            cmd.Parameters.AddWithValue("@Subject", ddlSubject.SelectedValue);
            cmd.Parameters.AddWithValue("@Semester", ddlSemester.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
    protected void GetDataItem()
    {



        if (ddlSemester.SelectedValue == "Select Semester")
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            SqlCommand cmd = new SqlCommand("UspGetUploadData", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 4);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        else
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            SqlCommand cmd = new SqlCommand("UspGetUploadData", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 3);
            cmd.Parameters.AddWithValue("@Semester", ddlSemester.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }


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


        GetDataItem2();

    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetDataItem();
    }

}

