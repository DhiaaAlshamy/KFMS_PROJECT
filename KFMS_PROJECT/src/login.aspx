<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="login.aspx.cs" Inherits="KFMS_PROJECT.src.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-light text-center">
                        <h3>Login</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="UsernameTextBox">Username:</label>
                            <asp:TextBox ID="UsernameTextBox" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="PasswordTextBox">Password:</label>
                            <asp:TextBox ID="PasswordTextBox" class="form-control" TextMode="Password" runat="server"></asp:TextBox>
                        </div>
                        <asp:Button ID="LoginButton"  style="background:#38a6aa; margin:20px" class="btn btn-primary btn-block" Text="Login" OnClick="LoginButton_Click" runat="server" />
                    </div>

                    <div class="card-footer text-center">
                        <p class="mb-0">Don't have an account? <a href="signup.aspx">Sign Up Here</a></p>
                        <p>Forgot Password? <a href="forget.html">Click here</a></p>
                        <p class="text-danger">
                            <asp:Literal ID="ErrorMessageLiteral" runat="server"></asp:Literal>
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
