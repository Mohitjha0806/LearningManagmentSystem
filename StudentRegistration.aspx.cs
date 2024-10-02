using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   

  

    protected void Button1_Click(object sender, EventArgs e)
    {
        string studentName = txtStudentName.Text;
        int studentID = int.Parse(txtStudentID.Text);
        string subject = ddlSubject.SelectedItem.Text;
        string semester = ddlSemester.SelectedItem.Text;
        string dob = txtDOB.Text;
        string mobileNo = txtMobile.Text;

        string connectionString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            try
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("Usp_InsertStudentRegistration", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@StudentID", studentID);
                    cmd.Parameters.AddWithValue("@StudentName", studentName);
                    cmd.Parameters.AddWithValue("@Subject", subject);
                    cmd.Parameters.AddWithValue("@Semester", semester);
                    cmd.Parameters.AddWithValue("@DateOfBirth", dob);
                    cmd.Parameters.AddWithValue("@MobileNo", mobileNo);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Record inserted successfully.";
                        lblMessage.CssClass = "alert alert-success alert-dismissible fade show";
                        lblMessage.Visible = true;
                    }
                    else
                    {
                        lblMessage.Text = "Insertion failed. StudentID must be unique.";
                        lblMessage.CssClass = "alert alert-warning alert-dismissible fade show";
                        lblMessage.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.CssClass = "alert alert-warning alert-dismissible fade show";
                lblMessage.Visible = true;
            }

        }
       
    }

    protected void btnClear_Click1(object sender, EventArgs e)
    {
        txtStudentName.Text = "";
        txtStudentID.Text = "";
        ddlSubject.SelectedIndex = 0;
        ddlSemester.SelectedIndex = 0;
        txtDOB.Text = "";
        txtMobile.Text = "";
        lblMessage.Visible = false;
    }
}
