<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="ReportPage.aspx.cs" Inherits="ReportPage" %>

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
                    <h1>Students Data</h1>
                </div>
                <div class="card-body">
                    <asp:Panel ID="Panel1" runat="server">
                        <fieldset>


                            <legend>Students Registration Data</legend>



                            <asp:GridView runat="server" ID="GridView2" AutoGenerateColumns="false" CssClass="table table-bordered table-hover w-100 bg-transparent" DataKeyNames="ID">
                                <Columns>

                                    <asp:TemplateField HeaderText="Student ID" Visible="false" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("ID") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Student Name" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("StudentName") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Student ID" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("StudentID") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Subject" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("Subject")%>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Semester" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("Semester")%>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date Of Birth" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("DateOfBirth")%>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile Number" Visible="true" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <div class="d-flex justify-content-center align-items-center">
                                                <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("MobileNo")%>' runat="server" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                </Columns>
                            </asp:GridView>

                        </fieldset>
                    </asp:Panel>
                </div>
            </div>




            <div class="card">
                <div class="card-header">
                    <h1>PDFs and Videos</h1>
                </div>
                <div class="card-body">
                    <asp:Panel ID="pnlStudentForm" runat="server">
                        <fieldset>
                            <legend>Sort By Semester & Subject</legend>

                            <div class="row py-5">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlSubject" CssClass="form-select" runat="server" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="Select Subject" Text="Select Subject"></asp:ListItem>
                                        <asp:ListItem Value="Mathematics" Text="Mathematics"></asp:ListItem>
                                        <asp:ListItem Value="Science" Text="Science"></asp:ListItem>
                                        <asp:ListItem Value="English" Text="English"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlSemester" CssClass="form-select" runat="server" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="Select Semester" Text="Select Semester"></asp:ListItem>
                                        <asp:ListItem Value="1st Semester" Text="1st Semester"></asp:ListItem>
                                        <asp:ListItem Value="2nd Semester" Text="2nd Semester"></asp:ListItem>
                                        <asp:ListItem Value="3rd Semester" Text="3rd Semester"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>


                            <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="false" CssClass="table table-bordered table-hover w-100 bg-transparent" DataKeyNames="ID">
                                <Columns>


                                    <asp:TemplateField HeaderText="Subject" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("Subject") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Semester" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("Semester")%>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Upload Date" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("RegistrationDate")%>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Upload Time" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <asp:Label CssClass="d-flex justify-content-center align-items-center px-2 fw-semibold text-dark" Text='<%#Eval("RegistrationTime")%>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PDFs" Visible="true" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <div class="d-flex justify-content-center align-items-center">
                                                <a target="_blank" class="btn btn-primary btn-sm" href="assets1/sample.pdf">View PDF</a>
                                                <%--  <asp:HyperLink runat="server" NavigateUrl='<%# Eval("") %>' CssClass="btn btn-sm btn-default" Target="_blank">
                                                    <i class="fa fa-eye"></i>
                                                </asp:HyperLink>--%>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Video" Visible="true" HeaderStyle-CssClass="text-center fw-bolder text-dark">
                                        <ItemTemplate>
                                            <div class="d-flex justify-content-center align-items-center">
                                                <a class="btn btn-primary btn-sm" href="assets1/video%20500-.3gp">View Video</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </fieldset>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openPdf(pdfUrl) {
            window.open(pdfUrl, '_blank');
        }




    </script>


</asp:Content>
