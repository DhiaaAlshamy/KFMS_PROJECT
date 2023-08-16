<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="signup.aspx.cs" Inherits="KFMS_PROJECT.src.signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-light text-center">
                        <h3>Sign Up</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="PhoneNumberTextBox">Phone Number: رقم الهاتف</label>
                            <asp:TextBox ID="PhoneNumberTextBox" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="PhoneNumberTextBox"
                                ErrorMessage="Phone Number is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="EmailTextBox">Email: البريد الالكتروني</label>
                            <asp:TextBox ID="EmailTextBox" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="EmailTextBox"
                                ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="UsernameTextBox">Username: اسم المستخدم</label>
                            <asp:TextBox ID="UsernameTextBox" class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="UsernameTextBox"
                                ErrorMessage="Username is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="PasswordTextBox">Password: كلمة السر</label>
                            <asp:TextBox ID="PasswordTextBox" class="form-control" TextMode="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="PasswordTextBox"
                                ErrorMessage="Password is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="card-footer text-center">
                        <asp:Button ID="SubmitButton" Style="background: #38a6aa" class="btn btn-primary btn-block" Text="Submit" OnClick="SignUpButton_Click" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
