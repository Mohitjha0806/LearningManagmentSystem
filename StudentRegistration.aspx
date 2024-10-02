<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="StudentRegistration.aspx.cs" Inherits="StudentRegistration" %>

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
                    <h1>Student Registration Form</h1>
                </div>
                <div class="card-body">
                    <asp:Panel ID="pnlStudentForm" runat="server">
                        <fieldset>
                            <legend>Student Registration</legend>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="txtStudentName" class="form-label">Student Name</label>
                                    <asp:TextBox ID="txtStudentName" CssClass="form-control" runat="server" placeholder="Enter Student Name" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvStudentName" runat="server" ControlToValidate="txtStudentName" ErrorMessage="Student Name is required." CssClass="text-danger form-label" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="txtStudentID" class="form-label">Student ID</label>
                                    <asp:TextBox ID="txtStudentID" CssClass="form-control" runat="server" placeholder="Enter Student ID" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvStudentID" runat="server" ControlToValidate="txtStudentID" ErrorMessage="Student ID is required." CssClass="text-danger form-label" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="ddlSubject" class="form-label">Subject</label>
                                    <asp:DropDownList ID="ddlSubject" CssClass="form-select" runat="server">
                                        <asp:ListItem Value="0" Text="Select Subject"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Mathematics"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Science"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="English"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="ddlSubject" InitialValue="0" ErrorMessage="Subject is required." CssClass="text-danger form-label" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="ddlSemester" class="form-label">Semester</label>
                                    <asp:DropDownList ID="ddlSemester" CssClass="form-select" runat="server">
                                        <asp:ListItem Value="0" Text="Select Semester"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="1st Semester"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="2nd Semester"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="3rd Semester"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvSemester" runat="server" ControlToValidate="ddlSemester" InitialValue="0" ErrorMessage="Semester is required." CssClass="text-danger form-label" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="txtDOB" class="form-label">Date of Birth</label>
                                    <asp:TextBox ID="txtDOB" CssClass="form-control" runat="server" type="date" placeholder="Enter Date of Birth"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB" ErrorMessage="Date of Birth is required." CssClass="text-danger form-label" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="txtMobile" class="form-label">Mobile Number</label>
                                    <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" type="Phone" placeholder="Enter Mobile Number" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile Number is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Invalid Mobile Number. It must be 10 digits." CssClass="text-danger form-label" ValidationExpression="^\d{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mb-3">
                                    <asp:Button ID="btnSubmit" Text="Submit" CssClass="btn btn-primary" runat="server" OnClick="Button1_Click" />
                                    <asp:Button ID="btnClear" Text="Clear" CssClass="btn btn-secondary" runat="server" />
                                    <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </fieldset>

                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

