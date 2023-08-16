<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Employee.Master" CodeBehind="form1.aspx.cs" Inherits="KFMS_PROJECT.src.form1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-light text-center">
                        <h3>Request for Enrolling in an Education Institution as an Affiliated Student Form</h3>
                        <p>نموذج طلب الالتحاق بمنشأة تعليمية عن طريق الانتساب</p>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="NameTextBox">Name/ الاسم:</label>
                                    <asp:TextBox ID="NameTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="NameTextBox"
                                        ErrorMessage="Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="IDNumTextBox">ID Number/ رقم الهوية الوطنية:</label>
                                    <asp:TextBox ID="IDNumTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvIDNum" runat="server" ControlToValidate="IDNumTextBox"
                                        ErrorMessage="ID Number is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="MobileNumTextBox">Mobile Number/ رقم الجوال:</label>
                                    <asp:TextBox ID="MobileNumTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMobileNum" runat="server" ControlToValidate="MobileNumTextBox"
                                        ErrorMessage="Mobile Number is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="CurrentEduDegreeTextBox">Current Educational Degree/ أعلى درجة علمية حالية:</label>
                                    <asp:TextBox ID="CurrentEduDegreeTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCurrentEduDegree" runat="server" ControlToValidate="CurrentEduDegreeTextBox"
                                        ErrorMessage="Current Educational Degree is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="PositionTextBox">Position / الرتبة :</label>
                                    <asp:TextBox ID="PositionTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPosition" runat="server" ControlToValidate="PositionTextBox"
                                        ErrorMessage="Position is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="MedicalCenterDropdown">R2 Hospital/ Medical Center/ المنشأة:</label>
                                    <asp:DropDownList ID="MedicalCenterDropdown" class="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvMedicalCenter" runat="server" ControlToValidate="MedicalCenterDropdown"
                                        InitialValue="" ErrorMessage="Medical Center is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="ExecAdministraionTextBox">Executive Administration /  الإدارة :</label>
                                    <asp:TextBox ID="ExecAdministraionTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvExecAdministraion" runat="server" ControlToValidate="ExecAdministraionTextBox"
                                        ErrorMessage="Executive Administration is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="ImageUpload">Image Upload:</label>
                                    <asp:FileUpload ID="ImageUpload" class="form-control-file" runat="server" />
                                    <asp:RequiredFieldValidator ID="rfvImageUpload" runat="server" ControlToValidate="ImageUpload"
                                        ErrorMessage="Image Upload is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="GenderRadioButton">Gender/ الجنس:</label>
                                    <div class="form-check">
                                        <asp:RadioButton ID="MaleRadioButton" runat="server" Checked="true"/>
                                        <label class="form-check-label" for="MaleRadioButton">Male / ولد</label>
                                    </div>
                                    <div class="form-check">
                                        <asp:RadioButton ID="FemaleRadioButton" runat="server" />
                                        <label class="form-check-label" for="FemaleRadioButton">Female / بنت</label>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="ExtensionNumTextBox">Extension Number/ رقم التحويلة:</label>
                                    <asp:TextBox ID="ExtensionNumTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvExtensionNum" runat="server" ControlToValidate="ExtensionNumTextBox"
                                        ErrorMessage="Extension Number is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="MajorTextBox">Major / التخصص:</label>
                                    <asp:TextBox ID="MajorTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMajor" runat="server" ControlToValidate="MajorTextBox"
                                        ErrorMessage="Major is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="JobClassificationTextBox">Job Classification/ المسمى الوظيفي:</label>
                                    <asp:TextBox ID="JobClassificationTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvJobClassification" runat="server" ControlToValidate="JobClassificationTextBox"
                                        ErrorMessage="Job Classification is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="DepartmentTextBox">Department/ القسم:</label>
                                    <asp:TextBox ID="DepartmentTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDepartment" runat="server" ControlToValidate="DepartmentTextBox"
                                        ErrorMessage="Department is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="HospitalIDNumTextBox">Hospital ID Number /الرقم الوظيفي:</label>
                                    <asp:TextBox ID="HospitalIDNumTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvHospitalIDNum" runat="server" ControlToValidate="HospitalIDNumTextBox"
                                        ErrorMessage="Hospital ID Number is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="EmploymentDateTextBox">Employment Date at R2 /تاريخ التوظيف بمنشآت التجمع:</label>
                                    <asp:TextBox type="date" ID="EmploymentDateTextBox" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmploymentDate" runat="server" ControlToValidate="EmploymentDateTextBox"
                                        ErrorMessage="Employment Date is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-center m-2">
                        <asp:Button ID="SubmitButton" class="btn btn-primary btn-block" Text="Next" Style="background: #38a6aa" OnClick="SubmitButton_Click" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
