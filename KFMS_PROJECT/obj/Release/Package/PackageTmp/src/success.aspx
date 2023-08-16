<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="success.aspx.cs" Inherits="KFMS_PROJECT.src.success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div style="text-align: center; margin-top: 100px;">
        <h1>Enrollment Request Submitted Successfully تم ارسال طلبك بنجاح  </h1>
        <p>Your enrollment request has been successfully submitted. Thank you for your application.</p>

            <a href="myEnrollmentRequests.aspx" class="btn btn-primary btn-block m-2" style="background:#38a6aa"  > Go Back </a>

    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonContent" runat="server">
</asp:Content>
