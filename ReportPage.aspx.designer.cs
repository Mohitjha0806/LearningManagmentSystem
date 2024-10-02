using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LearningManagmentSystem
{

    public partial class ReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDropdowns();
            }
        }
        private void PopulateDropdowns()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("Usp_GetSemestersAndSubjects", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // Populate Semester dropdown
                ddlSemester.DataSource = reader;
                ddlSemester.DataTextField = "Semester";
                ddlSemester.DataValueField = "Semester";
                ddlSemester.DataBind();
                ddlSemester.Items.Insert(0, new ListItem("Select Semester", "0"));

                // Move to next result for Subject dropdown
                reader.NextResult();

                ddlSubject.DataSource = reader;
                ddlSubject.DataTextField = "Subject";
                ddlSubject.DataValueField = "Subject";
                ddlSubject.DataBind();
                ddlSubject.Items.Insert(0, new ListItem("Select Subject", "0"));
            }
        }

        protected void btnViewPDF_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int studyMaterialId = Convert.ToInt32(btn.CommandArgument);

            // Redirect to the PDF view page with the study material ID
            Response.Redirect("ViewPDF.aspx?ID=" + studyMaterialId);
        }

        protected void btnViewVideo_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int studyMaterialId = Convert.ToInt32(btn.CommandArgument);

            // Fetch the video file from database and play in modal
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT VideoFile FROM tblStudyMaterial WHERE ID = @ID", conn);
                cmd.Parameters.AddWithValue("@ID", studyMaterialId);

                conn.Open();
                byte[] videoData = (byte[])cmd.ExecuteScalar();

                if (videoData != null)
                {
                    string videoBase64 = Convert.ToBase64String(videoData);
                    string videoUrl = "data:video/mp4;base64," + videoBase64;

                    ClientScript.RegisterStartupScript(this.GetType(), "PlayVideo", $"$('#videoModal').modal('show'); $('#videoSource').attr('src', '{videoUrl}'); $('#videoPlayer')[0].load();", true);
                }
            }
        }
    }

