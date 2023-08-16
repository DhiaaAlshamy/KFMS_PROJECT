<%@ Page Language="C#"   MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="KFMS_PROJECT.src.adminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5 mx-auto">
            <h2>Admin Dashboard</h2>
            <div class="row ">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">New Enrollment Requests طلبات التحاق جديدة </div>
                        <div class="card-body">
                            <p>Total Enrollment Requests: <asp:Literal ID="newRequestsCountLiteral" runat="server"></asp:Literal></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">Approved Enrollment Requests طلبات الالتحاق الموافق عيها </div>
                        <div class="card-body">
                            <p>Total Approved Enrollment Requests: <asp:Literal ID="approvedRequestsCountLiteral" runat="server"></asp:Literal></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>