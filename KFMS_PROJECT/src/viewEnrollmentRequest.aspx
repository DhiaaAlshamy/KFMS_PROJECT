<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="viewEnrollmentRequest.aspx.cs" Inherits="KFMS_PROJECT.src.viewEnrollmentRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header bg-light text-center">
                        <h3>Enrollment Requests Approval</h3>
                    </div>
                    <asp:FormView ID="EnrollmentFormView" runat="server" DefaultMode="ReadOnly">
                        <ItemTemplate>
                            <div class="card-body">
                                <div class="row text-right p-2 border-bottom border-1">
                                    <h5 style="color: #bea983">Applicant Personal Information معلومات المتقدم : </h5>

                                </div>
                                <div class="row">
                                    <!-- Left Column -->
                                    <div class="col-sm-6">
                                        <div class="paper-form-row p-2">
                                            <strong>Name (الاسم):</strong> <%# Eval("ApplicantName") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>ID Number (رقم الهوية):</strong> <%# Eval("IDNumber") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>Gender (الجنس):</strong> <%# Eval("Gender") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>Mobile Number (رقم الجوال):</strong> <%# Eval("MobileNumber") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>Extension Number (رقم التحويلة):</strong> <%# Eval("ExtensionNumber") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>Current Educational Degree (الدرجة التعليمية الحالية):</strong> <%# Eval("CurrentEducationalDegree") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>Applicant Major (تخصص المتقدم):</strong> <%# Eval("ApplicantMajor") %>
                                        </div>
                                    </div>

                                    <!-- Right Column -->
                                    <div class="col-sm-6">
                                        <div class="paper-form-row p-2">
                                            <strong>Position (الوظيفة):</strong> <%# Eval("Position") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>Job Classification (تصنيف الوظيفة):</strong> <%# Eval("JobClassification") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>R2 Hospital/Medical Center (مستشفى/مركز طبي R2):</strong> <%# Eval("R2HospitalMedicalCenter") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>Executive Administration (الإدارة التنفيذية):</strong> <%# Eval("ExecutiveAdministration") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>Department (القسم):</strong> <%# Eval("Department") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>Hospital ID Number (رقم هوية المستشفى):</strong> <%# Eval("HospitalIDNumber") %>
                                        </div>
                                        <div class="paper-form-row p-2">
                                            <strong>Employment Date at R2 (تاريخ التوظيف في R2):</strong>    
                                            <%# Convert.ToDateTime(Eval("EmploymentDateatR2")).ToString("yyyy-MM-dd") %>

                                        </div>
                                    </div>

                                    <!-- Affiliation Information -->
                                    <div class="row text-right p-2 pt-4 border-bottom border-top border-1">
                                        <h5 style="color: #bea983">Affiliation Information (معلومات الانتساب):</h5>
                                    </div>
                                    <div class="row">
                                        <!-- Left Column -->
                                        <div class="col-sm-6">
                                            <div class="paper-form-row p-2">
                                                <strong>Educational Institution Name (اسم المؤسسة التعليمية):</strong> <%# Eval("EducationalInstitutionName") %>
                                            </div>
                                            <div class="paper-form-row p-2">
                                                <strong>City (المدينة):</strong> <%# Eval("City") %>
                                            </div>
                                            <div class="paper-form-row p-2">
                                                <strong>Expected Degree (الدرجة المتوقعة):</strong> <%# Eval("ExpectedDegree") %>
                                            </div>
                                            <div class="paper-form-row p-2">
                                                <strong>Expected Major (التخصص المتوقع):</strong> <%# Eval("ExpectedMajor") %>
                                            </div>
                                            <div class="paper-form-row p-2">
                                                <strong>Semester Start Date (تاريخ بداية الفصل الدراسي):</strong>
                                                   <%# Convert.ToDateTime(Eval("SemesterStartDate")).ToString("yyyy-MM-dd") %>
                                            </div>
                                            <div class="paper-form-row p-2">
                                                <strong>Total Years of Education (إجمالي سنوات التعليم):</strong> <%# Eval("TotalYearsOfEducation") %>
                                            </div>
                                            <div class="paper-form-row p-2">
                                                <strong>Expected Graduation Date (تاريخ التخرج المتوقع):</strong>
                                                   <%# Convert.ToDateTime(Eval("ExpectedGraduationDate")).ToString("yyyy-MM-dd") %>
                                            </div>
                                        </div>
                                        <!-- Right Column -->
                                        <div class="col-sm-6">
                                            <div class="paper-form-row p-2">
                                                <asp:Button ID="DownloadCVButton" runat="server" CssClass="mw-100" Text="Download CV (تحميل السيرة الذاتية)" CommandName="DownloadAttachment" CommandArgument='<%# Eval("CVAttachment") %>' OnCommand="DownloadAttachment" />
                                            </div>
                                            <div class="paper-form-row p-2">
                                                <asp:Button ID="DownloadConsentFormButton" runat="server" CssClass="mw-100" Text="Download Consent Form (تحميل نموذج الموافقة)" CommandName="DownloadAttachment" CommandArgument='<%# Eval("ConsentFormAttachment") %>' OnCommand="DownloadAttachment" />
                                            </div>
                                            <div class="paper-form-row p-2">
                                                <asp:Button ID="DownloadAcceptanceLetterButton" runat="server" CssClass="mw-100" Text="Download Acceptance Letter (تحميل رسالة القبول)" CommandName="DownloadAttachment" CommandArgument='<%# Eval("AcceptanceLetterAttachment") %>' OnCommand="DownloadAttachment" />
                                            </div>
                                            <div class="paper-form-row p-2">
                                                <asp:Button ID="DownloadNationalIDButton" runat="server" CssClass="mw-100" Text="Download National ID (تحميل الهوية الوطنية)" CommandName="DownloadAttachment" CommandArgument='<%# Eval("NationalIDAttachment") %>' OnCommand="DownloadAttachment" />
                                            </div>
                                            <div class="paper-form-row p-2">
                                                <asp:Button ID="DownloadPerformanceEvaluationButton" CssClass="mw-100" runat="server" Text="Download Performance Evaluation (تحميل تقييم الأداء)" CommandName="DownloadAttachment" CommandArgument='<%# Eval("PerformanceEvaluationAttachment") %>' OnCommand="DownloadAttachment" />
                                            </div>
                                        </div>
                                    </div>

                                    <% if (Session["UserType"] != null && (Session["UserType"]?.ToString().Trim()) != "employee")
                                        { %>
                                    <div class="row text-right p-2 pt-4 border-bottom border-top border-1">
                                        <h5 style="color: #bea983">Applicant Administration Approval موافقة إدارة المتقدم : </h5>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <ol style="list-style-type: decimal;">
                                                <li>We support the affiliation request of the employee as per the information above.</li>
                                                <li>We certify that the number of affiliated employees for affiliation in the applicant’s department, including this applicant, does not exceed twenty percent (20%) of that department’s total full-time employees.</li>
                                            </ol>

                                        </div>

                                        <div class="col-sm-6">
                                            <ol style="list-style-type: decimal;">
                                                <li>ندعم طلب الانتساب المرفوع من الموظف بالتفاصيل المبينة أعلاه.</li>
                                                <li>نشهد بأن عدد الموظفين المنتسبين بالوحدة التي يعمل بها المتقدم، شاملاً المتقدم، لا يتجاوز عشرين بالمئة (20%) من مجموع الموظفين بعقد دائم بالقسم.</li>
                                            </ol>
                                        </div>

                                    </div>
                                    <% } %>
                                    <div class="card-footer text-center">
                                        <% if (Session["UserType"] != null && (Session["UserType"]?.ToString().Trim()) != "employee")
                                            { %>
                                        <asp:Button ID="ApproveButton" runat="server" CssClass="btn btn-success m-2" Style="background: #38a6aa"
                                            Text='<%# GetUserTypeButtonLabel(Session["UserType"]?.ToString().Trim()) %>'
                                            OnClick="ApproveButton_Click" CommandArgument='<%# Eval("RequestID") %>' />
                                        <% } %>
                                    </div> 

                                </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
