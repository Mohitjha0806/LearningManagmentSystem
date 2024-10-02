<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="StudyMaterial.aspx.cs" Inherits="StudyMaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        fieldset {
            border: 1px solid #CB0C9F;
            border-radius: 0.5rem;
            padding: 0.5rem 2rem;
            width: auto;
            border-color: #CB0C9F;
            background-color: #f8f9fa;
        }

        legend {
            border-color: #CB0C9F;
            border-radius: 0.5rem;
            padding: 0.3rem 0.5rem;
            border: 1px solid #CB0C9F;
            color: #000000;
            width: auto;
            margin-top: -2%;
            float: initial;
            font-size: 0.8rem;
            font-weight: 600;
            background-color: white;
        }
    </style>
    <div class="container-fluid">
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <h1>Upload Study Material</h1>
                </div>
                <div class="card-body">
                    <asp:Panel ID="pnlStudentForm" runat="server">
                        <fieldset>
                            <legend>Study Material</legend>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="ddlSubject" class="form-label">Subject</label>
                                    <asp:DropDownList ID="ddlSubject" CssClass="form-select" runat="server">
                                        <asp:ListItem Value="0" Text="Select Subject"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Mathematics"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Science"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="English"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="ddlSubject"
                                        ErrorMessage="Please select a subject." CssClass="form-label text-danger"
                                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="ddlSemester" class="form-label">Semester</label>
                                    <asp:DropDownList ID="ddlSemester" CssClass="form-select" runat="server">
                                        <asp:ListItem Value="0" Text="Select Semester"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="1st Semester"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="2nd Semester"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="3rd Semester"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvSemester" runat="server" ControlToValidate="ddlSemester"
                                        ErrorMessage="Please select a semester." CssClass="form-label text-danger"
                                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="txtDate" class="form-label">Date</label>
                                    <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" type="date" placeholder="Enter Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                                        ErrorMessage="Date is required." CssClass="form-label text-danger"
                                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="txtTime" class="form-label">Time</label>
                                    <asp:TextBox ID="txtTime" CssClass="form-control" runat="server" type="time" placeholder="Enter Time"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvTime" runat="server" ControlToValidate="txtTime"
                                        ErrorMessage="Time is required." CssClass="form-label text-danger"
                                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="filePDF" class="form-label">Upload PDF (Under 500KB)</label>
                                    <asp:FileUpload ID="pdfUpload" CssClass="form-control" runat="server" />
                                    <asp:RegularExpressionValidator ID="revPDF" runat="server" ControlToValidate="pdfUpload"
                                        ErrorMessage="Please upload a valid PDF file." CssClass="form-label text-danger"
                                        Display="Dynamic" ForeColor="Red"
                                        ValidationExpression=".*\.pdf$"></asp:RegularExpressionValidator>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="fileVideo" class="form-label">Upload Video (Under 500KB)</label>
                                    <asp:FileUpload ID="videoUpload" CssClass="form-control" runat="server" />
                                    <asp:RegularExpressionValidator ID="revVideo" runat="server" ControlToValidate="videoUpload"
                                        ErrorMessage="Please upload a valid video file." CssClass="form-label text-danger"
                                        Display="Dynamic" ForeColor="Red"
                                        ValidationExpression=".*\.(mp4|avi|mov)$"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col mb-3">
                                    <asp:Button ID="btnUpload" Text="Upload" CssClass="btn btn-primary" runat="server" OnClick="btnUpload_Click" />
                                    <asp:Button ID="btnClear" Text="Clear" CssClass="btn btn-secondary" runat="server" />
                                    <asp:Label ID="lblMessage" CssClass="alert" runat="server" Visible="false"></asp:Label>
                                </div>
                            </div>

                        </fieldset>

                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
