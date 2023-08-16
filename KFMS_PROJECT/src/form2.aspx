<%@ Page Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="form2.aspx.cs" Inherits="KFMS_PROJECT.src.form2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-light text-center">
                        <h3>Affiliation Information معلومات الانتساب</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-borderless">
                            <tr>
                                <td>
                                    <label for="EducationalInstitutionDropdown">Educational Institution Name اسم المنشأة التعليمية:</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="EducationalInstitutionDropdown" class="form-control" runat="server">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvEducationalInstitution" runat="server" ControlToValidate="EducationalInstitutionDropdown"
                                        InitialValue="" ErrorMessage="Educational Institution Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="CityTextBox">City المدينة:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="CityTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="CityTextBox"
                                        ErrorMessage="City is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="ExpectedDegreeTextBox">Expected Degree الدرجة المطلوبة:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ExpectedDegreeTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvExpectedDegree" runat="server" ControlToValidate="ExpectedDegreeTextBox"
                                        ErrorMessage="Expected Degree is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="MajorTextBox">Major التخصص المطلوب:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="MajorTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMajor" runat="server" ControlToValidate="MajorTextBox"
                                        ErrorMessage="Major is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="SemesterStartDateTextBox">Semester Start Date تاريخ بداية الدراسة:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="SemesterStartDateTextBox" class="form-control" runat="server" type="date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSemesterStartDate" runat="server" ControlToValidate="SemesterStartDateTextBox"
                                        ErrorMessage="Semester Start Date is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="TotalYearsOfEducationTextBox">Total Years of Education مجموع مدة الدراسة:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalYearsOfEducationTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvTotalYearsOfEducation" runat="server" ControlToValidate="TotalYearsOfEducationTextBox"
                                        ErrorMessage="Total Years of Education is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="ExpectedGraduationDateTextBox">Expected Graduation Date تاريخ التخرج المتوقع:</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ExpectedGraduationDateTextBox" class="form-control" runat="server" type="date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvExpectedGraduationDate" runat="server" ControlToValidate="ExpectedGraduationDateTextBox"
                                        ErrorMessage="Expected Graduation Date is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>


                </div>
                <div class="card">
                    <div class="card-header bg-light text-center">
                        <h3>Attachments المرفقات المطلوبة:</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-borderless">
                            <tr>
                                <td>
                                    <label for="CVFile">Updated CV / سيرة ذاتية حديثة:</label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="CVFile" class="form-control-file" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfvCVFile" runat="server" ControlToValidate="CVFile"
                                        InitialValue="" ErrorMessage="Updated CV is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="NationalIDFile">National ID / الهوية الوطنية:</label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="NationalIDFile" class="form-control-file" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfvNationalIDFile" runat="server" ControlToValidate="NationalIDFile"
                                        InitialValue="" ErrorMessage="National ID is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="EvaluationFile">Last 2 years approved performance evaluation / تقييم العامين السابقين:</label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="EvaluationFile" class="form-control-file" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfvEvaluationFile" runat="server" ControlToValidate="EvaluationFile"
                                        InitialValue="" ErrorMessage="Performance evaluation is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="AcceptanceLetterFile">Acceptance letter from the Educational Institution / خطاب القبول من المنشأة التعليمية:</label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="AcceptanceLetterFile" class="form-control-file" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfvAcceptanceLetterFile" runat="server" ControlToValidate="AcceptanceLetterFile"
                                        InitialValue="" ErrorMessage="Acceptance letter is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="ConsentFormFile">Sign the attached consent form / توقيع التعهد المرفق:</label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="ConsentFormFile" class="form-control-file m-2" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfvConsentFormFile" runat="server" ControlToValidate="ConsentFormFile"
                                        InitialValue="" ErrorMessage="Consent form is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="card-footer text-center">
                        <asp:Button ID="SubmitButton" class="btn btn-primary btn-block m-2" Style="background: #38a6aa" Text="Next" OnClick="SubmitButton_Click" runat="server" />
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
