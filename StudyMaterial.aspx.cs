using System;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Configuration;
using System.IO;

public partial class StudyMaterial : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnUpload_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Usp_InsertStudyMaterial", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        if (ddlSubject.SelectedIndex == 0 || ddlSemester.SelectedIndex == 0)
        {
            lblMessage.Text = "Please select a subject and semester.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Visible = true;
            return;
        }

        DateTime registrationDate;
        TimeSpan registrationTime;

        if (!DateTime.TryParse(txtDate.Text, out registrationDate))
        {
            lblMessage.Text = "Invalid Date format.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Visible = true;
            return;
        }

        if (!TimeSpan.TryParse(txtTime.Text, out registrationTime))
        {
            lblMessage.Text = "Invalid Time format.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Visible = true;
            return;
        }

        cmd.Parameters.AddWithValue("@Subject", ddlSubject.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@Semester", ddlSemester.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@RegistrationDate", registrationDate);
        cmd.Parameters.AddWithValue("@RegistrationTime", registrationTime);

        if (pdfUpload.HasFile)
        {
            if (pdfUpload.PostedFile.ContentLength > 200 * 1024) 
            {
                lblMessage.Text = "PDF file size should not exceed 200KB.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }
            else
            {
                byte[] pdfData = ConvertFileToBytes(pdfUpload.PostedFile);
                cmd.Parameters.AddWithValue("@PDFFile", pdfData);
            }
        }
        else
        {
            cmd.Parameters.AddWithValue("@PDFFile", DBNull.Value);
        }

        if (videoUpload.HasFile)
        {
            if (videoUpload.PostedFile.ContentLength > 500 * 1024)
            {
                lblMessage.Text = "Video file size should not exceed 500KB.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }
            else
            {
                byte[] videoData = ConvertFileToBytes(videoUpload.PostedFile);
                cmd.Parameters.AddWithValue("@VideoFile", videoData);
            }
        }
        else
        {
            cmd.Parameters.AddWithValue("@VideoFile", DBNull.Value);
        }

        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            lblMessage.Text = "Data inserted successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Visible = true;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Visible = true; 
        }
        finally
        {
            conn.Close();
        }


    }

    private byte[] ConvertFileToBytes(HttpPostedFile file)
    {
        using (BinaryReader br = new BinaryReader(file.InputStream))
        {
            return br.ReadBytes(file.ContentLength);
        }
    }

}
